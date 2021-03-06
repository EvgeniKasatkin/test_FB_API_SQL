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
-- Name: second_task; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.second_task (
    user_id character varying(255) NOT NULL,
    "time" date NOT NULL,
    source character varying(255) NOT NULL,
    medium character varying(255) NOT NULL,
    registrations integer NOT NULL
);


ALTER TABLE public.second_task OWNER TO test;

--
-- Data for Name: comment_info; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.comment_info (post_id, comment_text, user_id_name, comment_user_id, comment_date) FROM stdin;
108951291451280_108913241455085	test_comment	Laterali Wassmelle	108951291451280	2021-07-04
108951291451280_107769891569420	HT - Half Time	Laterali Wassmelle	108951291451280	2021-07-03
108951291451280_107761478236928	?????????? ???????????? ??????????????, ???? ???????????? ?? ???????????? ?????????? ???????????? ?????????????????? ?? ???????? ?????? ?????????? ???????? ?????? ?? ?????????????????? ????????????. 	Laterali Wassmelle	108951291451280	2021-07-03
\.


--
-- Data for Name: facebook_posts; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.facebook_posts (post_id, user_id, post_text, post_date) FROM stdin;
108951291451280_108913241455085	108951291451280	TEST_TEST	2021-07-04
108951291451280_107832234896519	108951291451280	?????????? - ?????????? 2-1 FT	2021-07-03
108951291451280_107819638231112	108951291451280	?????????? ???????????? ???????? 2-1 ?? ???????????? ?????????? ????????	2021-07-03
108951291451280_107806291565780	108951291451280	???????????????? ???????????????? ?????????? ?????????? ?? ?????????? ??????????????, ???????????????????? ???????????????????? ???????? ???????????????????????? ?????????? 2 ????????????. ???? ???????? ????????????.	2021-07-03
108951291451280_107789434900799	108951291451280	?????? 1-2	2021-07-03
108951291451280_107769891569420	108951291451280	CZR 0 - 2 DEN HT	2021-07-03
108951291451280_107761478236928	108951291451280	2-0 ?????????????????? ??????????????????????. ?????????? - ?????????????? - ?????????????? ???????????????? ??????????????!!!	2021-07-03
108951291451280_107760241570385	108951291451280	?????????????? ???????????? Delaney 1-0. Wass ?? ?????????????? Melle ??????.	2021-07-03
108951291451280_107758101570599	108951291451280	?? ?????????????? ???? FB ???? ?????????? ?????????? - ??????????.	2021-07-03
\.


--
-- Data for Name: second_task; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.second_task (user_id, "time", source, medium, registrations) FROM stdin;
1	2021-01-05	blog	promo	0
1	2021-02-05	google	organic	1
2	2021-01-05	google	cpc	0
2	2021-02-05	blog	promo	0
2	2021-03-05	google	organic	0
2	2021-04-05	google	cpc	0
2	2021-05-05	google	organic	0
2	2021-06-05	direct	none	0
2	2021-07-05	direct	none	1
3	2021-01-05	google	cpc	1
3	2021-02-05	blog	promo	0
3	2021-03-05	google	cpc	0
\.


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

