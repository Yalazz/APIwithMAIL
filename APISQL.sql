--
-- PostgreSQL database cluster dump
--

-- Started on 2024-09-12 16:15:35

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:nMDq3tnKU0/FNw4RK/ryMA==$Z4KFQeKVr0QjIVDzBd+STUwx2UBksPNLPsW2u3aXRVA=:OoDOq+yhFdxBIy/4Z2E7cNOrDGsAloVaH/knzR2izcI=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-09-12 16:15:35

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

-- Completed on 2024-09-12 16:15:36

--
-- PostgreSQL database dump complete
--

--
-- Database "CarsDB" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-09-12 16:15:36

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
-- TOC entry 4833 (class 1262 OID 16533)
-- Name: CarsDB; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "CarsDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "CarsDB" OWNER TO postgres;

\connect "CarsDB"

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
-- TOC entry 220 (class 1259 OID 16569)
-- Name: CarImages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CarImages" (
    id integer NOT NULL,
    carid integer NOT NULL,
    imageurl text NOT NULL
);


ALTER TABLE public."CarImages" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16568)
-- Name: CarImages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CarImages_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."CarImages_id_seq" OWNER TO postgres;

--
-- TOC entry 4834 (class 0 OID 0)
-- Dependencies: 219
-- Name: CarImages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CarImages_id_seq" OWNED BY public."CarImages".id;


--
-- TOC entry 215 (class 1259 OID 16534)
-- Name: Cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cars" (
    id integer NOT NULL,
    model text,
    make text,
    color text,
    year integer,
    doors smallint,
    imageurl text,
    isapproved boolean DEFAULT false
);


ALTER TABLE public."Cars" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16541)
-- Name: Cars_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Cars" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Cars_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16761)
-- Name: email_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_logs (
    id integer NOT NULL,
    car_id integer,
    subject character varying(255),
    content text,
    recipient_email character varying(255),
    send_time timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(50)
);


ALTER TABLE public.email_logs OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16760)
-- Name: email_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.email_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.email_logs_id_seq OWNER TO postgres;

--
-- TOC entry 4835 (class 0 OID 0)
-- Dependencies: 223
-- Name: email_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.email_logs_id_seq OWNED BY public.email_logs.id;


--
-- TOC entry 222 (class 1259 OID 16717)
-- Name: selectedcars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.selectedcars (
    id integer NOT NULL,
    carid integer NOT NULL,
    selectedat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.selectedcars OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16716)
-- Name: selectedcars_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.selectedcars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.selectedcars_id_seq OWNER TO postgres;

--
-- TOC entry 4836 (class 0 OID 0)
-- Dependencies: 221
-- Name: selectedcars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.selectedcars_id_seq OWNED BY public.selectedcars.id;


--
-- TOC entry 218 (class 1259 OID 16557)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16556)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4837 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4656 (class 2604 OID 16572)
-- Name: CarImages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarImages" ALTER COLUMN id SET DEFAULT nextval('public."CarImages_id_seq"'::regclass);


--
-- TOC entry 4659 (class 2604 OID 16764)
-- Name: email_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_logs ALTER COLUMN id SET DEFAULT nextval('public.email_logs_id_seq'::regclass);


--
-- TOC entry 4657 (class 2604 OID 16720)
-- Name: selectedcars id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.selectedcars ALTER COLUMN id SET DEFAULT nextval('public.selectedcars_id_seq'::regclass);


--
-- TOC entry 4655 (class 2604 OID 16560)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4823 (class 0 OID 16569)
-- Dependencies: 220
-- Data for Name: CarImages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CarImages" (id, carid, imageurl) FROM stdin;
220	190	/images/190/ce1a1671-f727-46a2-bc23-fcc58f5c121a.png
4	56	wwwroot/images\\istockphoto-486827324-612x612.jpg
5	56	wwwroot/images\\istockphoto-486827324-612x612.jpg
191	155	/images/155/e4c4fed5-2afc-45f7-984d-2a5e1689e0e6.png
201	157	/images/157/f4699a3a-e289-428e-bf30-199bcbc6c031.png
203	158	/images/158/e5c5018d-b45f-426d-9e56-ad661e94648f.png
206	164	/images/164/2cfd727a-dea7-457a-adb8-a1bbf0635215.png
207	164	/images/164/2242ae6e-0974-4e97-a92b-ff7bf2d4de13.png
211	137	/images/137/82ddcf17-6f24-40b0-a6cb-111726f59261.png
216	133	/images/133/34e9ed61-439d-4b1f-9142-c1a01d601516.png
93	56	/images/56/25948d2a-1ffb-482e-9fe5-5caa3d88ffad_pic_trulli.jpg
219	190	/images/190/d0f21a26-cc69-4238-a818-13325dd0c626.png
221	401	/images/401/a069d04f-ff6e-4a76-abeb-86fcb00af924.png
200	162	/images/162/72a40e3f-b25c-425d-9434-743cdb5b0090.png
202	167	/images/167/4d74958c-d272-43fb-b2cb-4bc2c961a933.png
204	157	/images/157/4f089409-8005-4030-b09b-16f16e7f28e2.png
205	181	/images/181/ea9437a8-6dd3-4453-bf39-160cc1bed477.png
210	145	/images/145/9fcac148-04d4-49f1-9888-117373b40228.png
\.


