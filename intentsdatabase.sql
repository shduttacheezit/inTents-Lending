--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: campers; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE campers (
    camper_id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(64) NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    camper_photo character varying(255) NOT NULL,
    camper_photo_url character varying(255) NOT NULL
);


ALTER TABLE campers OWNER TO vagrant;

--
-- Name: campers_camper_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE campers_camper_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE campers_camper_id_seq OWNER TO vagrant;

--
-- Name: campers_camper_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE campers_camper_id_seq OWNED BY campers.camper_id;


--
-- Name: equipment; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE equipment (
    gear_id integer NOT NULL,
    gear_name character varying(255) NOT NULL,
    category character varying(64) NOT NULL,
    brand character varying(64) NOT NULL,
    lender_id integer NOT NULL,
    zipcode integer NOT NULL,
    gear_photo character varying(255) NOT NULL,
    gear_photo_url character varying(255) NOT NULL
);


ALTER TABLE equipment OWNER TO vagrant;

--
-- Name: equipment_gear_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE equipment_gear_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE equipment_gear_id_seq OWNER TO vagrant;

--
-- Name: equipment_gear_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE equipment_gear_id_seq OWNED BY equipment.gear_id;


--
-- Name: lenders; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE lenders (
    lender_id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(64) NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    lender_photo character varying(255) NOT NULL,
    lender_photo_url character varying(255) NOT NULL
);


ALTER TABLE lenders OWNER TO vagrant;

--
-- Name: lenders_lender_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE lenders_lender_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lenders_lender_id_seq OWNER TO vagrant;

--
-- Name: lenders_lender_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE lenders_lender_id_seq OWNED BY lenders.lender_id;


--
-- Name: rentedout; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE rentedout (
    rented_id integer NOT NULL,
    lender_id integer NOT NULL,
    camper_id integer NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL
);


ALTER TABLE rentedout OWNER TO vagrant;

--
-- Name: rentedout_rented_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE rentedout_rented_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rentedout_rented_id_seq OWNER TO vagrant;

--
-- Name: rentedout_rented_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE rentedout_rented_id_seq OWNED BY rentedout.rented_id;


--
-- Name: camper_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY campers ALTER COLUMN camper_id SET DEFAULT nextval('campers_camper_id_seq'::regclass);


--
-- Name: gear_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY equipment ALTER COLUMN gear_id SET DEFAULT nextval('equipment_gear_id_seq'::regclass);


--
-- Name: lender_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY lenders ALTER COLUMN lender_id SET DEFAULT nextval('lenders_lender_id_seq'::regclass);


--
-- Name: rented_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY rentedout ALTER COLUMN rented_id SET DEFAULT nextval('rentedout_rented_id_seq'::regclass);


--
-- Data for Name: campers; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY campers (camper_id, email, password, first_name, last_name, camper_photo, camper_photo_url) FROM stdin;
1	bmarlowe@hbright.com	camper1	Ben	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
2	mmarlowe@hbright.com	camper2	Michael	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
3	timarlowe@hbright.com	camper3	Tim	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
4	gmarlowe@hbright.com	camper4	Garrick	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
5	melmarlowe@hbright.com	camper5	Mel	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
6	tommarlowe@hbright.com	camper6	Tom	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
7	nmarlowe@hbright.com	camper7	Nick	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
8	dmarlowe@hbright.com	camper8	Dan	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
9	tdmarlowe@hbright.com	camper9	Todd	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
10	brmarlowe@hbright.com	camper10	Brian	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
\.


--
-- Name: campers_camper_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('campers_camper_id_seq', 2, true);


