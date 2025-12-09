--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(150) NOT NULL,
    galaxy_id integer NOT NULL,
    diameter_km integer,
    composition character varying(80),
    potentially_hazardous boolean DEFAULT false,
    notes text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(150) NOT NULL,
    galaxy_type character varying(60),
    distance_from_earth numeric(12,3) NOT NULL,
    num_stars bigint NOT NULL,
    description text,
    has_life boolean DEFAULT false,
    is_visible boolean DEFAULT true
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(150) NOT NULL,
    planet_id integer NOT NULL,
    radius_km integer,
    orbital_period_days integer NOT NULL,
    is_artificial boolean DEFAULT false,
    discovered_by character varying(120),
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(150) NOT NULL,
    star_id integer NOT NULL,
    radius_km integer NOT NULL,
    mass numeric(14,6),
    planet_type character varying(60),
    orbital_period_days integer,
    is_habitable boolean DEFAULT false,
    has_life boolean DEFAULT false,
    notes text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(150) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(60),
    temperature integer NOT NULL,
    mass numeric(12,6),
    age_millions integer,
    is_variable boolean DEFAULT false
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 1, 945, 'Rock/Ice', false, 'Dwarf planet in asteroid belt');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 1, 525, 'Rock', false, 'Large asteroid in inner belt');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 1, 512, 'Rock', false, 'Large asteroid with high inclination');
INSERT INTO public.asteroid VALUES (4, 'Andro-Ast-1', 2, 120, 'Carbonaceous', false, 'Andromeda minor body');
INSERT INTO public.asteroid VALUES (5, 'Tri-Ast-Alpha', 3, 80, 'Silicate', false, 'Triangulum belt object');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 0.000, 250000000000, 'Our home galaxy', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000.000, 1000000000000, 'Nearest large galaxy', false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000.000, 40000000000, 'Small spiral near Andromeda', false, true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Unbarred Spiral', 29000000.000, 80000000000, 'Distinct dust lane', false, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 23000000.000, 100000000000, 'Interacting with a neighbor', false, true);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 163000.000, 30000000000, 'Satellite of Milky Way', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737, 27, false, 'Ancient observers', 'Earth''s moon');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, 0, false, 'Asaph Hall', 'Mars inner moon');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, 1, false, 'Asaph Hall', 'Mars outer moon');
INSERT INTO public.moon VALUES (4, 'Io', 10, 1821, 2, false, 'Galileo', 'Volcanically active');
INSERT INTO public.moon VALUES (5, 'Europa', 10, 1560, 4, false, 'Galileo', 'Icy surface with ocean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 10, 2634, 7, false, 'Galileo', 'Largest moon in Solar System');
INSERT INTO public.moon VALUES (7, 'Callisto', 10, 2410, 17, false, 'Galileo', 'Heavily cratered');
INSERT INTO public.moon VALUES (8, 'Luna-Alpha', 2, 1500, 50, false, 'Surveyor', 'Hypothetical moon around Venus analog');
INSERT INTO public.moon VALUES (9, 'PCent-b-Moon1', 5, 1200, 5, false, 'Robotic probe', 'Small captured moon');
INSERT INTO public.moon VALUES (10, 'SiriusPrime-I', 7, 2200, 20, false, 'Observatory', 'Large satellite');
INSERT INTO public.moon VALUES (11, 'Andro-1b-m1', 8, 900, 12, false, 'Andromeda probe', 'Rocky moon');
INSERT INTO public.moon VALUES (12, 'Tri-1a-I', 9, 1100, 8, false, 'Triangulum surveyor', 'Small moon');
INSERT INTO public.moon VALUES (13, 'Gas-World-1-I', 10, 60000, 16, false, 'Telescope', 'Massive gas-giant moon');
INSERT INTO public.moon VALUES (14, 'Gas-World-1-II', 10, 2500, 47, false, 'Telescope', 'Icy moon');
INSERT INTO public.moon VALUES (15, 'Ice-Giant-1-I', 11, 1400, 30, false, 'Deep Space', 'Captured object');
INSERT INTO public.moon VALUES (16, 'Hab-Delta-I', 12, 1700, 28, false, 'Hab-Delta mission', 'Potentially life-supporting moon');
INSERT INTO public.moon VALUES (17, 'Hab-Delta-II', 12, 950, 12, false, 'Hab-Delta mission', 'Small rocky moon');
INSERT INTO public.moon VALUES (18, 'Small-Leftover-1', 1, 50, 1, false, 'Survey', 'Tiny captured object');
INSERT INTO public.moon VALUES (19, 'Small-Leftover-2', 1, 40, 1, false, 'Survey', 'Tiny captured object');
INSERT INTO public.moon VALUES (20, 'Small-Leftover-3', 1, 30, 1, false, 'Survey', 'Tiny captured object');
INSERT INTO public.moon VALUES (21, 'Artificial-Sentinel', 3, 2, 0, true, 'Advanced civilization', 'Artificial satellite probe');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 2440, 0.000330, 'Terrestrial', 88, false, false, 'Innermost planet');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 6052, 0.002600, 'Terrestrial', 225, false, false, 'Thick CO2 atmosphere');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 6371, 1.000000, 'Terrestrial', 365, true, true, 'Has abundant life');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 3390, 0.107000, 'Terrestrial', 687, false, false, 'Red planet');
INSERT INTO public.planet VALUES (5, 'Proxima b', 2, 7000, 1.270000, 'Super-Earth', 11, false, false, 'Close to Proxima Centauri');
INSERT INTO public.planet VALUES (6, 'Alpha-Centauri-b', 3, 6400, 1.000000, 'Terrestrial', 365, false, false, 'Hypothetical');
INSERT INTO public.planet VALUES (7, 'Sirius-Prime', 4, 9000, 5.000000, 'Gas Giant', 450, false, false, 'Massive gas giant');
INSERT INTO public.planet VALUES (8, 'Andro-1b', 5, 5600, 0.800000, 'Terrestrial', 120, false, false, 'Andromeda system');
INSERT INTO public.planet VALUES (9, 'Tri-1a', 6, 7200, 1.500000, 'Super-Earth', 95, false, false, 'Triangulum orbit');
INSERT INTO public.planet VALUES (10, 'Gas-World-1', 1, 69911, 317.800000, 'Gas Giant', 4333, false, false, 'Jupiter analog');
INSERT INTO public.planet VALUES (11, 'Ice-Giant-1', 1, 24622, 14.500000, 'Ice Giant', 10759, false, false, 'Neptune analog');
INSERT INTO public.planet VALUES (12, 'Habitable-Delta', 5, 6379, 1.030000, 'Terrestrial', 400, true, false, 'Potentially habitable');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 5778, 1.000000, 4600, false);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'M5.5V', 3050, 0.122100, 4800, true);
INSERT INTO public.star VALUES (3, 'Rigil Kentaurus A', 1, 'G2V', 5790, 1.100000, 5000, false);
INSERT INTO public.star VALUES (4, 'Sirius A', 2, 'A1V', 9940, 2.063000, 240, false);
INSERT INTO public.star VALUES (5, 'Andromeda-Alpha', 2, 'F5V', 6450, 1.300000, 1200, false);
INSERT INTO public.star VALUES (6, 'Triangulum-Star-1', 3, 'K3V', 4800, 0.800000, 3500, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

