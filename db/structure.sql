--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: exercises; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE exercises (
    id integer NOT NULL,
    workout_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying
);


--
-- Name: exercises_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE exercises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exercises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE exercises_id_seq OWNED BY exercises.id;


--
-- Name: flaggings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE flaggings (
    id integer NOT NULL,
    flaggable_type character varying,
    flaggable_id integer,
    flagger_type character varying,
    flagger_id integer,
    reason text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: flaggings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE flaggings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flaggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE flaggings_id_seq OWNED BY flaggings.id;


--
-- Name: follows; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE follows (
    id integer NOT NULL,
    followable_id integer NOT NULL,
    followable_type character varying NOT NULL,
    follower_id integer NOT NULL,
    follower_type character varying NOT NULL,
    blocked boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE follows_id_seq OWNED BY follows.id;


--
-- Name: pictures; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pictures (
    id integer NOT NULL,
    caption character varying,
    attachment character varying,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    bora character varying,
    workout_id integer,
    flagged character varying
);


--
-- Name: pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pictures_id_seq OWNED BY pictures.id;


--
-- Name: reps; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reps (
    id integer NOT NULL,
    xset_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    weight integer,
    reps integer
);


--
-- Name: reps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE reps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE reps_id_seq OWNED BY reps.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: suggestions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE suggestions (
    id integer NOT NULL,
    subject character varying,
    body character varying,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: suggestions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE suggestions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: suggestions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE suggestions_id_seq OWNED BY suggestions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    username character varying,
    preferences hstore,
    before integer,
    after integer,
    stats_before hstore,
    stats_after hstore,
    weight_type character varying,
    flaggings_count integer
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: workout_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE workout_types (
    id integer NOT NULL,
    name character varying,
    guide character varying,
    mechanics character varying,
    workout_type character varying,
    level character varying,
    main_muscle character varying,
    other_muscles character varying,
    force character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: workout_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE workout_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workout_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE workout_types_id_seq OWNED BY workout_types.id;


--
-- Name: workouts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE workouts (
    id integer NOT NULL,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    volume character varying,
    date date,
    flaggings_count integer
);


--
-- Name: workouts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE workouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE workouts_id_seq OWNED BY workouts.id;


--
-- Name: xsets; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE xsets (
    id integer NOT NULL,
    exercise_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    number integer
);


--
-- Name: xsets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE xsets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: xsets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE xsets_id_seq OWNED BY xsets.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY exercises ALTER COLUMN id SET DEFAULT nextval('exercises_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY flaggings ALTER COLUMN id SET DEFAULT nextval('flaggings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY follows ALTER COLUMN id SET DEFAULT nextval('follows_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pictures ALTER COLUMN id SET DEFAULT nextval('pictures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY reps ALTER COLUMN id SET DEFAULT nextval('reps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY suggestions ALTER COLUMN id SET DEFAULT nextval('suggestions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY workout_types ALTER COLUMN id SET DEFAULT nextval('workout_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY workouts ALTER COLUMN id SET DEFAULT nextval('workouts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY xsets ALTER COLUMN id SET DEFAULT nextval('xsets_id_seq'::regclass);


--
-- Name: exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY exercises
    ADD CONSTRAINT exercises_pkey PRIMARY KEY (id);


--
-- Name: flaggings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY flaggings
    ADD CONSTRAINT flaggings_pkey PRIMARY KEY (id);


--
-- Name: follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id);


--
-- Name: pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pictures
    ADD CONSTRAINT pictures_pkey PRIMARY KEY (id);


--
-- Name: reps_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reps
    ADD CONSTRAINT reps_pkey PRIMARY KEY (id);


--
-- Name: suggestions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY suggestions
    ADD CONSTRAINT suggestions_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: workout_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY workout_types
    ADD CONSTRAINT workout_types_pkey PRIMARY KEY (id);


--
-- Name: workouts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY workouts
    ADD CONSTRAINT workouts_pkey PRIMARY KEY (id);


--
-- Name: xsets_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY xsets
    ADD CONSTRAINT xsets_pkey PRIMARY KEY (id);


--
-- Name: access_flaggings; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX access_flaggings ON flaggings USING btree (flagger_type, flagger_id, flaggable_type, flaggable_id);


--
-- Name: fk_followables; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fk_followables ON follows USING btree (followable_id, followable_type);


--
-- Name: fk_follows; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fk_follows ON follows USING btree (follower_id, follower_type);


--
-- Name: index_exercises_on_workout_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_exercises_on_workout_id ON exercises USING btree (workout_id);


--
-- Name: index_flaggings_on_flaggable_type_and_flaggable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_flaggings_on_flaggable_type_and_flaggable_id ON flaggings USING btree (flaggable_type, flaggable_id);


--
-- Name: index_pictures_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_pictures_on_user_id ON pictures USING btree (user_id);


--
-- Name: index_pictures_on_user_id_and_attachment; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_pictures_on_user_id_and_attachment ON pictures USING btree (user_id, attachment);


--
-- Name: index_pictures_on_workout_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_pictures_on_workout_id ON pictures USING btree (workout_id);


--
-- Name: index_reps_on_xset_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_reps_on_xset_id ON reps USING btree (xset_id);


--
-- Name: index_suggestions_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_suggestions_on_user_id ON suggestions USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_preferences; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_preferences ON users USING gist (preferences);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_stats_after; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_stats_after ON users USING gist (stats_after);


--
-- Name: index_users_on_stats_before; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_stats_before ON users USING gist (stats_before);


--
-- Name: index_workouts_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_workouts_on_user_id ON workouts USING btree (user_id);


--
-- Name: index_xsets_on_exercise_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_xsets_on_exercise_id ON xsets USING btree (exercise_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_0f1d9d11d1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pictures
    ADD CONSTRAINT fk_rails_0f1d9d11d1 FOREIGN KEY (workout_id) REFERENCES workouts(id);


--
-- Name: fk_rails_665d500cdc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exercises
    ADD CONSTRAINT fk_rails_665d500cdc FOREIGN KEY (workout_id) REFERENCES workouts(id);


--
-- Name: fk_rails_75b776f840; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY workouts
    ADD CONSTRAINT fk_rails_75b776f840 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_82fb49538a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY xsets
    ADD CONSTRAINT fk_rails_82fb49538a FOREIGN KEY (exercise_id) REFERENCES exercises(id);


--
-- Name: fk_rails_8ff78eebfe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reps
    ADD CONSTRAINT fk_rails_8ff78eebfe FOREIGN KEY (xset_id) REFERENCES xsets(id);


--
-- Name: fk_rails_b4a11e220a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pictures
    ADD CONSTRAINT fk_rails_b4a11e220a FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_c08cf651b8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY suggestions
    ADD CONSTRAINT fk_rails_c08cf651b8 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20151101180046');

INSERT INTO schema_migrations (version) VALUES ('20151102014041');

INSERT INTO schema_migrations (version) VALUES ('20151108003419');

INSERT INTO schema_migrations (version) VALUES ('20151108003752');

INSERT INTO schema_migrations (version) VALUES ('20151108170423');

INSERT INTO schema_migrations (version) VALUES ('20151114150501');

INSERT INTO schema_migrations (version) VALUES ('20151121002411');

INSERT INTO schema_migrations (version) VALUES ('20151204231927');

INSERT INTO schema_migrations (version) VALUES ('20151215010844');

INSERT INTO schema_migrations (version) VALUES ('20151220171704');

INSERT INTO schema_migrations (version) VALUES ('20151220172443');

INSERT INTO schema_migrations (version) VALUES ('20151220173442');

INSERT INTO schema_migrations (version) VALUES ('20151231030328');

INSERT INTO schema_migrations (version) VALUES ('20151231030420');

INSERT INTO schema_migrations (version) VALUES ('20160201143953');

INSERT INTO schema_migrations (version) VALUES ('20160201171019');

INSERT INTO schema_migrations (version) VALUES ('20160209213201');

INSERT INTO schema_migrations (version) VALUES ('20160210195423');

INSERT INTO schema_migrations (version) VALUES ('20160210200543');

INSERT INTO schema_migrations (version) VALUES ('20160215184347');

INSERT INTO schema_migrations (version) VALUES ('20160215184657');

INSERT INTO schema_migrations (version) VALUES ('20160215184829');

INSERT INTO schema_migrations (version) VALUES ('20160216001940');

INSERT INTO schema_migrations (version) VALUES ('20160216002443');

INSERT INTO schema_migrations (version) VALUES ('20160216004847');

INSERT INTO schema_migrations (version) VALUES ('20160216125955');

INSERT INTO schema_migrations (version) VALUES ('20160216130134');

INSERT INTO schema_migrations (version) VALUES ('20160216152253');

INSERT INTO schema_migrations (version) VALUES ('20160216153038');

INSERT INTO schema_migrations (version) VALUES ('20160216225418');

INSERT INTO schema_migrations (version) VALUES ('20160218165819');

INSERT INTO schema_migrations (version) VALUES ('20160219214947');

INSERT INTO schema_migrations (version) VALUES ('20160225081609');

INSERT INTO schema_migrations (version) VALUES ('20160311064001');

INSERT INTO schema_migrations (version) VALUES ('20160314234929');

INSERT INTO schema_migrations (version) VALUES ('20160315051235');

INSERT INTO schema_migrations (version) VALUES ('20160315170750');

INSERT INTO schema_migrations (version) VALUES ('20160315222635');