--
-- TOC entry 4818 (class 0 OID 16534)
-- Dependencies: 215
-- Data for Name: Cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cars" (id, model, make, color, year, doors, imageurl, isapproved) FROM stdin;
213	stridfsdfdsfsdngaaa	fsfsdaaaa	strifdssdfng	33	33	\N	t
206	string	ppppppppppppppppppp	string	2017	0	\N	t
203	sdfsdfds	ikiyuzuc	stfsdfsddsfdsfdsring	3213131	33	\N	t
212	stridfsdfdsfsdng	fsfsdfsfdsasdsddsadafdsf	strifdssdfng	2	3	\N	t
136	adadasad	asdadaaaa	2112	2121	1	\N	t
128	sadsaddaa	asdadadaf	sdasda	212	2	\N	f
193	strisdsdngasd	csadaads	strisdadsadasng	0	0	\N	t
194	strisdsdngasd	vayvayvayvayvayvavyayvya	strisdadsadasng	0	0	\N	t
196	dedendednedne	denedenededendnednende	string	0	0	\N	t
197	sdfsdfds	dsfdsfddsasdsdfdsfsfds	stfsdfsddsfdsfdsring	3213131	33	\N	t
198	sdfsdfds	asdasdsa	stfsdfsddsfdsfdsring	3213131	33	\N	t
199	sdfsdfds	asdasdadasdasasdsasa	stfsdfsddsfdsfdsring	3213131	33	\N	t
200	sdfsdfds	asdasasdasdasddadasdasasdsasa	stfsdfsddsfdsfdsring	3213131	33	\N	t
201	sdfsdfds	asdasasdasdasddadasdasasdsasa	stfsdfsddsfdsfdsring	3213131	33	\N	t
202	sdfsdfds	asdasasdasdasddadasdasasdsasa	stfsdfsddsfdsfdsring	3213131	33	\N	t
214	stridfsdfdsfsdng	fsfsdsaddfsfdsadsasasdsddsadafdsf	strifdssdfng	2	3	\N	t
215	strasdsadasdsdaing	adasdsadasa	adasddasasd	2332	2	\N	t
204	sdfsdfds	awfgbv	stfsdfsddsfdsfdsring	3213131	33	\N	t
186	dasddd	asds	sdaaddas	2	22	\N	t
205	sdfsdfds	okmnhybg	stfsdfsddsfdsfdsring	3213131	33	\N	t
187	asasd	sadasd	asdasd	22	2	\N	t
154	sdadsad	asdasa	sadsaasd	212	2	\N	f
189	ddsaasdsad	asdsdasaa	sadsdadas	22	2	\N	\N
155	sdasadaa	saddsaaaaaa	sasdsa	212	4	/images/155/e4c4fed5-2afc-45f7-984d-2a5e1689e0e6.png	f
145	dda	dasddsaaaaAa	dassad	21	12	/images/145/9fcac148-04d4-49f1-9888-117373b40228.png	t
207	string	ppppppppppppppppppp	string	2	2	\N	t
140	ASDSDAASD	ASDSAa	SDAASD	19	2	\N	f
162	stringa	dasdsadsadasa	string	0	0	/images/162/72a40e3f-b25c-425d-9434-743cdb5b0090.png	f
170	string	s<cdsadadsa	string	0	0	\N	t
129	sadasdsad	adadasda	sadadsa	212	2211	\N	f
168	string	SDAADSASADADD	string	0	0	\N	f
176	Corolla	Toyota	Red	2022	4	\N	\N
137	sdasdadas	asdsdaaaa	asddasdas	221	2	/images/137/82ddcf17-6f24-40b0-a6cb-111726f59261.png	t
133	SAASDSDAsadda	ASDASAaadasad	DSADAS	222	2	/images/133/34e9ed61-439d-4b1f-9142-c1a01d601516.png	t
208	string	ppppppppppppppppppp	string	2	2	\N	t
209	string	ppppppppppppppppppp	string	2	2	\N	t
125	sdsadsa	sadsa	aaa	22	2	\N	t
151	dasdasdd	asdaa	saasdasdsada	212	2	\N	t
142	dasdaas	adsd	zccds	22	2	\N	t
180	sadsadaasd	adsadad	asdsdasdas	222	2	\N	\N
216	strasdsadasdsdaing	adasdsadasa	adasddasasd	2332	2	\N	t
178	dfsfd	ddsffds	sdfsdfsfd	2	222	\N	\N
163	stringA	dasdsadsadas	string	0	0	\N	f
93	vfsdknsSD	kredi kartaaAaaaAaaa	fısmosjoSDD	3922	122	\N	t
165	string	dassasasadsa	string	0	0	\N	f
166	string	dassasasadsa	string	0	0	\N	f
158	sddsa	sdaaa	22	22	2	/images/158/e5c5018d-b45f-426d-9e56-ad661e94648f.png	f
146	sadsadsaad	asdsadsadadadas	saddas	21	21	\N	t
175	string	dwsadsaad	string	0	0	\N	f
144	dada	adsad	dasdas	21	2	\N	t
56	adsadasdasd	asdadadads	ewrwrewrwr	31231	1231	\N	f
173	sdasdasad	sdadsasda	sdaasdsad	3332	3232	\N	t
174	dsadsasdasda	sadfdadsa	dsadsaasd	22	22	\N	t
149	a	a	a	1	1	\N	t
123	sadsadsadaa	sadadada	sadsas	2322	22	\N	f
157	asdsad	aada	adas	2	2	/images/157/f4699a3a-e289-428e-bf30-199bcbc6c031.png	t
130	dsasdds	asdsad	sadasd	21	1	\N	t
148	sadsadsdaaASD	asdsaAA	dsadsaA	212	22	\N	t
181	dassaddas	citizen	dsaasdasdads	22	2	/images/181/ea9437a8-6dd3-4453-bf39-160cc1bed477.png	t
179	saddasd	a	asdsadas	22	2	\N	t
139	DASADSASD	ASDSAD	DASASD	221	2	\N	t
150	ADDASDD	ADSADa	SADDASD	212	2	\N	t
164	string	dassasasadsaaaa	string	0	0	/images/164/2cfd727a-dea7-457a-adb8-a1bbf0635215.png	f
160	string	czxzcxzczzxczaaa	string	0	0	\N	t
185	sadsasad	dssad	dsadd	22	2	\N	t
210	string	olurolurrrrraadas	string	7	7	\N	t
177	stringa	stringa	string	0	0	\N	t
167	string	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	string	0	0	/images/167/4d74958c-d272-43fb-b2cb-4bc2c961a933.png	t
211	stridfsdfdsfsdng	fsfsdfsfdsfdsf	strifdssdfng	2	3	\N	t
217	strasdsadasdsdaing	adasdsadasa	adasddasasd	2332	2	\N	t
218	string	jsabfjasvbkjasfkbas	string	2321	3	\N	t
219	string	fnafdbahkufafll	string	0	0	\N	t
220	string	gaefafafafasfaaed	string	0	0	\N	t
221	sdfdsf	fsdfsdfsfsfd	strifsdffsdng	444	3	\N	t
222	string	fskjfndkljdsnlfsskjfşs	string	0	0	\N	t
223	string	fskjfndkljdsnlfsskjfşs	string	2	2	\N	t
224	string	fskjfndkljdsnlfsskjfşs	string	2	2	\N	t
225	string	strinfdsfdsfdsg	string	0	0	\N	t
226	asfasfa	fasffafsa	string	22	2	\N	t
227	sdfsd	sdfsdfdsfsfdsfds	sdfds	20	20	\N	t
228	sdfsd	sdfsdfdasddsasfsfdsfds	sdfds	20	20	\N	t
229	striasdasng	sadsadsadsasd	string	20	20	\N	t
230	striasdasng	sadsadsadasasd	string	20	20	\N	t
231	striasdasng	sadsadsadasasd	string	20	20	\N	t
232	string	dassdasadas	string	20	20	\N	t
233	string	dassdasaadas	string	20	20	\N	t
234	string	string	string	0	0	\N	t
235	string	sdfsdfsdsdfafafsfs	string	0	0	\N	t
236	dasdsadsa	dasdsasasadsaas	string	0	0	\N	t
237	string	fssdfsdfdssedfdsedfdef	string	0	0	\N	t
238	string	fssdfsdfdssedfdsedfdef	string	43	32	\N	t
239	string	fssdfsdfdsasedfdsedfdef	string	43	32	\N	t
240	string	asdsdsadadaadsaads	string	0	0	\N	t
241	string	asdsdsadadaadsaads	string	42	30	\N	t
242	asddasdasasdasd	asdasdadadsadadsddsa	asdasd	202	20	\N	t
243	string	asdsdsadaadaadsaads	string	42	30	\N	t
244	striaang	asdsdsadaadaadsaads	string	42	30	\N	t
245	striaang	asdsdsadaadaadsaads	staring	42	30	\N	t
246	striaang	asdsdsadaadaadsaaaads	staring	42	30	\N	t
247	striaang	asdsdsadaadaadsaaaads	staring	42	30	\N	t
248	striaang	asdsdsadaadaadsaaaaads	staring	42	30	\N	t
249	striaang	asdsdsadaadaaadsaaaaads	staring	42	30	\N	t
250	striaang	asdsdsadaadaaadsaaaaaads	staring	42	30	\N	t
251	lolool	loollolololoollo	loollolo	23	4	\N	t
252	dasdasasd	gadgdrrfgfddg	string	20	20	\N	t
253	dasdasasd	aaa	string	20	20	\N	t
254	sdfsd	sdfdsfdsffdsfsddsf	string	20	0	\N	t
255	sdfsd	sdfdsfdsffdsafsddsf	string	20	0	\N	t
256	sdfsd	sdfdsfdsffdsafasddsf	string	20	0	\N	t
257	sdfsd	adssdas	string	20	0	\N	t
258	sdfsd	adssasdasdas	string	20	0	\N	t
259	sdfasdsasd	adssasdaasddassdas	string	20	0	\N	t
260	sdfdsdsffds	fsfdsffsffsfsd	fsdsdffsdfsdf	0	0	\N	t
261	sdfdsdsffds	fsfdsffsffsfsd	fsdsdffsdfsdf	0	0	\N	t
262	sdfdsdsffds	fsfdsffsaffsfsd	fsdsdffsdfsdf	0	0	\N	t
263	sdfdsdsffds	fsfdsffsaffsfsd	fsdsdffsdfsdf	20	20	\N	t
264	sdfdsdsffds	fsfdsffaasaffsfsd	fsdsdffsdfsdf	20	20	\N	t
265	sdfdsdsffds	fsfdsffaasadsadaffsfsd	fsdsdffsdfsdf	20	20	\N	t
266	string	fsddfsdfsf	string	202	20	\N	t
267	string	fsddfsasddsaddfsf	string	202	20	\N	t
268	string	fsddfsasddsaddfsf	string	202	20	\N	t
269	string	fsddfsaasddsaddfsf	string	202	20	\N	t
270	string	fsddfsaasddsaddfsf	string	202	20	\N	t
271	string	dfdfsfdfssdffd	string	202	20	\N	t
272	string	aaaaaaaaaaaaaaaaaaaaaaa	string	222	2	\N	t
273	string	asdadsa	string	222	2	\N	t
274	string	asdsadsa	string	222	2	\N	t
275	string	adassdaadsd	string	222	2	\N	t
276	string	sdfsfsfsdfdssfdsd	string	20	20	\N	t
277	string	sdfsfsfsdfdssfdsd	string	20	20	\N	t
278	string	sdfsfsfsdfdassfdsd	string	20	20	\N	t
279	string	adıuhsıufshduıfhsdulıhsdılsf	string	0	0	\N	t
280	string	adıuhsıufshdauıfhsdulıhsdılsf	string	0	0	\N	t
281	string	asdsaasdsa	string	20	20	\N	t
282	string	asdasdsaddsaddasda	string	20	20	\N	t
283	string	sdaadsadasdsa	string	20	20	\N	t
284	strewrrewing	rfewrewewrrew	stewewrring	30	10	\N	t
285	string	utytttyu	string	20	20	\N	t
286	string	utyttatyu	string	20	20	\N	t
287	string	ewrewrwerrwerewr	string	0	0	\N	t
288	string	ADAŞJDAWWJFDAJA	string	20	20	\N	t
289	string	aaaaaaaa	string	20	20	\N	t
290	aaa	aaaaaaaa	aaaaa	20	20	\N	t
191	adasdsa	asdasdA	dasddad	222	22	\N	t
291	ASDADSA	AAA	ADSDASDD	222	2	\N	\N
292	striWQEWEQWEQng	strWQWEQWEWQEng	asdsadsasadsa	0	0	\N	t
293	striWQEWEQWEQng	strWQWEQWEWQEng	asdsadsasadsa	20	20	\N	t
294	striWQEWEQWEQng	dasdasd	asdsadsasadsa	20	20	\N	t
295	striWQEWEQWEQng	asdasda	asdsadsasadsa	20	20	\N	t
296	striWQEWEQWEQng	asdasas	asdsadsasadsa	20	20	\N	t
297	aaaaaaaaaaaaaaaaaaaaaaa	asdasdasdasaaaaa	asdsadsasadsa	20	20	\N	t
298	aaaaaaaaaaaaaaaaaaaaaaa	asdasdasdasaaaaa	asdsadsasadsa	202	20	\N	t
299	aaaaaaaaaaaaaaaaaaaaaaa	asdasdasdasaaaaa	asdsadsasadsa	2022	20	\N	t
301	addd	asdadsadsdaas	sssss	2022	20	\N	\N
302	addd	asdadsadsdaas	sssss	2022	20	\N	\N
303	addd	ddddddddddddddasdasdasa	sssss	2022	20	\N	\N
304	addd	ddsadasdasa	sssss	2022	20	\N	\N
305	string	adsaddadaddas	string	0	0	\N	t
306	adasas	asdsasad	aads	10	5	\N	t
307	addd	asdassadsaas	sssss	2022	20	\N	\N
308	adasas	asdsadassdasad	aads	10	5	\N	t
309	adasas	aaaa	aads	10	5	\N	t
310	dasdsads	sadsdasdasdadas	string	1101	4	\N	t
311	dwdew	aaaaaaaaaaq	weeew	10	20	\N	t
312	dwdew	asasas	weeew	10	20	\N	t
313	dwdew	asasaas	weeew	10	20	\N	t
314	dwdew	asaasaas	weeew	10	20	\N	t
315	dwdew	asaasaaaas	weeew	10	20	\N	t
316	dwdew	dqweq	weeew	10	20	\N	t
317	dwdew	asdasdasaddassa	weeew	10	20	\N	t
318	string	gloglgoglogl	string	2710	5	\N	t
319	dsdsssd	plspsls	dsds	2010	4	\N	t
320	dsdsssd	awdacasx	dsds	2010	4	\N	t
321	dsdsssd	defcsdcdcd	dsds	2010	4	\N	t
322	string	plokjhgbnmnbv	string	0	0	\N	t
323	string	okjhgbnm	string	0	0	\N	t
324	string	hdgrtgrgrgsrggg	string	10	10	\N	t
325	string	gdgdrgfdgrgfdfdrgf	string	0	0	\N	t
326	string	hfgbghfdzfbgsg	string	0	0	\N	t
327	string	jnghnfgnhgng	string	0	0	\N	t
328	string	asdadadsaddas	string	0	0	\N	t
329	string	sadsadasdasdsa	string	20	20	\N	t
330	stdssaring	fasdasdda	strisdsng	220	20	\N	t
331	string	HFGHDTRGRDGRTGG	string	10	10	\N	t
332	string	fesfeffe	string	0	0	\N	t
333	string	fesfeffe	string	20	20	\N	t
334	string	yertrr5gstr5t	string	101	10	\N	t
335	string	dfgfddgdgd	string	110	10	\N	t
336	string	asdsadsddasdsaasd	string	110	10	\N	t
337	string	dfgfdsgdf	string	10	20	\N	t
338	string	dfgaafdsgdf	string	10	20	\N	t
339	string	asdsaaddasas	string	10	20	\N	t
340	string	sdfdfsdfcddfs	string	2111	10	\N	t
341	string	dasddasdgbavdba	string	2111	10	\N	t
342	ADSX	LKJHGFDX	string	22222	3	\N	t
343	string	dadasgybxdsauygsabıa	string	101	10	\N	t
344	string	dadasgybxdasdasdasauygsabıa	string	101	10	\N	t
345	string	asdvfgbvd	string	101	10	\N	t
346	adsaf	kjhgaavfc	dadada	587	5	\N	t
347	adsaf	adadasdasddasdasd	dadada	587	5	\N	t
348	dsaddsasda	asdsadd	dsasdadsa	22	2	\N	\N
349	string	gtfhdbdfbxb	string	0	0	\N	t
392	sfds	dfssds	fdsfddsfdsf	211212	2	\N	f
351	string	gfdfdgfdgdf	string	10	10	\N	t
352	string	gfdfaadgfdgdf	string	10	10	\N	t
353	string	gfdfaaadgfdgdf	string	10	10	\N	t
354	string	gfdfaaadagfdgdf	string	10	10	\N	t
355	string	gfdfaaaadagfdgdf	string	10	10	\N	t
356	string	asdsadsaasdas	string	10	10	\N	t
357	string	asdsadsaaasdas	string	10	10	\N	t
358	string	asdsadsaaaasdas	string	10	10	\N	t
389	sadsadsaddsa	asdsadsda	sadsaddsasd	212121	2121	\N	f
359	string	asdsadsaaaaasdas	string	10	10	\N	t
360	string	asdsadsaaaaasdas	string	10	10	\N	t
350	string	aaasdsaaaad	string	10	10	string	f
361	string	fdgdffdeg	string	20	20	\N	t
391	daasdsa	asdsa	asdsaasdd	221	21	\N	f
362	string	fdgdfafdeg	string	20	20	\N	t
363	string	fdgdfafadeg	string	20	20	\N	t
364	string	hkjfjfkufjj	string	0	0	\N	t
401	dsadffds	asdfvfcds	sdfgdfvcx	2021	232	/images/401/a069d04f-ff6e-4a76-abeb-86fcb00af924.png	f
152	string	sdadaasaadasadsa	string	0	0	string	t
365	strinag	fdgdfafadeg	string	20	20	\N	t
366	strinag	fdgdfafadeg	string	20	20	\N	t
367	string	hkjfjsadsafkufjj	string	0	0	\N	t
368	string	dfgfddfgfdfdg	string	0	0	\N	t
369	string	dfgfddfgfdfdg	string	10	10	\N	t
370	string	dfgfddfgfadfdg	string	10	10	\N	t
371	string	dfgfddfgfadfdg	string	10	10	\N	t
372	string	dfgfddafgfadfdg	string	10	10	\N	t
373	dasdasdasad	asddasdas	sadsadsad	2212	2	\N	f
190	dsasdasda	dsasada	sdasdaasddsa	22	2	/images/190/ce1a1671-f727-46a2-bc23-fcc58f5c121a.png	f
374	dsasaddsa	asddsasda	sdadsadassda	222	222	\N	f
375	string	ytdyhrtrghydgrrtg	string	0	0	\N	t
300	string	sdfcsdcsdfscfsc	string	0	0	string	t
376	string	ytdyhrtrghydgrrtg	string	0	0	\N	t
377	string	ytdyhrtrghyadgrrtg	string	0	0	\N	t
378	string	ytdyhrtaasasrghyadgrrtg	string	0	0	\N	t
379	string	adsadsaasddasdaasda	string	10	10	\N	t
380	string	ssssssssssssssssssssss	string	10	10	\N	t
381	sadasdasdas	asdsadasdasd	dasdsaas	222	22	\N	f
382	sasdasdsad	asdasda	sadasds	22	2	\N	f
383	asdasas	dasds	adsadsdaasd	212	1221	\N	f
384	asddaasdasdasasd	adadsada	asdasdasd	212	22	\N	f
385	hgfdsxcvb	lkjhgfc	jhgfgh	654	4456	\N	f
386	ddsadasas	adasdsaas	asdaasdas	221212	2	\N	f
387	asadasdsad	adsaasasds	dsadsasad	2222	2	\N	f
388	btgvfdcvg	jhybgvf	gvfcvgf	3233	323	\N	f
390	dassa	asdsada	dddadad	221	21221	\N	f
\.


