--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE test;




--
-- Drop roles
--

DROP ROLE test;


--
-- Roles
--

CREATE ROLE test;
ALTER ROLE test WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md505a671c66aefea124cc08b76ea6d30bb';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: test
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO test;

\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: test
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: test
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: test
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: test
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO test;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: test
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "test" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: test; Type: DATABASE; Schema: -; Owner: test
--

CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE test OWNER TO test;

\connect test

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comment_info; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.comment_info (
    post_id character varying(255) NOT NULL,
    comment_text character varying(255) NOT NULL,
    user_id_name character varying(255) NOT NULL,
    comment_user_id character varying(255) NOT NULL,
    comment_date date NOT NULL
);


ALTER TABLE public.comment_info OWNER TO test;

--
-- Name: facebook_posts; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.facebook_posts (
    post_id character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    post_text character varying(255) NOT NULL,
    post_date date NOT NULL
);


ALTER TABLE public.facebook_posts OWNER TO test;

--
-- Data for Name: comment_info; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.comment_info (post_id, comment_text, user_id_name, comment_user_id, comment_date) FROM stdin;
108951291451280_108913241455085	test_comment	Laterali Wassmelle	108951291451280	2021-07-04
108951291451280_107769891569420	HT - Half Time	Laterali Wassmelle	108951291451280	2021-07-03
108951291451280_107761478236928	Лучше играют датчане, но Цоуфал и Случек могут вполне вернуться в игру как делал Вест Хэм в прошедшем сезоне. 	Laterali Wassmelle	108951291451280	2021-07-03
\.


--
-- Data for Name: facebook_posts; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.facebook_posts (post_id, user_id, post_text, post_date) FROM stdin;
108951291451280_108913241455085	108951291451280	TEST_TEST	2021-07-04
108951291451280_107832234896519	108951291451280	Дания - Чехия 2-1 FT	2021-07-03
108951291451280_107819638231112	108951291451280	Выдра вместо Шика 2-1 в пользу Дании пока	2021-07-03
108951291451280_107806291565780	108951291451280	Поульсен случайно попал шипом в висок Соучеку, последнего перевязали игра продолжилась через 2 минуты. На поле Соучек.	2021-07-03
108951291451280_107789434900799	108951291451280	Шик 1-2	2021-07-03
108951291451280_107769891569420	108951291451280	CZR 0 - 2 DEN HT	2021-07-03
108951291451280_107761478236928	108951291451280	2-0 КААААСПЕР ДООООЛЬБЕРГ. Мелле - ГОЛЕВАЯ - внешней идеально вырезал!!!	2021-07-03
108951291451280_107760241570385	108951291451280	Датчане играют Delaney 1-0. Wass в составе Melle нет.	2021-07-03
108951291451280_107758101570599	108951291451280	Я родился на FB во время Дания - Чехия.	2021-07-03
\.


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