--
-- Data for Name: equipment; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY equipment (gear_id, gear_name, category, brand, lender_id, zipcode, gear_photo, gear_photo_url) FROM stdin;
1	mens 85L backpacking pack	Hydration	The North Face	6	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
2	hydration pack	Hydration	Osprey	15	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
3	canister stove	Backpacks & Bags	Terra Nova	3	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
4	silicon cookware	Camp Electronics	REI	9	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
5	womens 65L backpacking pack	Knives & Tools	The North Face	14	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
6	bear canister	Camp Lighting	GSI	10	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
7	hydration pack	Camp Furniture	GSI	11	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
8	hydration pack	Camp Furniture	Therm-a-Rest	4	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
9	30L daypack	Tents & Shelter	Osprey	13	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
10	mens 35L hiking pack	Camp Furniture	Terra Nova	14	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
11	sleeping pad	Tents & Shelter	Patagonia	5	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
12	hammock	Backpacks & Bags	Hydro Flask	6	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
13	lantern	Tents & Shelter	Hydro Flask	14	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
14	canister stove	Backpacks & Bags	Terra Nova	4	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
15	hammock	Sleeping Bags	Mountain Hardwear	15	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
16	self-inflating sleeping pad	Camp Furniture	Sierra Designs	5	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
17	compass	Backpacks & Bags	The North Face	3	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
18	4-person tent	Hydration	Nemo	9	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
19	hammock	Camp Furniture	CamelBak	12	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
20	titanium cookware	Tents & Shelter	Evernew	6	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
21	bear canister	Tents & Shelter	Therm-a-Rest	12	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
22	air sleeping pad	Camp Kitchen	Big Agnes	4	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
23	backpacking mattress	Knives & Tools	The North Face	5	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
24	womens 25L daypack	Camp Lighting	Sea to Summit	8	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
25	flashlight	Camp Kitchen	Sea to Summit	2	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
26	backpacking mattress	Camp Furniture	CamelBak	2	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
27	flashlight	Knives & Tools	Therm-a-Rest	9	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
28	canister stove	Camp Lighting	CamelBak	8	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
29	womens 65L backpacking pack	Tents & Shelter	Marmot	7	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
30	30L daypack	Camp Electronics	Hydro Flask	1	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
31	canister stove	Tents & Shelter	Hydro Flask	4	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
32	silicon cookware	Camp Furniture	Sierra Designs	7	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
33	backpacking mattress	Camp Lighting	CamelBak	15	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
34	mens 35L hiking pack	Camp Kitchen	Big Agnes	5	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
35	4-person tent	Camp Kitchen	The North Face	9	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
36	backpacking mattress	Camp Kitchen	Snow Peak	12	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
37	titanium cookware	Camp Kitchen	Patagonia	15	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
38	bear canister	Camp Furniture	CamelBak	6	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
39	flashlight	Camp Electronics	Terra Nova	6	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
40	sleeping pad	Camp Kitchen	REI	13	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
41	mens 35L hiking pack	Backpacks & Bags	Sea to Summit	13	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
42	titanium cookware	Tents & Shelter	Black Diamond	8	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
43	mens 85L backpacking pack	Sleeping Bags	Therm-a-Rest	8	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
44	2-person tent	Camp Furniture	Sea to Summit	3	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
45	canister stove	Camp Furniture	Black Diamond	9	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
46	flashlight	Hydration	Evernew	2	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
47	30L daypack	Backpacks & Bags	Black Diamond	9	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
48	lantern	Camp Electronics	Osprey	6	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
49	bear canister	Knives & Tools	Evernew	11	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
50	sleeping pad	Camp Furniture	Evernew	4	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
51	self-inflating sleeping pad	Sleeping Bags	GSI	11	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
52	self-inflating sleeping pad	Sleeping Bags	Therm-a-Rest	14	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
53	titanium cookware	Camp Electronics	Therm-a-Rest	3	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
54	30L daypack	Backpacks & Bags	The North Face	2	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
55	hydration pack	Tents & Shelter	Terra Nova	1	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
56	air sleeping pad	Backpacks & Bags	Nemo	2	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
57	backpacking mattress	Camp Furniture	Therm-a-Rest	12	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
58	compass	Tents & Shelter	The North Face	10	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
59	womens 65L backpacking pack	Hydration	Evernew	15	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
60	mens 35L hiking pack	Tents & Shelter	GSI	2	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
61	air sleeping pad	Camp Lighting	Terra Nova	3	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
62	womens 25L daypack	Sleeping Bags	Therm-a-Rest	12	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
63	air sleeping pad	Sleeping Bags	CamelBak	14	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
64	30L daypack	Knives & Tools	GSI	9	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
65	lantern	Camp Lighting	REI	4	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
66	mens 35L hiking pack	Camp Electronics	Marmot	10	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
67	2-person tent	Camp Kitchen	Mountain Hardwear	15	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
68	headlamp	Camp Electronics	Hydro Flask	11	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
69	flashlight	Camp Lighting	Sierra Designs	9	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
70	backpacking mattress	Hydration	REI	7	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
71	compact pocket knife	Camp Kitchen	Terra Nova	4	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
72	2-person tent	Camp Furniture	Osprey	15	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
73	self-inflating sleeping pad	Knives & Tools	Osprey	6	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
74	30L daypack	Tents & Shelter	Patagonia	8	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
75	hydration pack	Backpacks & Bags	Mountain Hardwear	7	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
76	headlamp	Camp Kitchen	Patagonia	13	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
77	compass	Tents & Shelter	MSR	1	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
78	womens 25L daypack	Camp Lighting	The North Face	4	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
79	hammock	Camp Kitchen	Evernew	13	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
80	bear canister	Tents & Shelter	Osprey	8	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
81	canister stove	Camp Kitchen	Nemo	3	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
82	titanium cookware	Hydration	Evernew	6	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
83	flashlight	Backpacks & Bags	Terra Nova	15	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
84	silicon cookware	Camp Kitchen	Snow Peak	2	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
85	silicon cookware	Camp Lighting	GSI	13	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
86	backpacking mattress	Camp Lighting	Evernew	7	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
87	lantern	Knives & Tools	GSI	12	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
88	cold weather sleeping bag	Hydration	Osprey	11	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
89	lantern	Camp Lighting	Black Diamond	10	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
90	headlamp	Camp Kitchen	MSR	8	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
91	backpacking mattress	Knives & Tools	Terra Nova	9	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
92	flashlight	Sleeping Bags	Evernew	10	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
93	lantern	Camp Lighting	Osprey	13	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
94	lantern	Camp Kitchen	The North Face	12	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
95	womens 25L daypack	Camp Lighting	Sierra Designs	8	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
96	silicon cookware	Hydration	Mountain Hardwear	3	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
97	bear canister	Camp Lighting	Patagonia	10	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
98	30L daypack	Tents & Shelter	Mountain Hardwear	11	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
99	cold weather sleeping bag	Sleeping Bags	Osprey	12	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
100	self-inflating sleeping pad	Camp Furniture	Osprey	3	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
101	2-person tent	Hydration	The North Face	8	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
102	sleeping pad	Backpacks & Bags	Evernew	15	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
103	bear canister	Hydration	Big Agnes	2	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
104	womens 65L backpacking pack	Camp Kitchen	Mountain Hardwear	10	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
105	flashlight	Hydration	REI	6	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
106	canister stove	Camp Lighting	Evernew	8	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
107	womens 65L backpacking pack	Camp Lighting	Sea to Summit	4	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
108	2-person tent	Backpacks & Bags	CamelBak	8	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
109	4-person tent	Knives & Tools	Evernew	15	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
110	cold weather sleeping bag	Tents & Shelter	Marmot	8	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
111	headlamp	Knives & Tools	Therm-a-Rest	4	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
112	compact pocket knife	Tents & Shelter	Patagonia	5	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
113	mens 35L hiking pack	Tents & Shelter	REI	2	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
114	canister stove	Sleeping Bags	Hydro Flask	6	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
115	self-inflating sleeping pad	Sleeping Bags	Patagonia	11	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
116	lantern	Tents & Shelter	Snow Peak	15	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
117	4-person tent	Sleeping Bags	The North Face	13	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
118	air sleeping pad	Hydration	Terra Nova	5	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
119	bear canister	Backpacks & Bags	Nemo	11	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
120	mens 85L backpacking pack	Camp Kitchen	MSR	8	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
121	30L daypack	Camp Electronics	The North Face	15	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
122	lantern	Tents & Shelter	Hydro Flask	13	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
123	2-person tent	Camp Kitchen	Terra Nova	9	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
124	bear canister	Knives & Tools	Therm-a-Rest	11	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
125	womens 25L daypack	Sleeping Bags	Nemo	3	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
126	4-person tent	Backpacks & Bags	Therm-a-Rest	6	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
127	womens 25L daypack	Camp Electronics	Big Agnes	7	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
128	hammock	Knives & Tools	Nemo	9	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
129	backpacking mattress	Knives & Tools	Black Diamond	13	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
130	cold weather sleeping bag	Hydration	Sea to Summit	7	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
131	mens 85L backpacking pack	Tents & Shelter	Black Diamond	11	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
132	hydration pack	Camp Furniture	Black Diamond	12	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
133	cold weather sleeping bag	Hydration	Evernew	14	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
134	hammock	Hydration	Hydro Flask	10	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
135	titanium cookware	Backpacks & Bags	Evernew	9	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
136	headlamp	Backpacks & Bags	CamelBak	2	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
137	bear canister	Camp Furniture	Nemo	7	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
138	30L daypack	Hydration	Marmot	10	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
139	cold weather sleeping bag	Knives & Tools	REI	9	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
140	hydration pack	Camp Kitchen	Snow Peak	3	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
141	titanium cookware	Knives & Tools	CamelBak	9	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
142	hydration pack	Camp Lighting	Sierra Designs	6	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
143	self-inflating sleeping pad	Camp Electronics	Therm-a-Rest	13	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
144	headlamp	Hydration	Therm-a-Rest	7	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
145	mens 85L backpacking pack	Hydration	Marmot	14	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
146	30L daypack	Sleeping Bags	The North Face	13	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
147	canister stove	Camp Kitchen	MSR	2	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
148	hammock	Sleeping Bags	Patagonia	8	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
149	womens 25L daypack	Sleeping Bags	Hydro Flask	2	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
150	hammock	Camp Furniture	Osprey	2	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
151	canister stove	Backpacks & Bags	Nemo	7	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
152	2-person tent	Hydration	Osprey	4	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
153	4-person tent	Camp Kitchen	Patagonia	8	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
154	womens 25L daypack	Backpacks & Bags	Hydro Flask	10	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
155	backpacking mattress	Camp Lighting	REI	8	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
156	canister stove	Camp Kitchen	Snow Peak	3	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
157	air sleeping pad	Tents & Shelter	MSR	10	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
158	2-person tent	Hydration	Marmot	15	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
159	hammock	Knives & Tools	MSR	6	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
160	womens 25L daypack	Camp Furniture	Terra Nova	7	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
161	mens 85L backpacking pack	Camp Electronics	CamelBak	9	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
162	30L daypack	Knives & Tools	Big Agnes	5	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
163	canister stove	Camp Furniture	Sea to Summit	6	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
164	hammock	Camp Electronics	Osprey	2	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
165	4-person tent	Backpacks & Bags	Nemo	15	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
166	headlamp	Sleeping Bags	Osprey	13	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
167	compass	Backpacks & Bags	Black Diamond	15	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
168	compact pocket knife	Hydration	Sea to Summit	14	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
169	silicon cookware	Tents & Shelter	Sea to Summit	14	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
170	hydration pack	Hydration	Therm-a-Rest	10	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
171	silicon cookware	Backpacks & Bags	Black Diamond	6	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
172	cold weather sleeping bag	Tents & Shelter	Evernew	13	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
173	titanium cookware	Backpacks & Bags	The North Face	10	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
174	cold weather sleeping bag	Knives & Tools	Mountain Hardwear	5	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
175	silicon cookware	Camp Furniture	REI	13	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
176	air sleeping pad	Backpacks & Bags	Nemo	7	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
177	womens 65L backpacking pack	Knives & Tools	Evernew	6	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
178	womens 25L daypack	Tents & Shelter	Big Agnes	13	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
179	flashlight	Sleeping Bags	Patagonia	13	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
180	hydration pack	Camp Lighting	Black Diamond	13	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
181	womens 25L daypack	Hydration	Nemo	5	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
182	compass	Camp Electronics	Black Diamond	1	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
183	backpacking mattress	Camp Lighting	Snow Peak	7	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
184	sleeping pad	Sleeping Bags	CamelBak	2	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
185	flashlight	Camp Furniture	Therm-a-Rest	15	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
186	womens 65L backpacking pack	Camp Furniture	Black Diamond	5	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
187	cold weather sleeping bag	Hydration	Nemo	1	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
188	womens 65L backpacking pack	Knives & Tools	Hydro Flask	7	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
189	titanium cookware	Camp Electronics	Hydro Flask	3	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
190	bear canister	Knives & Tools	MSR	15	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
191	mens 35L hiking pack	Camp Furniture	Nemo	8	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
192	lantern	Camp Kitchen	REI	11	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
193	30L daypack	Camp Kitchen	Mountain Hardwear	12	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
194	2-person tent	Backpacks & Bags	MSR	12	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
195	titanium cookware	Camp Electronics	Terra Nova	6	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
196	bear canister	Camp Kitchen	Mountain Hardwear	15	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
197	bear canister	Tents & Shelter	Black Diamond	6	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
198	flashlight	Camp Electronics	Hydro Flask	3	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
199	sleeping pad	Tents & Shelter	Mountain Hardwear	5	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
200	compass	Camp Electronics	Patagonia	5	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
\.