--
-- TOC entry 4827 (class 0 OID 16761)
-- Dependencies: 224
-- Data for Name: email_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email_logs (id, car_id, subject, content, recipient_email, send_time, created_at, status) FROM stdin;
1	1	Test Subject	Test Content	test@example.com	2024-09-12 10:37:24.898378	2024-09-12 10:37:24.898378	\N
2	385	Yeni Araç Bilgisi	\r\n            <h2>Yeni Araç Bilgisi</h2>\r\n            <p><strong>ID 385</strong> olan araç, <strong>lkjhgfc</strong> markasının, <strong>hgfdsxcvb</strong> modelindeki, <em>jhgfgh</em> renginde olan, 654 yılında üretilmiş ve 4456 kapılı olan aracınız <strong>12.09.2024 10:46</strong> tarihinde kaydedildi!</p>\r\n            <br>\r\n            <p>Araç Detayları:</p>\r\n            <ul>\r\n                <li><strong>ID:</strong> 385</li>\r\n                <li><strong>Marka:</strong> lkjhgfc</li>\r\n                <li><strong>Model:</strong> hgfdsxcvb</li>\r\n                <li><strong>Renk:</strong> jhgfgh</li>\r\n                <li><strong>Yıl:</strong> 654</li>\r\n                <li><strong>Kapı Sayısı:</strong> 4456</li>\r\n                <li><strong>Onaylanma Durumu:</strong> Onaylanmadı</li>\r\n            </ul>\r\n            <br>\r\n            <p><em>Bu mesaj 12.09.2024 10:46 tarihinde oluşturulmuştur.</em></p>	emrebilici41@gmail.com	2024-09-12 10:46:03.003575	2024-09-12 10:46:03.137546	\N
3	0	Araç Bilgilerinde Güncelleme	\r\n            <h2>Araç Bilgilerinde Güncelleme</h2>\r\n            <p>ID 195 olan araç, <strong>sdfcsdcsaasasdafscfsc</strong> markası <strong>stringasdfd</strong> model, <em>stringscds</em> renginde, 0 yılında üretilmiş ve 0 kapılı olarak <strong>12.09.2024 10:46</strong> tarihinde güncellenmiştir! </p>\r\n            <h3>Eski Araç Bilgileri:</h3>\r\n            <ul>\r\n                <li><strong>Marka:</strong> sdfcsdcsaasasdafscfsc</li>\r\n                <li><strong>Model:</strong> string</li>\r\n                <li><strong>Renk:</strong> string</li>\r\n                <li><strong>Yıl:</strong> 0</li>\r\n                <li><strong>Kapı Sayısı:</strong> 0</li>\r\n                <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n            </ul>\r\n            <h3>Yeni Araç Bilgileri:</h3>\r\n            <ul>\r\n                <li><strong>Marka:</strong> sdfcsdcsaasasdafscfsc</li>\r\n                <li><strong>Model:</strong> stringasdfd</li>\r\n                <li><strong>Renk:</strong> stringscds</li>\r\n                <li><strong>Yıl:</strong> 0</li>\r\n                <li><strong>Kapı Sayısı:</strong> 0</li>\r\n                <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n            </ul>\r\n            <p><em>Bu mesaj 12.09.2024 10:46 tarihinde oluşturulmuştur.</em></p>	emrebilici41@gmail.com	2024-09-12 10:46:04.870273	2024-09-12 10:46:04.870993	\N
4	386	Yeni Araç Bilgisi	\r\n                <h2>Yeni Araç Bilgisi</h2>\r\n                <p><strong>ID 0</strong> olan araç, <strong></strong> markasının, <strong></strong> modelindeki, <em></em> renginde olan, 0 yılında üretilmiş ve 0 kapılı olan aracınız <strong>12.09.2024 10:59</strong> tarihinde kaydedildi!</p>\r\n                <br>\r\n                <p>Araç Detayları:</p>\r\n                <ul>\r\n                    <li><strong>ID:</strong> 0</li>\r\n                    <li><strong>Marka:</strong> </li>\r\n                    <li><strong>Model:</strong> </li>\r\n                    <li><strong>Renk:</strong> </li>\r\n                    <li><strong>Yıl:</strong> 0</li>\r\n                    <li><strong>Kapı Sayısı:</strong> 0</li>\r\n                    <li><strong>Onaylanma Durumu:</strong> Onaylanmadı</li>\r\n                </ul>\r\n                <br>\r\n                <p><em>Bu mesaj 12.09.2024 10:59 tarihinde oluşturulmuştur.</em></p>	emrebilici41@gmail.com	2024-09-12 10:59:08.790376	2024-09-12 10:59:08.921734	Gönderildi
5	0	Araç Bilgilerinde Güncelleme	\r\n                <h2>Araç Bilgilerinde Güncelleme</h2>\r\n                <p>ID 213 olan araç, <strong>fsfsdsaddfsfdsasdsddsadafdsfaa</strong> markası <strong>stridfsdfdsfsdngaa</strong> model, <em>strifdssdfng</em> renginde, 2 yılında üretilmiş ve 33 kapılı olarak <strong>12.09.2024 10:59</strong> tarihinde güncellenmiştir!</p>\r\n                <h3>Eski Araç Bilgileri:</h3>\r\n                <ul>\r\n                    <li><strong>Marka:</strong> fsfsdsaddfsfdsasdsddsadafdsfaa</li>\r\n                    <li><strong>Model:</strong> stridfsdfdsfsdnga</li>\r\n                    <li><strong>Renk:</strong> strifdssdfng</li>\r\n                    <li><strong>Yıl:</strong> 2</li>\r\n                    <li><strong>Kapı Sayısı:</strong> 33</li>\r\n                    <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n                </ul>\r\n                <h3>Yeni Araç Bilgileri:</h3>\r\n                <ul>\r\n                    <li><strong>Marka:</strong> fsfsdsaddfsfdsasdsddsadafdsfaa</li>\r\n                    <li><strong>Model:</strong> stridfsdfdsfsdngaa</li>\r\n                    <li><strong>Renk:</strong> strifdssdfng</li>\r\n                    <li><strong>Yıl:</strong> 2</li>\r\n                    <li><strong>Kapı Sayısı:</strong> 33</li>\r\n                    <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n                </ul>\r\n                <p><em>Bu mesaj 12.09.2024 10:59 tarihinde oluşturulmuştur.</em></p>	emrebilici41@gmail.com	2024-09-12 10:59:10.638221	2024-09-12 10:59:10.639338	Gönderildi
6	387	Yeni Araç Bilgisi	\r\n                <h2>Yeni Araç Bilgisi</h2>\r\n                <p><strong>ID 0</strong> olan araç, <strong></strong> markasının, <strong></strong> modelindeki, <em></em> renginde olan, 0 yılında üretilmiş ve 0 kapılı olan aracınız <strong>12.09.2024 10:59</strong> tarihinde kaydedildi!</p>\r\n                <br>\r\n                <p>Araç Detayları:</p>\r\n                <ul>\r\n                    <li><strong>ID:</strong> 0</li>\r\n                    <li><strong>Marka:</strong> </li>\r\n                    <li><strong>Model:</strong> </li>\r\n                    <li><strong>Renk:</strong> </li>\r\n                    <li><strong>Yıl:</strong> 0</li>\r\n                    <li><strong>Kapı Sayısı:</strong> 0</li>\r\n                    <li><strong>Onaylanma Durumu:</strong> Onaylanmadı</li>\r\n                </ul>\r\n                <br>\r\n                <p><em>Bu mesaj 12.09.2024 10:59 tarihinde oluşturulmuştur.</em></p>	emrebilici41@gmail.com	2024-09-12 10:59:30.542271	2024-09-12 10:59:30.542852	Gönderildi
7	388	Yeni Araç Bilgisi	\r\n                <h2>Yeni Araç Bilgisi</h2>\r\n                <p><strong>ID 0</strong> olan araç, <strong></strong> markasının, <strong></strong> modelindeki, <em></em> renginde olan, 0 yılında üretilmiş ve 0 kapılı olan aracınız <strong>12.09.2024 11:05</strong> tarihinde kaydedildi!</p>\r\n                <br>\r\n                <p>Araç Detayları:</p>\r\n                <ul>\r\n                    <li><strong>ID:</strong> 0</li>\r\n                    <li><strong>Marka:</strong> </li>\r\n                    <li><strong>Model:</strong> </li>\r\n                    <li><strong>Renk:</strong> </li>\r\n                    <li><strong>Yıl:</strong> 0</li>\r\n                    <li><strong>Kapı Sayısı:</strong> 0</li>\r\n                    <li><strong>Onaylanma Durumu:</strong> Onaylanmadı</li>\r\n                </ul>\r\n                <br>\r\n                <p><em>Bu mesaj 12.09.2024 11:05 tarihinde oluşturulmuştur.</em></p>	emrebilici41@gmail.com	2024-09-12 11:05:36.150128	2024-09-12 11:05:36.282467	Başarılı
8	0	Araç Bilgilerinde Güncelleme	\r\n                <h2>Araç Bilgilerinde Güncelleme</h2>\r\n                <p>ID 213 olan araç, <strong>fsfsdsaddfsfdsasdsddsadafdsfaaaaa</strong> markası <strong>stridfsdfdsfsdngaa</strong> model, <em>strifdssdfng</em> renginde, 2 yılında üretilmiş ve 33 kapılı olarak <strong>12.09.2024 11:05</strong> tarihinde güncellenmiştir!</p>\r\n                <h3>Eski Araç Bilgileri:</h3>\r\n                <ul>\r\n                    <li><strong>Marka:</strong> fsfsdsaddfsfdsasdsddsadafdsfaa</li>\r\n                    <li><strong>Model:</strong> stridfsdfdsfsdngaa</li>\r\n                    <li><strong>Renk:</strong> strifdssdfng</li>\r\n                    <li><strong>Yıl:</strong> 2</li>\r\n                    <li><strong>Kapı Sayısı:</strong> 33</li>\r\n                    <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n                </ul>\r\n                <h3>Yeni Araç Bilgileri:</h3>\r\n                <ul>\r\n                    <li><strong>Marka:</strong> fsfsdsaddfsfdsasdsddsadafdsfaaaaa</li>\r\n                    <li><strong>Model:</strong> stridfsdfdsfsdngaa</li>\r\n                    <li><strong>Renk:</strong> strifdssdfng</li>\r\n                    <li><strong>Yıl:</strong> 2</li>\r\n                    <li><strong>Kapı Sayısı:</strong> 33</li>\r\n                    <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n                </ul>\r\n                <p><em>Bu mesaj 12.09.2024 11:05 tarihinde oluşturulmuştur.</em></p>	emrebilici41@gmail.com	2024-09-12 11:05:37.94719	2024-09-12 11:05:37.947886	Başarılı
9	389	Yeni Araç Bilgisi	\r\n            <h2>Yeni Araç Bilgisi</h2>\r\n            <p><strong>ID 389</strong> olan araç, <strong>asdsadsda</strong> markasının, <strong>sadsadsaddsa</strong> modelindeki, <em>sadsaddsasd</em> renginde olan, 212121 yılında üretilmiş ve 2121 kapılı olan aracınız <strong>12.09.2024 11:09</strong> tarihinde kaydedildi!</p>\r\n            <br>\r\n            <p>Araç Detayları:</p>\r\n            <ul>\r\n                <li><strong>ID:</strong> 389</li>\r\n                <li><strong>Marka:</strong> asdsadsda</li>\r\n                <li><strong>Model:</strong> sadsadsaddsa</li>\r\n                <li><strong>Renk:</strong> sadsaddsasd</li>\r\n                <li><strong>Yıl:</strong> 212121</li>\r\n                <li><strong>Kapı Sayısı:</strong> 2121</li>\r\n                <li><strong>Onaylanma Durumu:</strong> Onaylanmadı</li>\r\n            </ul>\r\n            <br>\r\n            <p><em>Bu mesaj 12.09.2024 11:09 tarihinde oluşturulmuştur.</em></p>	emrebilici41@gmail.com	2024-09-12 11:10:01.298823	2024-09-12 11:10:01.436383	Gönderildi
10	0	Araç Bilgilerinde Güncelleme	\r\n            <h2>Araç Bilgilerinde Güncelleme</h2>\r\n            <p>ID 213 olan araç, <strong>fsfsdsaddfsfdsasdsddsadafdsfaaaaaa</strong> markası <strong>stridfsdfdsfsdngaa</strong> model, <em>strifdssdfng</em> renginde, 2 yılında üretilmiş ve 33 kapılı olarak <strong>12.09.2024 11:10</strong> tarihinde güncellenmiştir! </p>\r\n            <h3>Eski Araç Bilgileri:</h3>\r\n            <ul>\r\n                <li><strong>Marka:</strong> fsfsdsaddfsfdsasdsddsadafdsfaaaaa</li>\r\n                <li><strong>Model:</strong> stridfsdfdsfsdngaa</li>\r\n                <li><strong>Renk:</strong> strifdssdfng</li>\r\n                <li><strong>Yıl:</strong> 2</li>\r\n                <li><strong>Kapı Sayısı:</strong> 33</li>\r\n                <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n            </ul>\r\n            <h3>Yeni Araç Bilgileri:</h3>\r\n            <ul>\r\n                <li><strong>Marka:</strong> fsfsdsaddfsfdsasdsddsadafdsfaaaaaa</li>\r\n                <li><strong>Model:</strong> stridfsdfdsfsdngaa</li>\r\n                <li><strong>Renk:</strong> strifdssdfng</li>\r\n                <li><strong>Yıl:</strong> 2</li>\r\n                <li><strong>Kapı Sayısı:</strong> 33</li>\r\n                <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n            </ul>\r\n            <p><em>Bu mesaj 12.09.2024 11:10 tarihinde oluşturulmuştur.</em></p>	emrebilici41@gmail.com	2024-09-12 11:10:39.926595	2024-09-12 11:10:39.927502	Gönderildi
11	0	Araç Bilgilerinde Güncelleme	\r\n            <h2>Araç Bilgilerinde Güncelleme</h2>\r\n            <p>ID 213 olan araç, <strong>fsfsdsaddfsfdsasdsddsadafdsfaaaaaaa</strong> markası <strong>stridfsdfdsfsdngaa</strong> model, <em>strifdssdfng</em> renginde, 2 yılında üretilmiş ve 33 kapılı olarak <strong>12.09.2024 11:10</strong> tarihinde güncellenmiştir! </p>\r\n            <h3>Eski Araç Bilgileri:</h3>\r\n            <ul>\r\n                <li><strong>Marka:</strong> fsfsdsaddfsfdsasdsddsadafdsfaaaaaa</li>\r\n                <li><strong>Model:</strong> stridfsdfdsfsdngaa</li>\r\n                <li><strong>Renk:</strong> strifdssdfng</li>\r\n                <li><strong>Yıl:</strong> 2</li>\r\n                <li><strong>Kapı Sayısı:</strong> 33</li>\r\n                <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n            </ul>\r\n            <h3>Yeni Araç Bilgileri:</h3>\r\n            <ul>\r\n                <li><strong>Marka:</strong> fsfsdsaddfsfdsasdsddsadafdsfaaaaaaa</li>\r\n                <li><strong>Model:</strong> stridfsdfdsfsdngaa</li>\r\n                <li><strong>Renk:</strong> strifdssdfng</li>\r\n                <li><strong>Yıl:</strong> 2</li>\r\n                <li><strong>Kapı Sayısı:</strong> 33</li>\r\n                <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n            </ul>\r\n            <p><em>Bu mesaj 12.09.2024 11:10 tarihinde oluşturulmuştur.</em></p>	emrebilici41@gmail.com	2024-09-12 11:10:44.182837	2024-09-12 11:10:44.18319	Gönderildi
12	390	Yeni Araç Bilgisi	\r\n            <h2>Yeni Araç Bilgisi</h2>\r\n            <p><strong>ID 390</strong> olan araç, <strong>asdsada</strong> markasının, <strong>dassa</strong> modelindeki, <em>dddadad</em> renginde olan, 221 yılında üretilmiş ve 21221 kapılı olan aracınız <strong>12.09.2024 11:20</strong> tarihinde kaydedildi!</p>\r\n            <br>\r\n            <p>Araç Detayları:</p>\r\n            <ul>\r\n                <li><strong>ID:</strong> 390</li>\r\n                <li><strong>Marka:</strong> asdsada</li>\r\n                <li><strong>Model:</strong> dassa</li>\r\n                <li><strong>Renk:</strong> dddadad</li>\r\n                <li><strong>Yıl:</strong> 221</li>\r\n                <li><strong>Kapı Sayısı:</strong> 21221</li>\r\n                <li><strong>Onaylanma Durumu:</strong> Onaylanmadı</li>\r\n            </ul>\r\n            <br>\r\n            <p><em>Bu mesaj 12.09.2024 11:20 tarihinde oluşturulmuştur.</em></p>	emrebilici41@gmail.com	2024-09-12 11:22:47.192436	2024-09-12 11:22:48.065504	Gönderildi
19	0	Araç Bilgilerinde Güncelleme	\r\n        <h2>Araç Bilgilerinde Güncelleme</h2>\r\n        <p>ID 203 olan araç, <strong>ikiyuzuc</strong> markası <strong>sdfsdfds</strong> model, <em>stfsdfsddsfdsfdsring</em> renginde, 3213131 yılında üretilmiş ve 33 kapılı olarak <strong>12.09.2024 11:48</strong> tarihinde güncellenmiştir! </p>\r\n        <h3>Eski Araç Bilgileri:</h3>\r\n        <ul>\r\n            <li><strong>Marka:</strong> fasdaada</li>\r\n            <li><strong>Model:</strong> sdfsdfds</li>\r\n            <li><strong>Renk:</strong> stfsdfsddsfdsfdsring</li>\r\n            <li><strong>Yıl:</strong> 3213131</li>\r\n            <li><strong>Kapı Sayısı:</strong> 33</li>\r\n            <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n        </ul>\r\n        <h3>Yeni Araç Bilgileri:</h3>\r\n        <ul>\r\n            <li><strong>Marka:</strong> ikiyuzuc</li>\r\n            <li><strong>Model:</strong> sdfsdfds</li>\r\n            <li><strong>Renk:</strong> stfsdfsddsfdsfdsring</li>\r\n            <li><strong>Yıl:</strong> 3213131</li>\r\n            <li><strong>Kapı Sayısı:</strong> 33</li>\r\n            <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n        </ul>\r\n        <p><em>Bu mesaj 12.09.2024 11:48 tarihinde oluşturulmuştur.</em></p>	emreeblici@gmail.com	2024-09-12 11:48:07.524153	2024-09-12 11:48:07.524541	Gönderildi
13	0	Araç Bilgilerinde Güncelleme	\r\n            <h2>Araç Bilgilerinde Güncelleme</h2>\r\n            <p>ID 213 olan araç, <strong>fsfsdsaddfsfdsasdsddsadafdsfaaaaaaaa</strong> markası <strong>stridfsdfdsfsdngaa</strong> model, <em>strifdssdfng</em> renginde, 2 yılında üretilmiş ve 33 kapılı olarak <strong>12.09.2024 11:23</strong> tarihinde güncellenmiştir! </p>\r\n            <h3>Eski Araç Bilgileri:</h3>\r\n            <ul>\r\n                <li><strong>Marka:</strong> fsfsdsaddfsfdsasdsddsadafdsfaaaaaaa</li>\r\n                <li><strong>Model:</strong> stridfsdfdsfsdngaa</li>\r\n                <li><strong>Renk:</strong> strifdssdfng</li>\r\n                <li><strong>Yıl:</strong> 2</li>\r\n                <li><strong>Kapı Sayısı:</strong> 33</li>\r\n                <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n            </ul>\r\n            <h3>Yeni Araç Bilgileri:</h3>\r\n            <ul>\r\n                <li><strong>Marka:</strong> fsfsdsaddfsfdsasdsddsadafdsfaaaaaaaa</li>\r\n                <li><strong>Model:</strong> stridfsdfdsfsdngaa</li>\r\n                <li><strong>Renk:</strong> strifdssdfng</li>\r\n                <li><strong>Yıl:</strong> 2</li>\r\n                <li><strong>Kapı Sayısı:</strong> 33</li>\r\n                <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n            </ul>\r\n            <p><em>Bu mesaj 12.09.2024 11:23 tarihinde oluşturulmuştur.</em></p>	emrebilici41@gmail.com	2024-09-12 11:24:18.064946	2024-09-12 11:24:34.135576	Gönderildi
14	0	Araç Bilgilerinde Güncelleme	\r\n            <h2>Araç Bilgilerinde Güncelleme</h2>\r\n            <p>ID 213 olan araç, <strong>fsfsda</strong> markası <strong>stridfsdfdsfsdngaaa</strong> model, <em>strifdssdfng</em> renginde, 3 yılında üretilmiş ve 33 kapılı olarak <strong>12.09.2024 11:36</strong> tarihinde güncellenmiştir! </p>\r\n            <h3>Eski Araç Bilgileri:</h3>\r\n            <ul>\r\n                <li><strong>Marka:</strong> fsfsda</li>\r\n                <li><strong>Model:</strong> stridfsdfdsfsdngaaa</li>\r\n                <li><strong>Renk:</strong> strifdssdfng</li>\r\n                <li><strong>Yıl:</strong> 2</li>\r\n                <li><strong>Kapı Sayısı:</strong> 33</li>\r\n                <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n            </ul>\r\n            <h3>Yeni Araç Bilgileri:</h3>\r\n            <ul>\r\n                <li><strong>Marka:</strong> fsfsda</li>\r\n                <li><strong>Model:</strong> stridfsdfdsfsdngaaa</li>\r\n                <li><strong>Renk:</strong> strifdssdfng</li>\r\n                <li><strong>Yıl:</strong> 3</li>\r\n                <li><strong>Kapı Sayısı:</strong> 33</li>\r\n                <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n            </ul>\r\n            <p><em>Bu mesaj 12.09.2024 11:36 tarihinde oluşturulmuştur.</em></p>	emrebilici41@gmail.com	2024-09-12 11:36:53.637759	2024-09-12 11:36:54.068643	Gönderildi
15	0	Araç Bilgilerinde Güncelleme	\r\n        <h2>Araç Bilgilerinde Güncelleme</h2>\r\n        <p>ID 213 olan araç, <strong>fsfsdaa</strong> markası <strong>stridfsdfdsfsdngaaa</strong> model, <em>strifdssdfng</em> renginde, 3 yılında üretilmiş ve 33 kapılı olarak <strong>12.09.2024 11:39</strong> tarihinde güncellenmiştir! </p>\r\n        <h3>Eski Araç Bilgileri:</h3>\r\n        <ul>\r\n            <li><strong>Marka:</strong> fsfsda</li>\r\n            <li><strong>Model:</strong> stridfsdfdsfsdngaaa</li>\r\n            <li><strong>Renk:</strong> strifdssdfng</li>\r\n            <li><strong>Yıl:</strong> 3</li>\r\n            <li><strong>Kapı Sayısı:</strong> 33</li>\r\n            <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n        </ul>\r\n        <h3>Yeni Araç Bilgileri:</h3>\r\n        <ul>\r\n            <li><strong>Marka:</strong> fsfsdaa</li>\r\n            <li><strong>Model:</strong> stridfsdfdsfsdngaaa</li>\r\n            <li><strong>Renk:</strong> strifdssdfng</li>\r\n            <li><strong>Yıl:</strong> 3</li>\r\n            <li><strong>Kapı Sayısı:</strong> 33</li>\r\n            <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n        </ul>\r\n        <p><em>Bu mesaj 12.09.2024 11:39 tarihinde oluşturulmuştur.</em></p>	emrebilici41@gmail.com	2024-09-12 11:39:56.019366	2024-09-12 11:39:56.151795	Gönderildi
16	0	Araç Bilgilerinde Güncelleme	\r\n        <h2>Araç Bilgilerinde Güncelleme</h2>\r\n        <p>ID 213 olan araç, <strong>fsfsdaaa</strong> markası <strong>stridfsdfdsfsdngaaa</strong> model, <em>strifdssdfng</em> renginde, 3 yılında üretilmiş ve 33 kapılı olarak <strong>12.09.2024 11:46</strong> tarihinde güncellenmiştir! </p>\r\n        <h3>Eski Araç Bilgileri:</h3>\r\n        <ul>\r\n            <li><strong>Marka:</strong> fsfsdaa</li>\r\n            <li><strong>Model:</strong> stridfsdfdsfsdngaaa</li>\r\n            <li><strong>Renk:</strong> strifdssdfng</li>\r\n            <li><strong>Yıl:</strong> 3</li>\r\n            <li><strong>Kapı Sayısı:</strong> 33</li>\r\n            <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n        </ul>\r\n        <h3>Yeni Araç Bilgileri:</h3>\r\n        <ul>\r\n            <li><strong>Marka:</strong> fsfsdaaa</li>\r\n            <li><strong>Model:</strong> stridfsdfdsfsdngaaa</li>\r\n            <li><strong>Renk:</strong> strifdssdfng</li>\r\n            <li><strong>Yıl:</strong> 3</li>\r\n            <li><strong>Kapı Sayısı:</strong> 33</li>\r\n            <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n        </ul>\r\n        <p><em>Bu mesaj 12.09.2024 11:46 tarihinde oluşturulmuştur.</em></p>	emreeblici@gmail.com	2024-09-12 11:46:36.438911	2024-09-12 11:46:36.577996	Gönderildi
17	391	Yeni Araç Bilgisi	\r\n        <h2>Yeni Araç Bilgisi</h2>\r\n        <p><strong>ID 391</strong> olan araç, <strong>asdsa</strong> markasının, <strong>daasdsa</strong> modelindeki, <em>asdsaasdd</em> renginde olan, 221 yılında üretilmiş ve 21 kapılı olan aracınız <strong>12.09.2024 11:46</strong> tarihinde kaydedildi!</p>\r\n        <br>\r\n        <p>Araç Detayları:</p>\r\n        <ul>\r\n            <li><strong>ID:</strong> 391</li>\r\n            <li><strong>Marka:</strong> asdsa</li>\r\n            <li><strong>Model:</strong> daasdsa</li>\r\n            <li><strong>Renk:</strong> asdsaasdd</li>\r\n            <li><strong>Yıl:</strong> 221</li>\r\n            <li><strong>Kapı Sayısı:</strong> 21</li>\r\n            <li><strong>Onaylanma Durumu:</strong> Onaylanmadı</li>\r\n        </ul>\r\n        <br>\r\n        <p><em>Bu mesaj 12.09.2024 11:46 tarihinde oluşturulmuştur.</em></p>	emreeblici@gmail.com	2024-09-12 11:46:41.177456	2024-09-12 11:46:41.17811	Gönderildi
18	0	Araç Bilgilerinde Güncelleme	\r\n        <h2>Araç Bilgilerinde Güncelleme</h2>\r\n        <p>ID 203 olan araç, <strong>fasdaada</strong> markası <strong>sdfsdfds</strong> model, <em>stfsdfsddsfdsfdsring</em> renginde, 3213131 yılında üretilmiş ve 33 kapılı olarak <strong>12.09.2024 11:47</strong> tarihinde güncellenmiştir! </p>\r\n        <h3>Eski Araç Bilgileri:</h3>\r\n        <ul>\r\n            <li><strong>Marka:</strong> fasdaad</li>\r\n            <li><strong>Model:</strong> sdfsdfds</li>\r\n            <li><strong>Renk:</strong> stfsdfsddsfdsfdsring</li>\r\n            <li><strong>Yıl:</strong> 3213131</li>\r\n            <li><strong>Kapı Sayısı:</strong> 33</li>\r\n            <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n        </ul>\r\n        <h3>Yeni Araç Bilgileri:</h3>\r\n        <ul>\r\n            <li><strong>Marka:</strong> fasdaada</li>\r\n            <li><strong>Model:</strong> sdfsdfds</li>\r\n            <li><strong>Renk:</strong> stfsdfsddsfdsfdsring</li>\r\n            <li><strong>Yıl:</strong> 3213131</li>\r\n            <li><strong>Kapı Sayısı:</strong> 33</li>\r\n            <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n        </ul>\r\n        <p><em>Bu mesaj 12.09.2024 11:47 tarihinde oluşturulmuştur.</em></p>	emreeblici@gmail.com	2024-09-12 11:47:25.006265	2024-09-12 11:47:25.00678	Gönderildi
20	0	Araç Bilgilerinde Güncelleme	\r\n        <h2>Araç Bilgilerinde Güncelleme</h2>\r\n        <p>ID 155 olan araç, <strong>saddsaa</strong> markası <strong>sdasadaa</strong> model, <em>sasdsa</em> renginde, 212 yılında üretilmiş ve 4 kapılı olarak <strong>12.09.2024 11:55</strong> tarihinde güncellenmiştir! </p>\r\n        <h3>Eski Araç Bilgileri:</h3>\r\n        <ul>\r\n            <li><strong>Marka:</strong> saddsa</li>\r\n            <li><strong>Model:</strong> sdasadaa</li>\r\n            <li><strong>Renk:</strong> sasdsa</li>\r\n            <li><strong>Yıl:</strong> 212</li>\r\n            <li><strong>Kapı Sayısı:</strong> 4</li>\r\n            <li><strong>Onaylanma Durumu:</strong> Onaylanmadı</li>\r\n        </ul>\r\n        <h3>Yeni Araç Bilgileri:</h3>\r\n        <ul>\r\n            <li><strong>Marka:</strong> saddsaa</li>\r\n            <li><strong>Model:</strong> sdasadaa</li>\r\n            <li><strong>Renk:</strong> sasdsa</li>\r\n            <li><strong>Yıl:</strong> 212</li>\r\n            <li><strong>Kapı Sayısı:</strong> 4</li>\r\n            <li><strong>Onaylanma Durumu:</strong> Onaylanmadı</li>\r\n        </ul>\r\n        <p><em>Bu mesaj 12.09.2024 11:55 tarihinde oluşturulmuştur.</em></p>	emrebilici41@gmail.com	2024-09-12 11:55:48.859401	2024-09-12 11:55:48.992803	Gönderildi
21	128	Araç Bilgilerinde Güncelleme	\r\n        <h2>Araç Bilgilerinde Güncelleme</h2>\r\n        <p>ID 128 olan araç, <strong>asdadadaf</strong> markası <strong>sadsaddaa</strong> model, <em>sdasda</em> renginde, 212 yılında üretilmiş ve 2 kapılı olarak <strong>12.09.2024 12:01</strong> tarihinde güncellenmiştir! </p>\r\n        <h3>Eski Araç Bilgileri:</h3>\r\n        <ul>\r\n            <li><strong>Marka:</strong> asdadada</li>\r\n            <li><strong>Model:</strong> sadsaddaa</li>\r\n            <li><strong>Renk:</strong> sdasda</li>\r\n            <li><strong>Yıl:</strong> 212</li>\r\n            <li><strong>Kapı Sayısı:</strong> 2</li>\r\n            <li><strong>Onaylanma Durumu:</strong> Onaylanmadı</li>\r\n        </ul>\r\n        <h3>Yeni Araç Bilgileri:</h3>\r\n        <ul>\r\n            <li><strong>Marka:</strong> asdadadaf</li>\r\n            <li><strong>Model:</strong> sadsaddaa</li>\r\n            <li><strong>Renk:</strong> sdasda</li>\r\n            <li><strong>Yıl:</strong> 212</li>\r\n            <li><strong>Kapı Sayısı:</strong> 2</li>\r\n            <li><strong>Onaylanma Durumu:</strong> Onaylanmadı</li>\r\n        </ul>\r\n        <p><em>Bu mesaj 12.09.2024 12:01 tarihinde oluşturulmuştur.</em></p>	emrebilici41@gmail.com	2024-09-12 12:01:54.541709	2024-09-12 12:01:54.678048	Gönderildi
22	392	Yeni Araç Bilgisi	\r\n        <h2>Yeni Araç Bilgisi</h2>\r\n        <p><strong>ID 392</strong> olan araç, <strong>dfssds</strong> markasının, <strong>sfds</strong> modelindeki, <em>fdsfddsfdsf</em> renginde olan, 211212 yılında üretilmiş ve 2 kapılı olan aracınız <strong>12.09.2024 12:02</strong> tarihinde kaydedildi!</p>\r\n        <br>\r\n        <p>Araç Detayları:</p>\r\n        <ul>\r\n            <li><strong>ID:</strong> 392</li>\r\n            <li><strong>Marka:</strong> dfssds</li>\r\n            <li><strong>Model:</strong> sfds</li>\r\n            <li><strong>Renk:</strong> fdsfddsfdsf</li>\r\n            <li><strong>Yıl:</strong> 211212</li>\r\n            <li><strong>Kapı Sayısı:</strong> 2</li>\r\n            <li><strong>Onaylanma Durumu:</strong> Onaylanmadı</li>\r\n        </ul>\r\n        <br>\r\n        <p><em>Bu mesaj 12.09.2024 12:02 tarihinde oluşturulmuştur.</em></p>	emrebilici41@gmail.com	2024-09-12 12:02:23.336662	2024-09-12 12:02:23.338074	Gönderildi
23	155	Araç Bilgilerinde Güncelleme	\r\n        <h2>Araç Bilgilerinde Güncelleme</h2>\r\n        <p>ID 155 olan araç, <strong>saddsaaaaaa</strong> markası <strong>sdasadaa</strong> model, <em>sasdsa</em> renginde, 212 yılında üretilmiş ve 4 kapılı olarak <strong>12.09.2024 12:04</strong> tarihinde güncellenmiştir! </p>\r\n        <h3>Eski Araç Bilgileri:</h3>\r\n        <ul>\r\n            <li><strong>Marka:</strong> saddsaa</li>\r\n            <li><strong>Model:</strong> sdasadaa</li>\r\n            <li><strong>Renk:</strong> sasdsa</li>\r\n            <li><strong>Yıl:</strong> 212</li>\r\n            <li><strong>Kapı Sayısı:</strong> 4</li>\r\n            <li><strong>Onaylanma Durumu:</strong> Onaylanmadı</li>\r\n        </ul>\r\n        <h3>Yeni Araç Bilgileri:</h3>\r\n        <ul>\r\n            <li><strong>Marka:</strong> saddsaaaaaa</li>\r\n            <li><strong>Model:</strong> sdasadaa</li>\r\n            <li><strong>Renk:</strong> sasdsa</li>\r\n            <li><strong>Yıl:</strong> 212</li>\r\n            <li><strong>Kapı Sayısı:</strong> 4</li>\r\n            <li><strong>Onaylanma Durumu:</strong> Onaylanmadı</li>\r\n        </ul>\r\n        <p><em>Bu mesaj 12.09.2024 12:04 tarihinde oluşturulmuştur.</em></p>	emrebilici41@gmail.com	2024-09-12 12:05:00.514972	2024-09-12 12:05:00.51628	Gönderildi
24	213	Araç Bilgilerinde Güncelleme	\r\n        <h2>Araç Bilgilerinde Güncelleme</h2>\r\n        <p>ID 213 olan araç, <strong>fsfsdaaaa</strong> markası <strong>stridfsdfdsfsdngaaa</strong> model, <em>strifdssdfng</em> renginde, 3 yılında üretilmiş ve 33 kapılı olarak <strong>12.09.2024 12:11</strong> tarihinde güncellenmiştir! </p>\r\n        <h3>Eski Araç Bilgileri:</h3>\r\n        <ul>\r\n            <li><strong>Marka:</strong> fsfsdaaa</li>\r\n            <li><strong>Model:</strong> stridfsdfdsfsdngaaa</li>\r\n            <li><strong>Renk:</strong> strifdssdfng</li>\r\n            <li><strong>Yıl:</strong> 3</li>\r\n            <li><strong>Kapı Sayısı:</strong> 33</li>\r\n            <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n        </ul>\r\n        <h3>Yeni Araç Bilgileri:</h3>\r\n        <ul>\r\n            <li><strong>Marka:</strong> fsfsdaaaa</li>\r\n            <li><strong>Model:</strong> stridfsdfdsfsdngaaa</li>\r\n            <li><strong>Renk:</strong> strifdssdfng</li>\r\n            <li><strong>Yıl:</strong> 3</li>\r\n            <li><strong>Kapı Sayısı:</strong> 33</li>\r\n            <li><strong>Onaylanma Durumu:</strong> Onaylandı</li>\r\n        </ul>\r\n        <p><em>Bu mesaj 12.09.2024 12:11 tarihinde oluşturulmuştur.</em></p>	emrebilici41@gmail.com	2024-09-12 12:11:42.24159	2024-09-12 12:11:42.374766	Gönderildi
\.


