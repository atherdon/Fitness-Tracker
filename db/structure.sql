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
    workout_id integer
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
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


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
    stats hstore
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
-- Name: workouts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE workouts (
    id integer NOT NULL,
    user_id integer,
    exercises hstore,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
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
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pictures ALTER COLUMN id SET DEFAULT nextval('pictures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY workouts ALTER COLUMN id SET DEFAULT nextval('workouts_id_seq'::regclass);


--
-- Name: pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pictures
    ADD CONSTRAINT pictures_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: workouts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY workouts
    ADD CONSTRAINT workouts_pkey PRIMARY KEY (id);


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
-- Name: index_users_on_stats; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_stats ON users USING gist (stats);


--
-- Name: index_workouts_on_exercises; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_workouts_on_exercises ON workouts USING gist (exercises);


--
-- Name: index_workouts_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_workouts_on_user_id ON workouts USING btree (user_id);


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
-- Name: fk_rails_75b776f840; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY workouts
    ADD CONSTRAINT fk_rails_75b776f840 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_b4a11e220a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pictures
    ADD CONSTRAINT fk_rails_b4a11e220a FOREIGN KEY (user_id) REFERENCES users(id);


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