--
-- Name: equipment_gear_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('equipment_gear_id_seq', 1, false);


--
-- Data for Name: lenders; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY lenders (lender_id, email, password, first_name, last_name, lender_photo, lender_photo_url) FROM stdin;
1	mruffalo@hbright.com	lender1	Mark	Ruffalo	static/images/profpics/mruffalo.jpg	http://localhost:5000/static/images/profpics/mruffalo.jpg
2	reesew@hbright.com	lender2	Reese	Witherspoon	static/images/profpics/rwitherspoon.jpg	http://localhost:5000/static/images/profpics/rwitherspoon.jpg
3	hjackman@hbright.com	lender3	Hugh	Jackman	static/images/profpics/hjackman.jpg	http://localhost:5000/static/images/profpics/hjackman.jpg
4	seanp@hbright.com	lender4	Sean	Penn	static/images/profpics/spenn.jpg	http://localhost:5000/static/images/profpics/spenn.jpg
5	vhudgens@hbright.com	lender5	Vanessa	Hudgens	static/images/profpics/vhudgens.jpg	http://localhost:5000/static/images/profpics/vhudgens.jpg
6	shilpad@hbright.com	lender6	Shilpa	Dutta	static/images/profpics/sdutta.jpg	http://localhost:5000/static/images/profpics/sdutta.jpg
7	slittle@hbright.com	lender7	Stuart	Little	static/images/profpics/slittle.jpg	http://localhost:5000/static/images/profpics/slittle.jpg
8	mscott@hbright.com	lender8	Michael	Scott	static/images/profpics/mscott.jpg	http://localhost:5000/static/images/profpics/mscott.jpg
9	mpalmer@hbright.com	lender9	Mereditch	Palmer	static/images/profpics/mpalmer.jpg	http://localhost:5000/static/images/profpics/mpalmer.jpg
10	pamb@hbright.com	lender10	Pam	Beesly	static/images/profpics/pbeesly.jpg	http://localhost:5000/static/images/profpics/pbeesly.jpg
11	rainnwilson@hbright.com	lender11	Rainn	Wilson	static/images/profpics/rainnw.jpg	http://localhost:5000/static/images/profpics/rainnw.jpg
12	dwight@hbright.com	lender12	Dwight	Schrute	static/images/profpics/dschrute.jpg	http://localhost:5000/static/images/profpics/dschrute.jpg
13	bjnovak@hbright.com	lender13	BJ	Novak	static/images/profpics/bjnovak.jpg	http://localhost:5000/static/images/profpics/bjnovak.jpg
14	annieclark@hbright.com	lender14	Annie	Clark	static/images/profpics/aclark.jpg	http://localhost:5000/static/images/profpics/aclark.jpg
15	kellyk@hbright.com	lender15	Kelly	Kapoor	static/images/profpics/kkapoor.jpg	http://localhost:5000/static/images/profpics/kkapoor.jpg
\.