--
-- TOC entry 4825 (class 0 OID 16717)
-- Dependencies: 222
-- Data for Name: selectedcars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.selectedcars (id, carid, selectedat) FROM stdin;
1	160	2024-09-06 00:46:18.787909
2	160	2024-09-06 00:53:29.605688
3	160	2024-09-06 00:57:19.617523
4	160	2024-09-06 00:58:18.334151
5	160	2024-09-06 00:59:03.4402
6	160	2024-09-06 01:04:28.809713
\.


--
-- TOC entry 4821 (class 0 OID 16557)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password) FROM stdin;
10	string	string
11	keke	keke
12	guest	aa
13	ala	alal
14	emre123	emreyalaz
15	keman	kenan
16	kenan	kemal
17	lalo	lola
18	Emreeeeeeeeee	deneme1
19	asdasd	asdasd
20	aaaa	aaaa
21	asad	asad
22	avq	aca
23	adas	reret
24	asdasdsa	aqaqaq
25	denemelik1	denememek
26	deneme	awer
27	asd	asdasdasd
28	asddas	asdasdasd
29	emre	deneydeney
30	avqq	qqqqqqqq
31	aaaaaaaaaaa	aaaaaaaaaaaaaa
33	emreemre	emreemreemre
34	aaaaaaaa	aaaaaaaaaa
35	lamaaaaa	lamaaaaaaa
36	de	denelilililiL1
37	aaa	aaaaaaaaL1
38	aaaaaaaaaaaaaaaaaaaaaaaa	$2a$11$D62tKZys9sk63fgELj.xZes47xK9b9kVRDEZ.ffWlHyti7Tr0cWRm
1	Emre1	$2a$11$..P6KYX1UjnU1yED.RqFI.jinxpEizDXiHAhdvMlJM77Kk3faYfZ.
39	aaaaaaaaaaaaaaaaaaaaaa	$2a$11$a3./vIqgCWW6qXLMriMW.uqJmFZAM2jcT8nUTK9eAdj7gSHPQggsm
40	alal	$2a$11$o1OM.BHCYms8JDc7H4sTyeyWZTL5h.VLQBgYCBKeRyewflWQIjhvm
41	ALALALA	$2a$11$Opcc6mwsM0OMGD0ISWwuMuZtlm5DAYBQrtFMvT1stbFJNfmD6qdo2
42	alalalalalala	$2a$11$NYjHQ2UU613740Gz89ESGeqpZRopCWAt1Df0miyg49zAWSlVbwzwu
44	testuser	$2a$11$kkW7O1SldvOSZynOcmm0Hu5oqFmpqK0YJpdv5h1SzJNsJ0KMc/OMa
45	slasdmalmdlkasdlkasASDSA	$2a$11$HHtpwBI0c.FCoLh2S1m.yOOYY/uIuLwXGD8ZcP85FA0vrlPFYGQqe
46	Astring	$2a$11$6bHuKXL4Ikwvq75Bd6MpgOg5JePCMMFEhWxVGfnk9d8afuKI5x1aS
47	string3S	$2a$11$2o/QZLggqfBa761R7D5JQO1erySHyI5qmaVqKLksWhVgIKfPSPHBC
80	bakalaAA1	bakalaAA
48	Alland	$2a$11$78LV6lARoJDzexlhujtMhOjJ.OlE.PMfsmilbZWgt1McJ5gv1B7Ua
49	Erşan	$2a$11$e3VU/tpGth3k8fhXH5vpouzujSYTjuLI3XJKJe.MZ12PuNxaVTH/y
51	stringCC1	stringC1
43	strinaaag	$2a$11$/sQmf7vX2bOlK0ksk0K59OMO3td6wgJ1XrHCmgpXF8k8C5T8588Le
65	asdasdasddsada	ASDASDASD
52	striAang	strinA1g
53	aafcafafawffaww	adsasasdsadasA1
2	LALALA	denek2
54	aaaaaaaaD	aaaaaaaaaaD1
3	SmartiqAAAA	Denek3
56	adadassdasddasd	24XBWuP9N7qbGB5
57	aaaaaa	aA1
58	stringA1	stringA1
59	AAstring	A1string
60	striAng	striA1ng
61	striaang	strinaA1g
4	strAAing	Bellammy
62	asdsaddsda	addadA1SADSADD
63	adasdadsa	adsadadadasasdas1A
64	aaaaaaaA1	aaaaaaaA1
5	DENEK	DENEK1
6	a	a
66	asdsadsadasdsadsda	iAr4TJEHG2FcL8D
67	sAAAAA1tring	sAAAAA1tring
68	striaaaA1ng	striaaaA1ng
69	strinag	strinaaaaA1g
70	stdsadsadring	strsadsadading
71	asdasdsdasdsaddas	asdasdsdasdsaddasA1
72	striaaang	striaaang
7	Denek	Denekk
74	aaastring	string
75	asdsada	qvmhjG92qtNdMEy
77	asdsadasdas	asdsadasdas
78	asdasdsaad	asdasdsaad
79	bak	alala
8	Denek2	Denek3
9	Yusuf bey	Staj
81	stasdsaaring	stasdsaaring
82	a1string	a1string
83	Emre	Deneme1
84	sadsadsagfvasgas	ADHWAKYUIFGAWKYFAWFKAWFa1
32	Emree	DSA
73	arabadene	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaA1
85	EMREDENEME	EMREDENEMEa1
86	asdfgHA1	asdfgHA1
87	denio	stasdasdring
89	asdasdasdA1	asdasdasdA1
50	KruaaakSASASADAS	DSADSADSADSAa11DSADSADSADSAa11DSADSADSADSAa11DSADSADSADSAa11
90	fafaadaadasdada	fafaadaadasdadaA1
88	alalalalalalA	aaaaaaaaaaaaaaA1
55	awkjfhkajfhl	aaaaaaaasdasdasdsadadasd
76	awkjfhkajfhlfA1	DASDSAASDASDSADa1
\.


