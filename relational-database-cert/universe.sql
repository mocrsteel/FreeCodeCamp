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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: cluster_star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cluster_star (
    cluster_star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.cluster_star OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(50),
    galaxy_size_mil_lightyears integer NOT NULL,
    is_spherical boolean NOT NULL,
    age_millions numeric NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    moon_type character varying(50),
    moon_size_km numeric NOT NULL,
    distance_planet_mil_km integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50),
    planet_size_km numeric NOT NULL,
    distance_star_mil_km integer NOT NULL,
    has_life boolean NOT NULL,
    planet_life text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(50) NOT NULL,
    star_size_km numeric NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: cluster_star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cluster_star VALUES (1, 'CLUSRT1', 2);
INSERT INTO public.cluster_star VALUES (2, 'CLUSRT2', 4);
INSERT INTO public.cluster_star VALUES (3, 'CLUSRT3', 1);
INSERT INTO public.cluster_star VALUES (4, 'CLUSRT4', 2);
INSERT INTO public.cluster_star VALUES (5, 'CLUSRT5', 4);
INSERT INTO public.cluster_star VALUES (6, 'CLUSRT6', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'andromeda', 'orange', 1203449, false, 120394);
INSERT INTO public.galaxy VALUES (2, 'hopopota', 'orange', 12304192, true, 349201);
INSERT INTO public.galaxy VALUES (3, 'protota', 'blue', 94739, false, 2048267834);
INSERT INTO public.galaxy VALUES (4, 'isotopa', 'red', 349237, true, 49202184);
INSERT INTO public.galaxy VALUES (5, 'istari', 'green', 30287, false, 4012839040);
INSERT INTO public.galaxy VALUES (6, 'exostariato', 'blue', 39032820, true, 402840);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'AST1', 7, 'rock', 34938, 2035493);
INSERT INTO public.moon VALUES (2, 'AST2', 7, 'rock', 34938, 29130493);
INSERT INTO public.moon VALUES (3, 'AST3', 7, 'ice', 31443, 215304393);
INSERT INTO public.moon VALUES (4, 'AST4', 7, 'ice', 31443, 6420493);
INSERT INTO public.moon VALUES (5, 'AST5', 7, 'ice', 31443, 614130493);
INSERT INTO public.moon VALUES (6, 'MER3', 1, 'rock', 31443, 7530493);
INSERT INTO public.moon VALUES (7, 'ARC2', 11, 'rock', 34938, 23530493);
INSERT INTO public.moon VALUES (8, 'SUP5', 4, 'rock', 31443, 3150493);
INSERT INTO public.moon VALUES (9, 'SUP6', 4, 'rock', 31443, 3150493);
INSERT INTO public.moon VALUES (10, 'ELT1', 5, 'rock', 31443, 3150493);
INSERT INTO public.moon VALUES (11, 'ELT2', 5, 'rock', 31443, 3150493);
INSERT INTO public.moon VALUES (12, 'ELT3', 5, 'rock', 31443, 3150493);
INSERT INTO public.moon VALUES (13, 'ELT4', 5, 'rock', 31443, 3150493);
INSERT INTO public.moon VALUES (14, 'ELT5', 5, 'rock', 31443, 3150493);
INSERT INTO public.moon VALUES (15, 'ELT13', 5, 'rock', 31443, 3150493);
INSERT INTO public.moon VALUES (16, 'ELTX1', 8, 'rock', 31443, 3150493);
INSERT INTO public.moon VALUES (17, 'ELTX2', 8, 'rock', 31443, 3150493);
INSERT INTO public.moon VALUES (18, 'ELTX3', 8, 'rock', 31443, 3150493);
INSERT INTO public.moon VALUES (19, 'ELTX4', 8, 'rock', 31443, 3150493);
INSERT INTO public.moon VALUES (20, 'ELTX5', 8, 'rock', 31443, 3150493);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'aegea', 2, 'rock ball', 2039, 219394039, true, 'strange lifeforms without plants and lots of lava');
INSERT INTO public.planet VALUES (2, 'neptune', 2, 'ice dwarf', 120, 3931283, false, '');
INSERT INTO public.planet VALUES (3, 'saturn', 1, 'gas giant', 291390, 219138, false, '');
INSERT INTO public.planet VALUES (4, 'mars', 2, 'rock ball', 210391, 3103039, true, 'bacterial');
INSERT INTO public.planet VALUES (5, 'pluto', 5, '', 3013930, 301949, false, '');
INSERT INTO public.planet VALUES (6, 'struvorcj', 2, 'gas giant', 1039203930, 2193091, true, 'bacterial suspsended');
INSERT INTO public.planet VALUES (7, 'jfdskalf', 4, 'rock ball', 2013939, 219384103, false, '');
INSERT INTO public.planet VALUES (8, 'fjdskl13', 3, 'metal planet', 3103920, 213939103, true, 'metal eating bacteria');
INSERT INTO public.planet VALUES (9, 'dfjklgi334', 2, 'metal giant', 2103034940, 214839010, true, 'giant worms');
INSERT INTO public.planet VALUES (10, 'jkduiui234', 2, 'metal giant', 293819048, 229483, false, '');
INSERT INTO public.planet VALUES (11, 'astonomica', 2, 'rock ball', 29319, 20139930, false, '');
INSERT INTO public.planet VALUES (12, 'gigantus', 4, 'gas giant', 219304, 39239130, false, '');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'EPB20392', 3, 'brown dwarf', 31239034);
INSERT INTO public.star VALUES (2, 'DOSP40302', 2, 'blue giant', 391203319);
INSERT INTO public.star VALUES (3, 'FJSL59403', 2, 'yellow sun', 393290138);
INSERT INTO public.star VALUES (4, 'FDL391038', 1, 'pulsar', 3912310);
INSERT INTO public.star VALUES (5, 'FDSL3901930', 4, 'neutron star', 31931039);
INSERT INTO public.star VALUES (6, 'SLDP92920', 5, 'blue giant', 319104);


--
-- Name: cluster_star cluster_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster_star
    ADD CONSTRAINT cluster_star_name_key UNIQUE (name);


--
-- Name: cluster_star cluster_star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster_star
    ADD CONSTRAINT cluster_star_pkey PRIMARY KEY (cluster_star_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: cluster_star cluster_star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster_star
    ADD CONSTRAINT cluster_star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet plantes_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT plantes_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

