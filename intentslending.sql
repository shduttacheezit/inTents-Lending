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
    camper_email character varying(255) NOT NULL,
    password character varying(64) NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    camper_photo character varying(255) NOT NULL,
    camper_photo_url character varying(255) NOT NULL
);


ALTER TABLE campers OWNER TO vagrant;

--
-- Name: equipment; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE equipment (
    gear_id integer NOT NULL,
    gear_name character varying(255) NOT NULL,
    category character varying(64) NOT NULL,
    brand character varying(64) NOT NULL,
    lender_email character varying NOT NULL,
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
    lender_email character varying(255) NOT NULL,
    password character varying(64) NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    lender_photo character varying(255) NOT NULL,
    lender_photo_url character varying(255) NOT NULL
);


ALTER TABLE lenders OWNER TO vagrant;

--
-- Name: rentedout; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE rentedout (
    rented_id integer NOT NULL,
    lender_email character varying NOT NULL,
    camper_email character varying NOT NULL,
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
-- Name: gear_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY equipment ALTER COLUMN gear_id SET DEFAULT nextval('equipment_gear_id_seq'::regclass);


--
-- Name: rented_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY rentedout ALTER COLUMN rented_id SET DEFAULT nextval('rentedout_rented_id_seq'::regclass);


--
-- Data for Name: campers; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY campers (camper_email, password, first_name, last_name, camper_photo, camper_photo_url) FROM stdin;
bmarlowe@hbright.com	camper1	Ben	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
mmarlowe@hbright.com	camper2	Michael	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
timarlowe@hbright.com	camper3	Tim	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
gmarlowe@hbright.com	camper4	Garrick	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
melmarlowe@hbright.com	camper5	Mel	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
tommarlowe@hbright.com	camper6	Tom	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
nmarlowe@hbright.com	camper7	Nick	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
dmarlowe@hbright.com	camper8	Dan	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
tdmarlowe@hbright.com	camper9	Todd	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
brmarlowe@hbright.com	camper10	Brian	Marlowe	static/images/profpics/camper_photo.jpg	http://localhost:5000/static/images/profpics/camper_photo.jpg
msinha@hbright.com	camper11	Megha	Sinha	static/images/profpics/rsz_dsc06558.jpg	http://localhost:5000/_uploads/photos/rsz_dsc06558.jpg
hkathiya@hbright.com	camper12	Henna	Kathiya	static/images/profpics/rsz_dsc06556.jpg	http://localhost:5000/_uploads/photos/rsz_dsc06556.jpg
\.


--
-- Data for Name: equipment; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY equipment (gear_id, gear_name, category, brand, lender_email, zipcode, gear_photo, gear_photo_url) FROM stdin;
39	camp tarp	Tents & Shelter	Terra Nova	shilpad@hbright.com	94115	static/images/gear/tarp.jpg	http://localhost:5000/static/images/gear/tarp.jpg
20	titanium cookware	Camp Kitchen	GSI	shilpad@hbright.com	94115	static/images/gear/titanium.jpg	http://localhost:5000/static/images/gear/titanium.jpg
25	flashlight	Camp Lighting	Nemo	reesew@hbright.com	94703	static/images/gear/flashlight.jpg	http://localhost:5000/static/images/gear/flashlight.jpg
41	mens 35L hiking pack	Backpacks & Bags	Sea to Summit	bjnovak@hbright.com	94109	static/images/gear/backpack_sm.jpg	http://localhost:5000/static/images/gear/backpack_sm.jpg
22	warm weather sleeping bag	Sleeping Bags	Mountain Hardwear	seanp@hbright.com	94705	static/images/gear/sleepingbagsummer.jpg	http://localhost:5000/static/images/gear/sleepingbagsummer.jpg
36	backpacking mattress	Camp Bedding	Snow Peak	dwight@hbright.com	94129	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
29	womens 65L backpacking pack	Backpacks & Bags	Marmot	slittle@hbright.com	94105	static/images/gear/backpack_lw.jpeg	http://localhost:5000/static/images/gear/backpack_lw.jpeg
23	backpacking mattress	Camp Bedding	The North Face	vhudgens@hbright.com	94941	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
17	compass	Knives & Tools	The North Face	hjackman@hbright.com	94122	static/images/gear/compass.jpg	http://localhost:5000/static/images/gear/compass.jpg
38	bear canister	Camp Kitchen	CamelBak	shilpad@hbright.com	94115	static/images/gear/bearcan.jpg	http://localhost:5000/static/images/gear/bearcan.jpg
40	sleeping pad	Camp Bedding	REI	bjnovak@hbright.com	94109	static/images/gear/sleeping.jpg	http://localhost:5000/static/images/gear/sleeping.jpg
16	self-inflating sleeping pad	Camp Bedding	Sierra Designs	vhudgens@hbright.com	94941	static/images/gear/selfinflating.jpg	http://localhost:5000/static/images/gear/selfinflating.jpg
6	bear canister	Camp Kitchen	Black Diamond	pamb@hbright.com	94610	static/images/gear/bearcan.jpg	http://localhost:5000/static/images/gear/bearcan.jpg
24	womens 25L daypack	Backpacks & Bags	Patagonia	mscott@hbright.com	94609	static/images/gear/backpack_s.jpg	http://localhost:5000/static/images/gear/backpack_s.jpg
42	titanium cookware	Camp Kitchen	GSI	mscott@hbright.com	94609	static/images/gear/titanium.jpg	http://localhost:5000/static/images/gear/titanium.jpg
32	silicon cookware	Camp Kitchen	Sea to Summit	slittle@hbright.com	94105	static/images/gear/cookwaresili.jpg	http://localhost:5000/static/images/gear/cookwaresili.jpg
11	sleeping pad	Camp Bedding	Patagonia	vhudgens@hbright.com	94941	static/images/gear/sleeping.jpg	http://localhost:5000/static/images/gear/sleeping.jpg
28	canister stove	Camp Kitchen	GSI	mscott@hbright.com	94609	static/images/gear/stove.jpg	http://localhost:5000/static/images/gear/stove.jpg
12	hammock	Camp Furniture	Hydro Flask	shilpad@hbright.com	94115	static/images/gear/hammock.jpg	http://localhost:5000/static/images/gear/hammock/jpg
7	stainless steelwater bottle	Hydration	Hydro Flask	rainnwilson@hbright.com	94109	static/images/gear/hydroflask.jpg	http://localhost:5000/static/images/gear/hydroflask.jpg
14	canister stove	Camp Kitchen	GSI	seanp@hbright.com	94705	static/images/gear/stove.jpg	http://localhost:5000/static/images/gear/stove.jpg
26	backpacking mattress	Camp Bedding	CamelBak	reesew@hbright.com	94703	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
18	4-person tent	Tents & Shelter	Nemo	mpalmer@hbright.com	94127	static/images/gear/tent4.jpeg	http://localhost:5000/static/images/gear/tent4.jpeg
9	30L daypack	Backpacks & Bags	Osprey	bjnovak@hbright.com	94109	static/images/gear/pack30L.jpg	http://localhost:5000/static/images/gear/pack30L.jpg
35	4-person tent	Tents & Shelter	The North Face	mpalmer@hbright.com	94127	static/images/gear/tent4.jpeg	http://localhost:5000/static/images/gear/tent4.jpeg
21	camping pad	Camp Bedding	Therm-a-Rest	dwight@hbright.com	94129	static/images/gear/sleeping.jpg	http://localhost:5000/static/images/gear/sleeping.jpg
1	mens 85L backpacking pack	Backpacks & Bags	The North Face	shilpad@hbright.com	94115	static/images/gear/backpack_l.jpg	http://localhost:5000/static/images/gear/backpack_l.jpg
30	30L daypack	Backpacks & Bags	Hydro Flask	mruffalo@hbright.com	94131	static/images/gear/pack30L.jpg	http://localhost:5000/static/images/gear/pack30L.jpg
27	camping pad	Camp Bedding	Therm-a-Rest	mpalmer@hbright.com	94127	static/images/gear/sleeping.jpg	http://localhost:5000/static/images/gear/sleeping.jpg
15	hammock	Camp Furniture	Mountain Hardwear	kellyk@hbright.com	94941	static/images/gear/hammock.jpg	http://localhost:5000/static/images/gear/hammock/jpg
3	canister stove	Camp Kitchen	GSI	hjackman@hbright.com	94122	static/images/gear/stove.jpg	http://localhost:5000/static/images/gear/stove.jpg
33	backpacking mattress	Camp Bedding	Black Diamond	kellyk@hbright.com	94941	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
31	canister stove	Camp Kitchen	GSI	seanp@hbright.com	94705	static/images/gear/stove.jpg	http://localhost:5000/static/images/gear/stove.jpg
19	hammock	Camp Furniture	CamelBak	dwight@hbright.com	94129	static/images/gear/hammock.jpg	http://localhost:5000/static/images/gear/hammock/jpg
4	silicon cookware	Camp Kitchen	Sea to Summit	mpalmer@hbright.com	94127	static/images/gear/cookwaresili.jpg	http://localhost:5000/static/images/gear/cookwaresili.jpg
59	womens 65L backpacking pack	Backpacks & Bags	Evernew	kellyk@hbright.com	94941	static/images/gear/backpack_lw.jpeg	http://localhost:5000/static/images/gear/backpack_lw.jpeg
46	flashlight	Camp Lighting	Nemo	reesew@hbright.com	94703	static/images/gear/flashlight.jpg	http://localhost:5000/static/images/gear/flashlight.jpg
62	womens 25L daypack	Backpacks & Bags	Patagonia	dwight@hbright.com	94129	static/images/gear/backpack_s.jpg	http://localhost:5000/static/images/gear/backpack_s.jpg
56	warm weather sleeping bag	Sleeping Bags	Mountain Hardwear	reesew@hbright.com	94703	static/images/gear/sleepingbagsummer.jpg	http://localhost:5000/static/images/gear/sleepingbagsummer.jpg
58	compass	Knives & Tools	The North Face	pamb@hbright.com	94610	static/images/gear/compass.jpg	http://localhost:5000/static/images/gear/compass.jpg
74	30L daypack	Backpacks & Bags	Patagonia	mscott@hbright.com	94609	static/images/gear/pack30L.jpg	http://localhost:5000/static/images/gear/pack30L.jpg
49	bear canister	Camp Kitchen	Evernew	rainnwilson@hbright.com	94109	static/images/gear/bearcan.jpg	http://localhost:5000/static/images/gear/bearcan.jpg
77	compass	Knives & Tools	MSR	mruffalo@hbright.com	94131	static/images/gear/compass.jpg	http://localhost:5000/static/images/gear/compass.jpg
70	backpacking mattress	Camp Bedding	REI	slittle@hbright.com	94105	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
66	mens 35L hiking pack	Backpacks & Bags	Marmot	pamb@hbright.com	94610	static/images/gear/backpack_sm.jpg	http://localhost:5000/static/images/gear/backpack_sm.jpg
67	2-person tent	Tents & Shelter	Mountain Hardwear	kellyk@hbright.com	94941	static/images/gear/tent.jpg	http://localhost:5000/static/images/gear/tent.jpg
82	titanium cookware	Camp Kitchen	GSI	shilpad@hbright.com	94115	static/images/gear/titanium.jpg	http://localhost:5000/static/images/gear/titanium.jpg
51	self-inflating sleeping pad	Camp Bedding	GSI	rainnwilson@hbright.com	94109	static/images/gear/selfinflating.jpg	http://localhost:5000/static/images/gear/selfinflating.jpg
79	hammock	Camp Furniture	Evernew	bjnovak@hbright.com	94109	static/images/gear/hammock.jpg	http://localhost:5000/static/images/gear/hammock/jpg
50	sleeping pad	Camp Bedding	Evernew	seanp@hbright.com	94705	static/images/gear/sleeping.jpg	http://localhost:5000/static/images/gear/sleeping.jpg
78	womens 25L daypack	Backpacks & Bags	Patagonia	seanp@hbright.com	94705	static/images/gear/backpack_s.jpg	http://localhost:5000/static/images/gear/backpack_s.jpg
80	bear canister	Camp Kitchen	Osprey	mscott@hbright.com	94609	static/images/gear/bearcan.jpg	http://localhost:5000/static/images/gear/bearcan.jpg
73	self-inflating sleeping pad	Camp Bedding	Osprey	shilpad@hbright.com	94115	static/images/gear/selfinflating.jpg	http://localhost:5000/static/images/gear/selfinflating.jpg
60	mens 35L hiking pack	Backpacks & Bags	GSI	reesew@hbright.com	94703	static/images/gear/backpack_sm.jpg	http://localhost:5000/static/images/gear/backpack_sm.jpg
43	camping pad	Camp Bedding	Therm-a-Rest	mscott@hbright.com	94609	static/images/gear/sleeping.jpg	http://localhost:5000/static/images/gear/sleeping.jpg
61	camp tarp	Tents & Shelter	Terra Nova	hjackman@hbright.com	94122	static/images/gear/tarp.jpg	http://localhost:5000/static/images/gear/tarp.jpg
48	lantern	Camp Lighting	Black Diamond	shilpad@hbright.com	94115	static/images/gear/lantern.jpg	http://localhost:5000/static/images/gear/lantern.jpg
81	canister stove	Camp Kitchen	Snow Peak	hjackman@hbright.com	94122	static/images/gear/stove.jpg	http://localhost:5000/static/images/gear/stove.jpg
45	canister stove	Camp Kitchen	GSI	mpalmer@hbright.com	94127	static/images/gear/stove.jpg	http://localhost:5000/static/images/gear/stove.jpg
65	lantern	Camp Lighting	Black Diamond	seanp@hbright.com	94705	static/images/gear/lantern.jpg	http://localhost:5000/static/images/gear/lantern.jpg
76	headlamp	Camp Lighting	Black Diamond	bjnovak@hbright.com	94109	static/images/gear/headlamp.jpg	http://localhost:5000/static/images/gear/headlamp.jpg
75	stainless steelwater bottle	Hydration	Hydro Flask	slittle@hbright.com	94105	static/images/gear/hydroflask.jpg	http://localhost:5000/static/images/gear/hydroflask.jpg
55	stainless steelwater bottle	Hydration	Hydro Flask	mruffalo@hbright.com	94131	static/images/gear/hydroflask.jpg	http://localhost:5000/static/images/gear/hydroflask.jpg
44	2-person tent	Tents & Shelter	Sea to Summit	hjackman@hbright.com	94122	static/images/gear/tent.jpg	http://localhost:5000/static/images/gear/tent.jpg
57	camping pad	Camp Bedding	Therm-a-Rest	dwight@hbright.com	94129	static/images/gear/sleeping.jpg	http://localhost:5000/static/images/gear/sleeping.jpg
53	camping pad	Camp Bedding	Therm-a-Rest	hjackman@hbright.com	94122	static/images/gear/sleeping.jpg	http://localhost:5000/static/images/gear/sleeping.jpg
54	30L daypack	Backpacks & Bags	The North Face	reesew@hbright.com	94703	static/images/gear/pack30L.jpg	http://localhost:5000/static/images/gear/pack30L.jpg
47	30L daypack	Backpacks & Bags	Black Diamond	mpalmer@hbright.com	94127	static/images/gear/pack30L.jpg	http://localhost:5000/static/images/gear/pack30L.jpg
64	30L daypack	Backpacks & Bags	GSI	mpalmer@hbright.com	94127	static/images/gear/pack30L.jpg	http://localhost:5000/static/images/gear/pack30L.jpg
68	headlamp	Camp Lighting	Black Diamond	rainnwilson@hbright.com	94109	static/images/gear/headlamp.jpg	http://localhost:5000/static/images/gear/headlamp.jpg
71	compact pocket knife	Knives & Tools	Sierra Designs	seanp@hbright.com	94705	static/images/gear/knife.jpg	http://localhost:5000/static/images/gear/knife.jpg
115	self-inflating sleeping pad	Camp Bedding	Patagonia	rainnwilson@hbright.com	94109	static/images/gear/selfinflating.jpg	http://localhost:5000/static/images/gear/selfinflating.jpg
113	mens 35L hiking pack	Backpacks & Bags	REI	reesew@hbright.com	94703	static/images/gear/backpack_sm.jpg	http://localhost:5000/static/images/gear/backpack_sm.jpg
117	4-person tent	Tents & Shelter	The North Face	bjnovak@hbright.com	94109	static/images/gear/tent4.jpeg	http://localhost:5000/static/images/gear/tent4.jpeg
105	flashlight	Camp Lighting	Nemo	shilpad@hbright.com	94115	static/images/gear/flashlight.jpg	http://localhost:5000/static/images/gear/flashlight.jpg
100	self-inflating sleeping pad	Camp Bedding	Osprey	hjackman@hbright.com	94122	static/images/gear/selfinflating.jpg	http://localhost:5000/static/images/gear/selfinflating.jpg
91	backpacking mattress	Camp Bedding	Terra Nova	mpalmer@hbright.com	94127	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
86	backpacking mattress	Camp Bedding	Black Diamond	slittle@hbright.com	94105	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
104	womens 65L backpacking pack	Backpacks & Bags	Mountain Hardwear	pamb@hbright.com	94610	static/images/gear/backpack_lw.jpeg	http://localhost:5000/static/images/gear/backpack_lw.jpeg
106	canister stove	Camp Kitchen	Snow Peak	mscott@hbright.com	94609	static/images/gear/stove.jpg	http://localhost:5000/static/images/gear/stove.jpg
114	canister stove	Camp Kitchen	Snow Peak	shilpad@hbright.com	94115	static/images/gear/stove.jpg	http://localhost:5000/static/images/gear/stove.jpg
98	30L daypack	Backpacks & Bags	Mountain Hardwear	rainnwilson@hbright.com	94109	static/images/gear/pack30L.jpg	http://localhost:5000/static/images/gear/pack30L.jpg
112	compact pocket knife	Knives & Tools	Sierra Designs	vhudgens@hbright.com	94941	static/images/gear/knife.jpg	http://localhost:5000/static/images/gear/knife.jpg
119	bear canister	Camp Kitchen	Nemo	rainnwilson@hbright.com	94109	static/images/gear/bearcan.jpg	http://localhost:5000/static/images/gear/bearcan.jpg
103	bear canister	Camp Kitchen	Big Agnes	reesew@hbright.com	94703	static/images/gear/bearcan.jpg	http://localhost:5000/static/images/gear/bearcan.jpg
107	womens 65L backpacking pack	Backpacks & Bags	Sea to Summit	seanp@hbright.com	94705	static/images/gear/backpack_lw.jpeg	http://localhost:5000/static/images/gear/backpack_lw.jpeg
95	womens 25L daypack	Backpacks & Bags	Patagonia	mscott@hbright.com	94609	static/images/gear/backpack_s.jpg	http://localhost:5000/static/images/gear/backpack_s.jpg
97	bear canister	Camp Kitchen	Black Diamond	pamb@hbright.com	94610	static/images/gear/bearcan.jpg	http://localhost:5000/static/images/gear/bearcan.jpg
118	warm weather sleeping bag	Sleeping Bags	Mountain Hardwear	vhudgens@hbright.com	94941	static/images/gear/sleepingbagsummer.jpg	http://localhost:5000/static/images/gear/sleepingbagsummer.jpg
124	camping pad	Camp Bedding	Therm-a-Rest	rainnwilson@hbright.com	94109	static/images/gear/sleeping.jpg	http://localhost:5000/static/images/gear/sleeping.jpg
126	camping pad	Camp Bedding	Therm-a-Rest	shilpad@hbright.com	94115	static/images/gear/sleeping.jpg	http://localhost:5000/static/images/gear/sleeping.jpg
96	silicon cookware	Camp Kitchen	Sea to Summit	hjackman@hbright.com	94122	static/images/gear/cookwaresili.jpg	http://localhost:5000/static/images/gear/cookwaresili.jpg
125	womens 25L daypack	Backpacks & Bags	Patagonia	hjackman@hbright.com	94122	static/images/gear/backpack_s.jpg	http://localhost:5000/static/images/gear/backpack_s.jpg
85	silicon cookware	Camp Kitchen	Sea to Summit	bjnovak@hbright.com	94109	static/images/gear/cookwaresili.jpg	http://localhost:5000/static/images/gear/cookwaresili.jpg
88	cold weather sleeping bag	Sleeping Bags	Osprey	rainnwilson@hbright.com	94109	static/images/gear/sleepingbag.jpg	http://localhost:5000/static/images/gear/sleepingbag.jpg
101	2-person tent	Tents & Shelter	The North Face	mscott@hbright.com	94609	static/images/gear/tent.jpg	http://localhost:5000/static/images/gear/tent.jpg
123	2-person tent	Tents & Shelter	Terra Nova	mpalmer@hbright.com	94127	static/images/gear/tent.jpg	http://localhost:5000/static/images/gear/tent.jpg
99	cold weather sleeping bag	Sleeping Bags	Osprey	dwight@hbright.com	94129	static/images/gear/sleepingbag.jpg	http://localhost:5000/static/images/gear/sleepingbag.jpg
93	lantern	Camp Lighting	Black Diamond	bjnovak@hbright.com	94109	static/images/gear/lantern.jpg	http://localhost:5000/static/images/gear/lantern.jpg
89	lantern	Camp Lighting	Black Diamond	pamb@hbright.com	94610	static/images/gear/lantern.jpg	http://localhost:5000/static/images/gear/lantern.jpg
146	30L daypack	Backpacks & Bags	The North Face	bjnovak@hbright.com	94109	static/images/gear/pack30L.jpg	http://localhost:5000/static/images/gear/pack30L.jpg
137	bear canister	Camp Kitchen	Nemo	slittle@hbright.com	94105	static/images/gear/bearcan.jpg	http://localhost:5000/static/images/gear/bearcan.jpg
138	30L daypack	Backpacks & Bags	Marmot	pamb@hbright.com	94610	static/images/gear/pack30L.jpg	http://localhost:5000/static/images/gear/pack30L.jpg
167	compass	Knives & Tools	Black Diamond	kellyk@hbright.com	94941	static/images/gear/compass.jpg	http://localhost:5000/static/images/gear/compass.jpg
154	womens 25L daypack	Backpacks & Bags	Patagonia	pamb@hbright.com	94610	static/images/gear/backpack_s.jpg	http://localhost:5000/static/images/gear/backpack_s.jpg
163	canister stove	Camp Kitchen	Snow Peak	shilpad@hbright.com	94115	static/images/gear/stove.jpg	http://localhost:5000/static/images/gear/stove.jpg
142	hydration pack	Hydration	Camelbak	shilpad@hbright.com	94115	static/images/gear/hydration.jpeg	http://localhost:5000/static/images/gear/hydration.jpeg
132	hydration pack	Hydration	Camelbak	dwight@hbright.com	94129	static/images/gear/hydration.jpeg	http://localhost:5000/static/images/gear/hydration.jpeg
162	30L daypack	Backpacks & Bags	Big Agnes	vhudgens@hbright.com	94941	static/images/gear/pack30L.jpg	http://localhost:5000/static/images/gear/pack30L.jpg
129	backpacking mattress	Camp Bedding	Black Diamond	bjnovak@hbright.com	94109	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
166	headlamp	Camp Lighting	Black Diamond	bjnovak@hbright.com	94109	static/images/gear/headlamp.jpg	http://localhost:5000/static/images/gear/headlamp.jpg
140	hydration pack	Hydration	Camelbak	hjackman@hbright.com	94122	static/images/gear/hydration.jpeg	http://localhost:5000/static/images/gear/hydration.jpeg
147	canister stove	Camp Kitchen	Snow Peak	reesew@hbright.com	94703	static/images/gear/stove.jpg	http://localhost:5000/static/images/gear/stove.jpg
143	camping pad	Camp Bedding	Therm-a-Rest	bjnovak@hbright.com	94109	static/images/gear/sleeping.jpg	http://localhost:5000/static/images/gear/sleeping.jpg
156	canister stove	Camp Kitchen	Snow Peak	hjackman@hbright.com	94122	static/images/gear/stove.jpg	http://localhost:5000/static/images/gear/stove.jpg
158	2-person tent	Tents & Shelter	Marmot	kellyk@hbright.com	94941	static/images/gear/tent.jpg	http://localhost:5000/static/images/gear/tent.jpg
135	titanium cookware	Camp Kitchen	GSI	mpalmer@hbright.com	94127	static/images/gear/titanium.jpg	http://localhost:5000/static/images/gear/titanium.jpg
136	headlamp	Camp Lighting	Black Diamond	reesew@hbright.com	94703	static/images/gear/headlamp.jpg	http://localhost:5000/static/images/gear/headlamp.jpg
141	titanium cookware	Camp Kitchen	GSI	mpalmer@hbright.com	94127	static/images/gear/titanium.jpg	http://localhost:5000/static/images/gear/titanium.jpg
155	backpacking mattress	Camp Bedding	Black Diamond	mscott@hbright.com	94609	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
159	hammock	Camp Furniture	MSR	shilpad@hbright.com	94115	static/images/gear/hammock.jpg	http://localhost:5000/static/images/gear/hammock/jpg
148	hammock	Camp Furniture	Patagonia	mscott@hbright.com	94609	static/images/gear/hammock.jpg	http://localhost:5000/static/images/gear/hammock/jpg
127	womens 25L daypack	Backpacks & Bags	Patagonia	slittle@hbright.com	94105	static/images/gear/backpack_s.jpg	http://localhost:5000/static/images/gear/backpack_s.jpg
144	camping pad	Camp Bedding	Therm-a-Rest	slittle@hbright.com	94105	static/images/gear/sleeping.jpg	http://localhost:5000/static/images/gear/sleeping.jpg
149	womens 25L daypack	Backpacks & Bags	Patagonia	reesew@hbright.com	94703	static/images/gear/backpack_s.jpg	http://localhost:5000/static/images/gear/backpack_s.jpg
131	mens 85L backpacking pack	Backpacks & Bags	Black Diamond	rainnwilson@hbright.com	94109	static/images/gear/backpack_l.jpg	http://localhost:5000/static/images/gear/backpack_l.jpg
134	stainless steelwater bottle	Hydration	Hydro Flask	pamb@hbright.com	94610	static/images/gear/hydroflask.jpg	http://localhost:5000/static/images/gear/hydroflask.jpg
152	2-person tent	Tents & Shelter	Osprey	seanp@hbright.com	94705	static/images/gear/tent.jpg	http://localhost:5000/static/images/gear/tent.jpg
165	4-person tent	Tents & Shelter	Nemo	kellyk@hbright.com	94941	static/images/gear/tent4.jpeg	http://localhost:5000/static/images/gear/tent4.jpeg
153	4-person tent	Tents & Shelter	Patagonia	mscott@hbright.com	94609	static/images/gear/tent4.jpeg	http://localhost:5000/static/images/gear/tent4.jpeg
150	hammock	Camp Furniture	Osprey	reesew@hbright.com	94703	static/images/gear/hammock.jpg	http://localhost:5000/static/images/gear/hammock/jpg
128	hammock	Camp Furniture	Nemo	mpalmer@hbright.com	94127	static/images/gear/hammock.jpg	http://localhost:5000/static/images/gear/hammock/jpg
130	cold weather sleeping bag	Sleeping Bags	Sea to Summit	slittle@hbright.com	94105	static/images/gear/sleepingbag.jpg	http://localhost:5000/static/images/gear/sleepingbag.jpg
139	cold weather sleeping bag	Sleeping Bags	REI	mpalmer@hbright.com	94127	static/images/gear/sleepingbag.jpg	http://localhost:5000/static/images/gear/sleepingbag.jpg
197	bear canister	Camp Kitchen	Black Diamond	shilpad@hbright.com	94115	static/images/gear/bearcan.jpg	http://localhost:5000/static/images/gear/bearcan.jpg
145	mens 85L backpacking pack	Backpacks & Bags	Marmot	annieclark@hbright.com	94110	static/images/gear/backpack_l.jpg	http://localhost:5000/static/images/gear/backpack_l.jpg
182	compass	Knives & Tools	Black Diamond	mruffalo@hbright.com	94131	static/images/gear/compass.jpg	http://localhost:5000/static/images/gear/compass.jpg
183	backpacking mattress	Camp Bedding	Black Diamond	slittle@hbright.com	94105	static/images/gear/gear_photo.jpg	http://localhost:5000/static/images/gear/gear_photo.jpg
63	warm weather sleeping bag	Sleeping Bags	Mountain Hardwear	annieclark@hbright.com	94110	static/images/gear/sleepingbagsummer.jpg	http://localhost:5000/static/images/gear/sleepingbagsummer.jpg
179	flashlight	Camp Lighting	Nemo	bjnovak@hbright.com	94109	static/images/gear/flashlight.jpg	http://localhost:5000/static/images/gear/flashlight.jpg
177	womens 65L backpacking pack	Backpacks & Bags	Evernew	shilpad@hbright.com	94115	static/images/gear/backpack_lw.jpeg	http://localhost:5000/static/images/gear/backpack_lw.jpeg
198	flashlight	Camp Lighting	Nemo	hjackman@hbright.com	94122	static/images/gear/flashlight.jpg	http://localhost:5000/static/images/gear/flashlight.jpg
52	camping pad	Camp Bedding	Therm-a-Rest	annieclark@hbright.com	94110	static/images/gear/sleeping.jpg	http://localhost:5000/static/images/gear/sleeping.jpg
193	30L daypack	Backpacks & Bags	Mountain Hardwear	dwight@hbright.com	94129	static/images/gear/pack30L.jpg	http://localhost:5000/static/images/gear/pack30L.jpg
10	mens 35L hiking pack	Backpacks & Bags	Terra Nova	annieclark@hbright.com	94110	static/images/gear/backpack_sm.jpg	http://localhost:5000/static/images/gear/backpack_sm.jpg
5	womens 65L backpacking pack	Backpacks & Bags	The North Face	annieclark@hbright.com	94110	static/images/gear/backpack_lw.jpeg	http://localhost:5000/static/images/gear/backpack_lw.jpeg
171	silicon cookware	Camp Kitchen	Sea to Summit	shilpad@hbright.com	94115	static/images/gear/cookwaresili.jpg	http://localhost:5000/static/images/gear/cookwaresili.jpg
184	sleeping pad	Camp Bedding	CamelBak	reesew@hbright.com	94703	static/images/gear/sleeping.jpg	http://localhost:5000/static/images/gear/sleeping.jpg
176	warm weather sleeping bag	Sleeping Bags	Mountain Hardwear	slittle@hbright.com	94105	static/images/gear/sleepingbagsummer.jpg	http://localhost:5000/static/images/gear/sleepingbagsummer.jpg
178	womens 25L daypack	Backpacks & Bags	Patagonia	bjnovak@hbright.com	94109	static/images/gear/backpack_s.jpg	http://localhost:5000/static/images/gear/backpack_s.jpg
181	womens 25L daypack	Backpacks & Bags	Patagonia	vhudgens@hbright.com	94941	static/images/gear/backpack_s.jpg	http://localhost:5000/static/images/gear/backpack_s.jpg
188	womens 65L backpacking pack	Backpacks & Bags	REI	slittle@hbright.com	94105	static/images/gear/backpack_lw.jpeg	http://localhost:5000/static/images/gear/backpack_lw.jpeg
194	2-person tent	Tents & Shelter	MSR	dwight@hbright.com	94129	static/images/gear/tent.jpg	http://localhost:5000/static/images/gear/tent.jpg
191	mens 35L hiking pack	Backpacks & Bags	Nemo	mscott@hbright.com	94609	static/images/gear/backpack_sm.jpg	http://localhost:5000/static/images/gear/backpack_sm.jpg
180	hydration pack	Hydration	Camelbak	bjnovak@hbright.com	94109	static/images/gear/hydration.jpeg	http://localhost:5000/static/images/gear/hydration.jpeg
170	hydration pack	Hydration	Camelbak	pamb@hbright.com	94610	static/images/gear/hydration.jpeg	http://localhost:5000/static/images/gear/hydration.jpeg
175	silicon cookware	Camp Kitchen	Sea to Summit	bjnovak@hbright.com	94109	static/images/gear/cookwaresili.jpg	http://localhost:5000/static/images/gear/cookwaresili.jpg
195	titanium cookware	Camp Kitchen	GSI	shilpad@hbright.com	94115	static/images/gear/titanium.jpg	http://localhost:5000/static/images/gear/titanium.jpg
173	titanium cookware	Camp Kitchen	GSI	pamb@hbright.com	94610	static/images/gear/titanium.jpg	http://localhost:5000/static/images/gear/titanium.jpg
186	womens 65L backpacking pack	Backpacks & Bags	Black Diamond	vhudgens@hbright.com	94941	static/images/gear/backpack_lw.jpeg	http://localhost:5000/static/images/gear/backpack_lw.jpeg
189	titanium cookware	Camp Kitchen	GSI	hjackman@hbright.com	94122	static/images/gear/titanium.jpg	http://localhost:5000/static/images/gear/titanium.jpg
185	camping pad	Camp Bedding	Therm-a-Rest	kellyk@hbright.com	94941	static/images/gear/sleeping.jpg	http://localhost:5000/static/images/gear/sleeping.jpg
172	cold weather sleeping bag	Sleeping Bags	Evernew	bjnovak@hbright.com	94109	static/images/gear/sleepingbag.jpg	http://localhost:5000/static/images/gear/sleepingbag.jpg
201	cold weather sleeping bag	Sleeping Bags	Sea to Summit	angela@hbright.com	94110	static/images/gear/sleepingbag.jpg	http://localhost:5000/static/images/gear/sleepingbag.jpg
192	lantern	Camp Lighting	Black Diamond	rainnwilson@hbright.com	94109	static/images/gear/lantern.jpg	http://localhost:5000/static/images/gear/lantern.jpg
13	lantern	Camp Lighting	Black Diamond	annieclark@hbright.com	94110	static/images/gear/lantern.jpg	http://localhost:5000/static/images/gear/lantern.jpg
168	compact pocket knife	Knives & Tools	Sierra Designs	annieclark@hbright.com	94110	static/images/gear/knife.jpg	http://localhost:5000/static/images/gear/knife.jpg
133	cold weather sleeping bag	Sleeping Bags	Evernew	annieclark@hbright.com	94110	static/images/gear/sleepingbag.jpg	http://localhost:5000/static/images/gear/sleepingbag.jpg
34	mens 35L hiking pack	Backpacks & Bags	Big Agnes	vhudgens@hbright.com	94941	static/images/gear/backpack_sm.jpg	http://localhost:5000/static/images/gear/backpack_sm.jpg
120	mens 85L backpacking pack	Backpacks & Bags	MSR	mscott@hbright.com	94609	static/images/gear/backpack_l.jpg	http://localhost:5000/static/images/gear/backpack_l.jpg
161	mens 85L backpacking pack	Backpacks & Bags	CamelBak	mpalmer@hbright.com	94127	static/images/gear/backpack_l.jpg	http://localhost:5000/static/images/gear/backpack_l.jpg
160	womens 25L daypack	Backpacks & Bags	Patagonia	slittle@hbright.com	94105	static/images/gear/backpack_s.jpg	http://localhost:5000/static/images/gear/backpack_s.jpg
2	stainless steelwater bottle	Hydration	Hydro Flask	kellyk@hbright.com	94941	static/images/gear/hydroflask.jpg	http://localhost:5000/static/images/gear/hydroflask.jpg
8	stainless steelwater bottle	Hydration	Hydro Flask	seanp@hbright.com	94705	static/images/gear/hydroflask.jpg	http://localhost:5000/static/images/gear/hydroflask.jpg
72	2-person tent	Tents & Shelter	Osprey	kellyk@hbright.com	94941	static/images/gear/tent.jpg	http://localhost:5000/static/images/gear/tent.jpg
108	2-person tent	Tents & Shelter	CamelBak	mscott@hbright.com	94609	static/images/gear/tent.jpg	http://localhost:5000/static/images/gear/tent.jpg
109	4-person tent	Tents & Shelter	Evernew	kellyk@hbright.com	94941	static/images/gear/tent4.jpeg	http://localhost:5000/static/images/gear/tent4.jpeg
190	bear canister	Camp Kitchen	MSR	kellyk@hbright.com	94941	static/images/gear/bearcan.jpg	http://localhost:5000/static/images/gear/bearcan.jpg
116	lantern	Camp Lighting	Black Diamond	kellyk@hbright.com	94941	static/images/gear/lantern.jpg	http://localhost:5000/static/images/gear/lantern.jpg
200	compass	Knives & Tools	Patagonia	vhudgens@hbright.com	94941	static/images/gear/compass.jpg	http://localhost:5000/static/images/gear/compass.jpg
169	silicon cookware	Camp Kitchen	Sea to Summit	annieclark@hbright.com	94110	static/images/gear/cookwaresili.jpg	http://localhost:5000/static/images/gear/cookwaresili.jpg
151	canister stove	Camp Kitchen	Snow Peak	slittle@hbright.com	94105	static/images/gear/stove.jpg	http://localhost:5000/static/images/gear/stove.jpg
111	camping pad	Camp Bedding	Therm-a-Rest	seanp@hbright.com	94705	static/images/gear/sleeping.jpg	http://localhost:5000/static/images/gear/sleeping.jpg
121	30L daypack	Backpacks & Bags	The North Face	kellyk@hbright.com	94941	static/images/gear/pack30L.jpg	http://localhost:5000/static/images/gear/pack30L.jpg
87	lantern	Camp Lighting	Black Diamond	dwight@hbright.com	94129	static/images/gear/lantern.jpg	http://localhost:5000/static/images/gear/lantern.jpg
94	lantern	Camp Lighting	Black Diamond	dwight@hbright.com	94129	static/images/gear/lantern.jpg	http://localhost:5000/static/images/gear/lantern.jpg
122	lantern	Camp Lighting	Black Diamond	bjnovak@hbright.com	94109	static/images/gear/lantern.jpg	http://localhost:5000/static/images/gear/lantern.jpg
90	headlamp	Camp Lighting	Black Diamond	mscott@hbright.com	94609	static/images/gear/headlamp.jpg	http://localhost:5000/static/images/gear/headlamp.jpg
196	bear canister	Camp Kitchen	Mountain Hardwear	kellyk@hbright.com	94941	static/images/gear/bearcan.jpg	http://localhost:5000/static/images/gear/bearcan.jpg
92	flashlight	Camp Lighting	Nemo	pamb@hbright.com	94610	static/images/gear/flashlight.jpg	http://localhost:5000/static/images/gear/flashlight.jpg
69	flashlight	Camp Lighting	Nemo	mpalmer@hbright.com	94127	static/images/gear/flashlight.jpg	http://localhost:5000/static/images/gear/flashlight.jpg
84	silicon cookware	Camp Kitchen	Sea to Summit	reesew@hbright.com	94703	static/images/gear/cookwaresili.jpg	http://localhost:5000/static/images/gear/cookwaresili.jpg
157	warm weather sleeping bag	Sleeping Bags	Mountain Hardwear	pamb@hbright.com	94610	static/images/gear/sleepingbagsummer.jpg	http://localhost:5000/static/images/gear/sleepingbagsummer.jpg
164	hammock	Camp Furniture	Osprey	reesew@hbright.com	94703	static/images/gear/hammock.jpg	http://localhost:5000/static/images/gear/hammock/jpg
102	sleeping pad	Camp Bedding	Evernew	kellyk@hbright.com	94941	static/images/gear/sleeping.jpg	http://localhost:5000/static/images/gear/sleeping.jpg
199	sleeping pad	Camp Bedding	Mountain Hardwear	vhudgens@hbright.com	94941	static/images/gear/sleeping.jpg	http://localhost:5000/static/images/gear/sleeping.jpg
174	cold weather sleeping bag	Sleeping Bags	Mountain Hardwear	vhudgens@hbright.com	94941	static/images/gear/sleepingbag.jpg	http://localhost:5000/static/images/gear/sleepingbag.jpg
37	titanium cookware	Camp Kitchen	GSI	kellyk@hbright.com	94941	static/images/gear/titanium.jpg	http://localhost:5000/static/images/gear/titanium.jpg
187	cold weather sleeping bag	Sleeping Bags	Nemo	mruffalo@hbright.com	94131	static/images/gear/sleepingbag.jpg	http://localhost:5000/static/images/gear/sleepingbag.jpg
110	cold weather sleeping bag	Sleeping Bags	Marmot	mscott@hbright.com	94609	static/images/gear/sleepingbag.jpg	http://localhost:5000/static/images/gear/sleepingbag.jpg
83	camp tarp	Tents & Shelter	Terra Nova	kellyk@hbright.com	94941	static/images/gear/tarp.jpg	http://localhost:5000/static/images/gear/tarp.jpg
202	Cooking Kit	Camp Kitchen	Snow Peak	angela@hbright.com	94110	static/images/profpics/cookingkit.jpg	http://localhost:5000/_uploads/photos/cookingkit.jpg
\.


--
-- Name: equipment_gear_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('equipment_gear_id_seq', 202, true);


--
-- Data for Name: lenders; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY lenders (lender_email, password, first_name, last_name, lender_photo, lender_photo_url) FROM stdin;
mruffalo@hbright.com	lender1	Mark	Ruffalo	static/images/profpics/mruffalo.jpg	http://localhost:5000/static/images/profpics/mruffalo.jpg
reesew@hbright.com	lender2	Reese	Witherspoon	static/images/profpics/rwitherspoon.jpg	http://localhost:5000/static/images/profpics/rwitherspoon.jpg
hjackman@hbright.com	lender3	Hugh	Jackman	static/images/profpics/hjackman.jpg	http://localhost:5000/static/images/profpics/hjackman.jpg
seanp@hbright.com	lender4	Sean	Penn	static/images/profpics/spenn.jpg	http://localhost:5000/static/images/profpics/spenn.jpg
vhudgens@hbright.com	lender5	Vanessa	Hudgens	static/images/profpics/vhudgens.jpg	http://localhost:5000/static/images/profpics/vhudgens.jpg
shilpad@hbright.com	lender6	Shilpa	Dutta	static/images/profpics/sdutta.jpg	http://localhost:5000/static/images/profpics/sdutta.jpg
slittle@hbright.com	lender7	Stuart	Little	static/images/profpics/slittle.jpg	http://localhost:5000/static/images/profpics/slittle.jpg
mscott@hbright.com	lender8	Michael	Scott	static/images/profpics/mscott.jpg	http://localhost:5000/static/images/profpics/mscott.jpg
mpalmer@hbright.com	lender9	Mereditch	Palmer	static/images/profpics/mpalmer.jpg	http://localhost:5000/static/images/profpics/mpalmer.jpg
pamb@hbright.com	lender10	Pam	Beesly	static/images/profpics/pbeesly.jpg	http://localhost:5000/static/images/profpics/pbeesly.jpg
rainnwilson@hbright.com	lender11	Rainn	Wilson	static/images/profpics/rainnw.jpg	http://localhost:5000/static/images/profpics/rainnw.jpg
dwight@hbright.com	lender12	Dwight	Schrute	static/images/profpics/dschrute.jpg	http://localhost:5000/static/images/profpics/dschrute.jpg
bjnovak@hbright.com	lender13	BJ	Novak	static/images/profpics/bjnovak.jpg	http://localhost:5000/static/images/profpics/bjnovak.jpg
annieclark@hbright.com	lender14	Annie	Clark	static/images/profpics/aclark.jpg	http://localhost:5000/static/images/profpics/aclark.jpg
kellyk@hbright.com	lender15	Kelly	Kapoor	static/images/profpics/kkapoor.jpg	http://localhost:5000/static/images/profpics/kkapoor.jpg
angela@hbright.com	lender16	Angela	Liu	static/images/profpics/aclark_1.jpg	http://localhost:5000/_uploads/photos/aclark_1.jpg
\.


--
-- Data for Name: rentedout; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY rentedout (rented_id, lender_email, camper_email, start_date, end_date) FROM stdin;
\.


--
-- Name: rentedout_rented_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('rentedout_rented_id_seq', 1, false);


--
-- Name: campers_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY campers
    ADD CONSTRAINT campers_pkey PRIMARY KEY (camper_email);


--
-- Name: equipment_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (gear_id);


--
-- Name: lenders_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY lenders
    ADD CONSTRAINT lenders_pkey PRIMARY KEY (lender_email);


--
-- Name: rentedout_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY rentedout
    ADD CONSTRAINT rentedout_pkey PRIMARY KEY (rented_id);


--
-- Name: equipment_lender_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY equipment
    ADD CONSTRAINT equipment_lender_email_fkey FOREIGN KEY (lender_email) REFERENCES lenders(lender_email);


--
-- Name: rentedout_camper_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY rentedout
    ADD CONSTRAINT rentedout_camper_email_fkey FOREIGN KEY (camper_email) REFERENCES campers(camper_email);


--
-- Name: rentedout_lender_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY rentedout
    ADD CONSTRAINT rentedout_lender_email_fkey FOREIGN KEY (lender_email) REFERENCES lenders(lender_email);


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