--
-- TOC entry 4838 (class 0 OID 0)
-- Dependencies: 219
-- Name: CarImages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CarImages_id_seq"', 221, true);


--
-- TOC entry 4839 (class 0 OID 0)
-- Dependencies: 216
-- Name: Cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Cars_id_seq"', 401, true);


--
-- TOC entry 4840 (class 0 OID 0)
-- Dependencies: 223
-- Name: email_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.email_logs_id_seq', 24, true);


--
-- TOC entry 4841 (class 0 OID 0)
-- Dependencies: 221
-- Name: selectedcars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.selectedcars_id_seq', 6, true);


--
-- TOC entry 4842 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 90, true);


--
-- TOC entry 4668 (class 2606 OID 16576)
-- Name: CarImages CarImages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarImages"
    ADD CONSTRAINT "CarImages_pkey" PRIMARY KEY (id);


--
-- TOC entry 4662 (class 2606 OID 16540)
-- Name: Cars Cars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cars"
    ADD CONSTRAINT "Cars_pkey" PRIMARY KEY (id);


--
-- TOC entry 4672 (class 2606 OID 16769)
-- Name: email_logs email_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_logs
    ADD CONSTRAINT email_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 4670 (class 2606 OID 16723)
-- Name: selectedcars selectedcars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.selectedcars
    ADD CONSTRAINT selectedcars_pkey PRIMARY KEY (id);