--
-- Name: lenders_lender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('lenders_lender_id_seq', 1, false);


--
-- Data for Name: rentedout; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY rentedout (rented_id, lender_id, camper_id, start_date, end_date) FROM stdin;
\.


--
-- Name: rentedout_rented_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('rentedout_rented_id_seq', 1, false);


--
-- Name: campers_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY campers
    ADD CONSTRAINT campers_pkey PRIMARY KEY (camper_id);


--
-- Name: equipment_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (gear_id);


--
-- Name: lenders_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY lenders
    ADD CONSTRAINT lenders_pkey PRIMARY KEY (lender_id);


--
-- Name: rentedout_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY rentedout
    ADD CONSTRAINT rentedout_pkey PRIMARY KEY (rented_id);


--
-- Name: equipment_lender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY equipment
    ADD CONSTRAINT equipment_lender_id_fkey FOREIGN KEY (lender_id) REFERENCES lenders(lender_id);


--
-- Name: rentedout_camper_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY rentedout
    ADD CONSTRAINT rentedout_camper_id_fkey FOREIGN KEY (camper_id) REFERENCES campers(camper_id);


--
-- Name: rentedout_lender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY rentedout
    ADD CONSTRAINT rentedout_lender_id_fkey FOREIGN KEY (lender_id) REFERENCES lenders(lender_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

