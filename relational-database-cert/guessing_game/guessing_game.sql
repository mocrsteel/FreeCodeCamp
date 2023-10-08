--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    tries integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (94, 112, 12);
INSERT INTO public.games VALUES (95, 113, 13);
INSERT INTO public.games VALUES (96, 114, 461);
INSERT INTO public.games VALUES (97, 114, 243);
INSERT INTO public.games VALUES (98, 115, 494);
INSERT INTO public.games VALUES (99, 115, 38);
INSERT INTO public.games VALUES (100, 114, 946);
INSERT INTO public.games VALUES (101, 114, 265);
INSERT INTO public.games VALUES (102, 114, 838);
INSERT INTO public.games VALUES (103, 116, 594);
INSERT INTO public.games VALUES (104, 116, 355);
INSERT INTO public.games VALUES (105, 117, 623);
INSERT INTO public.games VALUES (106, 117, 64);
INSERT INTO public.games VALUES (107, 116, 766);
INSERT INTO public.games VALUES (108, 116, 881);
INSERT INTO public.games VALUES (109, 116, 292);
INSERT INTO public.games VALUES (110, 118, 123);
INSERT INTO public.games VALUES (111, 118, 137);
INSERT INTO public.games VALUES (112, 119, 663);
INSERT INTO public.games VALUES (113, 119, 297);
INSERT INTO public.games VALUES (114, 118, 242);
INSERT INTO public.games VALUES (115, 118, 820);
INSERT INTO public.games VALUES (116, 118, 199);
INSERT INTO public.games VALUES (117, 120, 623);
INSERT INTO public.games VALUES (118, 120, 734);
INSERT INTO public.games VALUES (119, 121, 27);
INSERT INTO public.games VALUES (120, 121, 862);
INSERT INTO public.games VALUES (121, 120, 167);
INSERT INTO public.games VALUES (122, 120, 870);
INSERT INTO public.games VALUES (123, 120, 321);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (112, 'yannick');
INSERT INTO public.users VALUES (113, 'vincent');
INSERT INTO public.users VALUES (114, 'user_1696770360066');
INSERT INTO public.users VALUES (115, 'user_1696770360065');
INSERT INTO public.users VALUES (116, 'user_1696770405573');
INSERT INTO public.users VALUES (117, 'user_1696770405572');
INSERT INTO public.users VALUES (118, 'user_1696770406847');
INSERT INTO public.users VALUES (119, 'user_1696770406846');
INSERT INTO public.users VALUES (120, 'user_1696770419672');
INSERT INTO public.users VALUES (121, 'user_1696770419671');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 123, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 121, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