--
-- TOC entry 4664 (class 2606 OID 16562)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4666 (class 2606 OID 16564)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4673 (class 2606 OID 16577)
-- Name: CarImages CarImages_carid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CarImages"
    ADD CONSTRAINT "CarImages_carid_fkey" FOREIGN KEY (carid) REFERENCES public."Cars"(id) ON DELETE CASCADE;


--
-- TOC entry 4674 (class 2606 OID 16724)
-- Name: selectedcars selectedcars_car_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.selectedcars
    ADD CONSTRAINT selectedcars_car_id_fkey FOREIGN KEY (carid) REFERENCES public."Cars"(id);


-- Completed on 2024-09-12 16:15:36

--
-- PostgreSQL database dump complete
--

--
-- Database "Employee_Tracker" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-09-12 16:15:36

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
-- TOC entry 4788 (class 1262 OID 16519)
-- Name: Employee_Tracker; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Employee_Tracker" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "Employee_Tracker" OWNER TO postgres;

\connect "Employee_Tracker"

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
-- TOC entry 6 (class 2615 OID 16521)
-- Name: employee_tracker; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA employee_tracker;


ALTER SCHEMA employee_tracker OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16523)
-- Name: employee; Type: TABLE; Schema: employee_tracker; Owner: postgres
--

CREATE TABLE employee_tracker.employee (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    job_title character varying(100),
    salary numeric(10,2),
    hire_date date
);


ALTER TABLE employee_tracker.employee OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16522)
-- Name: employee_id_seq; Type: SEQUENCE; Schema: employee_tracker; Owner: postgres
--

CREATE SEQUENCE employee_tracker.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE employee_tracker.employee_id_seq OWNER TO postgres;

--
-- TOC entry 4789 (class 0 OID 0)
-- Dependencies: 216
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: employee_tracker; Owner: postgres
--

ALTER SEQUENCE employee_tracker.employee_id_seq OWNED BY employee_tracker.employee.id;


--
-- TOC entry 4635 (class 2604 OID 16526)
-- Name: employee id; Type: DEFAULT; Schema: employee_tracker; Owner: postgres
--

ALTER TABLE ONLY employee_tracker.employee ALTER COLUMN id SET DEFAULT nextval('employee_tracker.employee_id_seq'::regclass);


--
-- TOC entry 4782 (class 0 OID 16523)
-- Dependencies: 217
-- Data for Name: employee; Type: TABLE DATA; Schema: employee_tracker; Owner: postgres
--

COPY employee_tracker.employee (id, first_name, last_name, job_title, salary, hire_date) FROM stdin;
\.


--
-- TOC entry 4790 (class 0 OID 0)
-- Dependencies: 216
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: employee_tracker; Owner: postgres
--

SELECT pg_catalog.setval('employee_tracker.employee_id_seq', 1, false);


--
-- TOC entry 4637 (class 2606 OID 16528)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: employee_tracker; Owner: postgres
--

ALTER TABLE ONLY employee_tracker.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


-- Completed on 2024-09-12 16:15:36

--
-- PostgreSQL database dump complete
--

--
-- Database "dburunler" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-09-12 16:15:36

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
-- TOC entry 4798 (class 1262 OID 16453)
-- Name: dburunler; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dburunler WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE dburunler OWNER TO postgres;

\connect dburunler

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
-- TOC entry 215 (class 1259 OID 16454)
-- Name: kategoriler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategoriler (
    kategoriid integer NOT NULL,
    kategoriad character varying(20)
);


ALTER TABLE public.kategoriler OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16459)
-- Name: urunler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.urunler (
    urunid integer NOT NULL,
    urunad character varying(30),
    stok integer,
    alisfiyat double precision,
    satisfiyat double precision,
    gorsel character varying(100),
    kategori integer
);


ALTER TABLE public.urunler OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16529)
-- Name: urunlistesi; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.urunlistesi AS
 SELECT urunler.urunid,
    urunler.urunad,
    urunler.stok,
    urunler.alisfiyat,
    urunler.satisfiyat,
    urunler.gorsel,
    kategoriler.kategoriad
   FROM (public.urunler
     JOIN public.kategoriler ON ((urunler.kategori = kategoriler.kategoriid)));


ALTER VIEW public.urunlistesi OWNER TO postgres;

--
-- TOC entry 4791 (class 0 OID 16454)
-- Dependencies: 215
-- Data for Name: kategoriler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kategoriler (kategoriid, kategoriad) FROM stdin;
1	Beyaz Eşya
2	Motosiklet
3	Uçak
4	Gemi
5	Tren
\.


--
-- TOC entry 4792 (class 0 OID 16459)
-- Dependencies: 216
-- Data for Name: urunler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.urunler (urunid, urunad, stok, alisfiyat, satisfiyat, gorsel, kategori) FROM stdin;
1	Tofaş	20	200000	400000	\N	1
2	Spor Motosiklet	100	500000	10000000		2
3	Vapur	3	200000000	400000000	text	4
\.


--
-- TOC entry 4642 (class 2606 OID 16458)
-- Name: kategoriler kategoriler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategoriler
    ADD CONSTRAINT kategoriler_pkey PRIMARY KEY (kategoriid);


--
-- TOC entry 4645 (class 2606 OID 16463)
-- Name: urunler urunler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urunler
    ADD CONSTRAINT urunler_pkey PRIMARY KEY (urunid);


--
-- TOC entry 4643 (class 1259 OID 16469)
-- Name: fki_urunler_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_urunler_foreign ON public.urunler USING btree (urunid);


--
-- TOC entry 4646 (class 2606 OID 16470)
-- Name: urunler urunler_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urunler
    ADD CONSTRAINT urunler_foreign FOREIGN KEY (kategori) REFERENCES public.kategoriler(kategoriid) NOT VALID;


-- Completed on 2024-09-12 16:15:36

--
-- PostgreSQL database dump complete
--

--
-- Database "mytestdb" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-09-12 16:15:36

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
-- TOC entry 4793 (class 1262 OID 16475)
-- Name: mytestdb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE mytestdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE mytestdb OWNER TO postgres;

\connect mytestdb

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
-- TOC entry 216 (class 1259 OID 16477)
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    departmentid integer NOT NULL,
    departmentname character varying(500)
);


ALTER TABLE public.department OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16476)
-- Name: department_departmentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_departmentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.department_departmentid_seq OWNER TO postgres;

--
-- TOC entry 4794 (class 0 OID 0)
-- Dependencies: 215
-- Name: department_departmentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_departmentid_seq OWNED BY public.department.departmentid;


--
-- TOC entry 218 (class 1259 OID 16484)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employeeid integer NOT NULL,
    employeename character varying(500),
    department character varying(500),
    dateofjoining date,
    photofilename character varying(500)
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16483)
-- Name: employee_employeeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_employeeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_employeeid_seq OWNER TO postgres;

--
-- TOC entry 4795 (class 0 OID 0)
-- Dependencies: 217
-- Name: employee_employeeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_employeeid_seq OWNED BY public.employee.employeeid;


--
-- TOC entry 4639 (class 2604 OID 16480)
-- Name: department departmentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department ALTER COLUMN departmentid SET DEFAULT nextval('public.department_departmentid_seq'::regclass);


--
-- TOC entry 4640 (class 2604 OID 16487)
-- Name: employee employeeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN employeeid SET DEFAULT nextval('public.employee_employeeid_seq'::regclass);


--
-- TOC entry 4785 (class 0 OID 16477)
-- Dependencies: 216
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department (departmentid, departmentname) FROM stdin;
1	IT
2	Support
\.


--
-- TOC entry 4787 (class 0 OID 16484)
-- Dependencies: 218
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employeeid, employeename, department, dateofjoining, photofilename) FROM stdin;
1	Bob	IT	2021-06-21	anonymous.png
\.


--
-- TOC entry 4796 (class 0 OID 0)
-- Dependencies: 215
-- Name: department_departmentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_departmentid_seq', 2, true);


--
-- TOC entry 4797 (class 0 OID 0)
-- Dependencies: 217
-- Name: employee_employeeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_employeeid_seq', 1, true);


-- Completed on 2024-09-12 16:15:36

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-09-12 16:15:36

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 4778 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


-- Completed on 2024-09-12 16:15:36

--
-- PostgreSQL database dump complete
--

--
-- Database "shoppingFlipkart" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-09-12 16:15:36

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
-- TOC entry 4804 (class 1262 OID 16491)
-- Name: shoppingFlipkart; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "shoppingFlipkart" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "shoppingFlipkart" OWNER TO postgres;

\connect "shoppingFlipkart"

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
-- TOC entry 215 (class 1259 OID 16492)
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16506)
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    "Productid" integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    phone text NOT NULL
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16505)
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."order" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 16498)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name text NOT NULL,
    brand text NOT NULL,
    size integer NOT NULL,
    price numeric NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16497)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4794 (class 0 OID 16492)
-- Dependencies: 215
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
20240818020601_InitialDatabase	8.0.8
20240818021715_UpdateReference	8.0.8
\.


--
-- TOC entry 4798 (class 0 OID 16506)
-- Dependencies: 219
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" (id, "Productid", name, address, phone) FROM stdin;
\.


--
-- TOC entry 4796 (class 0 OID 16498)
-- Dependencies: 217
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, name, brand, size, price) FROM stdin;
1	Product Name	Brand Name	1	100
2	Product 2	Brand Name 2	2	200
\.


--
-- TOC entry 4805 (class 0 OID 0)
-- Dependencies: 218
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_id_seq', 1, false);


--
-- TOC entry 4806 (class 0 OID 0)
-- Dependencies: 216
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 1, false);


--
-- TOC entry 4644 (class 2606 OID 16496)
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- TOC entry 4649 (class 2606 OID 16512)
-- Name: order PK_order; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "PK_order" PRIMARY KEY (id);


--
-- TOC entry 4646 (class 2606 OID 16504)
-- Name: product PK_product; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "PK_product" PRIMARY KEY (id);


--
-- TOC entry 4647 (class 1259 OID 16518)
-- Name: IX_order_Productid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_order_Productid" ON public."order" USING btree ("Productid");


--
-- TOC entry 4650 (class 2606 OID 16513)
-- Name: order FK_order_product_Productid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_order_product_Productid" FOREIGN KEY ("Productid") REFERENCES public.product(id) ON DELETE CASCADE;


-- Completed on 2024-09-12 16:15:37

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-09-12 16:15:37

--
-- PostgreSQL database cluster dump complete
--

