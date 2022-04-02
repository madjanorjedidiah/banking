--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

-- Started on 2022-04-02 11:07:26 GMT

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
-- TOC entry 2 (class 3079 OID 179906)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 4036 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 180952)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 180950)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 4037 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 217 (class 1259 OID 180962)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 180960)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 4038 (class 0 OID 0)
-- Dependencies: 216
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 213 (class 1259 OID 180944)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 180942)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 4039 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 219 (class 1259 OID 180996)
-- Name: banks_customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banks_customer (
    id integer NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(254) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    password character varying(250) NOT NULL
);


ALTER TABLE public.banks_customer OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 181009)
-- Name: banks_customer_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banks_customer_groups (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.banks_customer_groups OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 181007)
-- Name: banks_customer_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banks_customer_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banks_customer_groups_id_seq OWNER TO postgres;

--
-- TOC entry 4040 (class 0 OID 0)
-- Dependencies: 220
-- Name: banks_customer_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banks_customer_groups_id_seq OWNED BY public.banks_customer_groups.id;


--
-- TOC entry 218 (class 1259 OID 180994)
-- Name: banks_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banks_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banks_customer_id_seq OWNER TO postgres;

--
-- TOC entry 4041 (class 0 OID 0)
-- Dependencies: 218
-- Name: banks_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banks_customer_id_seq OWNED BY public.banks_customer.id;


--
-- TOC entry 223 (class 1259 OID 181017)
-- Name: banks_customer_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banks_customer_user_permissions (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.banks_customer_user_permissions OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 181015)
-- Name: banks_customer_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banks_customer_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banks_customer_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 4042 (class 0 OID 0)
-- Dependencies: 222
-- Name: banks_customer_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banks_customer_user_permissions_id_seq OWNED BY public.banks_customer_user_permissions.id;


--
-- TOC entry 227 (class 1259 OID 181033)
-- Name: banks_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banks_history (
    id integer NOT NULL,
    purpose character varying(20),
    amount numeric(12,2) NOT NULL,
    success boolean NOT NULL,
    date_created timestamp with time zone NOT NULL,
    processed boolean NOT NULL,
    processed_date timestamp with time zone NOT NULL,
    customer_fk_id integer NOT NULL,
    customer_wallet_fk_id integer NOT NULL
);


ALTER TABLE public.banks_history OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 181031)
-- Name: banks_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banks_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banks_history_id_seq OWNER TO postgres;

--
-- TOC entry 4043 (class 0 OID 0)
-- Dependencies: 226
-- Name: banks_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banks_history_id_seq OWNED BY public.banks_history.id;


--
-- TOC entry 231 (class 1259 OID 181112)
-- Name: blacklist_blacklistedtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blacklist_blacklistedtoken (
    id integer NOT NULL,
    token text,
    expires_at timestamp with time zone NOT NULL,
    blacklisted_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    token_id uuid,
    CONSTRAINT token_or_id_not_null CHECK (((token_id IS NOT NULL) OR (token IS NOT NULL)))
);


ALTER TABLE public.blacklist_blacklistedtoken OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 181110)
-- Name: blacklist_blacklistedtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blacklist_blacklistedtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blacklist_blacklistedtoken_id_seq OWNER TO postgres;

--
-- TOC entry 4044 (class 0 OID 0)
-- Dependencies: 230
-- Name: blacklist_blacklistedtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blacklist_blacklistedtoken_id_seq OWNED BY public.blacklist_blacklistedtoken.id;


--
-- TOC entry 234 (class 1259 OID 181152)
-- Name: bnks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bnks (
    id integer NOT NULL,
    geom public.geometry(Point,4326),
    email_1 character varying(254),
    website_1 character varying(254),
    bank_nam_1 character varying(254),
    bank_typ_1 character varying(254),
    branch_1 character varying(254),
    atm_1 character varying(254),
    interest_1 numeric(999,4),
    address_1 character varying(254),
    telephon_1 character varying(254),
    fax_1 character varying(254),
    weekend__1 character varying(254),
    base_rat_1 numeric(999,4),
    money_tr_1 character varying(254),
    atm_type_1 character varying(254),
    mobile_m_1 character varying(254)
);


ALTER TABLE public.bnks OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 181150)
-- Name: bnks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bnks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bnks_id_seq OWNER TO postgres;

--
-- TOC entry 4045 (class 0 OID 0)
-- Dependencies: 233
-- Name: bnks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bnks_id_seq OWNED BY public.bnks.id;


--
-- TOC entry 225 (class 1259 OID 181025)
-- Name: customer_wallet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_wallet (
    id integer NOT NULL,
    account_type character varying(100) NOT NULL,
    bank_branch character varying(100) NOT NULL,
    account_balance numeric(12,2) NOT NULL,
    customer_fk_id integer NOT NULL
);


ALTER TABLE public.customer_wallet OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 181023)
-- Name: customer_wallet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_wallet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_wallet_id_seq OWNER TO postgres;

--
-- TOC entry 4046 (class 0 OID 0)
-- Dependencies: 224
-- Name: customer_wallet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_wallet_id_seq OWNED BY public.customer_wallet.id;


--
-- TOC entry 229 (class 1259 OID 181088)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 181086)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 4047 (class 0 OID 0)
-- Dependencies: 228
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 211 (class 1259 OID 180934)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 180932)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 4048 (class 0 OID 0)
-- Dependencies: 210
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 209 (class 1259 OID 180923)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 180921)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 4049 (class 0 OID 0)
-- Dependencies: 208
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 232 (class 1259 OID 181132)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 3782 (class 2604 OID 180955)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 3783 (class 2604 OID 180965)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3781 (class 2604 OID 180947)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 3784 (class 2604 OID 180999)
-- Name: banks_customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks_customer ALTER COLUMN id SET DEFAULT nextval('public.banks_customer_id_seq'::regclass);


--
-- TOC entry 3785 (class 2604 OID 181012)
-- Name: banks_customer_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks_customer_groups ALTER COLUMN id SET DEFAULT nextval('public.banks_customer_groups_id_seq'::regclass);


--
-- TOC entry 3786 (class 2604 OID 181020)
-- Name: banks_customer_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks_customer_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.banks_customer_user_permissions_id_seq'::regclass);


--
-- TOC entry 3788 (class 2604 OID 181036)
-- Name: banks_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks_history ALTER COLUMN id SET DEFAULT nextval('public.banks_history_id_seq'::regclass);


--
-- TOC entry 3791 (class 2604 OID 181115)
-- Name: blacklist_blacklistedtoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blacklist_blacklistedtoken ALTER COLUMN id SET DEFAULT nextval('public.blacklist_blacklistedtoken_id_seq'::regclass);


--
-- TOC entry 3793 (class 2604 OID 181155)
-- Name: bnks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bnks ALTER COLUMN id SET DEFAULT nextval('public.bnks_id_seq'::regclass);


--
-- TOC entry 3787 (class 2604 OID 181028)
-- Name: customer_wallet id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_wallet ALTER COLUMN id SET DEFAULT nextval('public.customer_wallet_id_seq'::regclass);


--
-- TOC entry 3789 (class 2604 OID 181091)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 3780 (class 2604 OID 180937)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 3779 (class 2604 OID 180926)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 4011 (class 0 OID 180952)
-- Dependencies: 215
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 4013 (class 0 OID 180962)
-- Dependencies: 217
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 4009 (class 0 OID 180944)
-- Dependencies: 213
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add customer	6	add_customer
22	Can change customer	6	change_customer
23	Can delete customer	6	delete_customer
24	Can view customer	6	view_customer
25	Can add customer wallet	7	add_customerwallet
26	Can change customer wallet	7	change_customerwallet
27	Can delete customer wallet	7	delete_customerwallet
28	Can view customer wallet	7	view_customerwallet
29	Can add history	8	add_history
30	Can change history	8	change_history
31	Can delete history	8	delete_history
32	Can view history	8	view_history
33	Can add blacklisted token	9	add_blacklistedtoken
34	Can change blacklisted token	9	change_blacklistedtoken
35	Can delete blacklisted token	9	delete_blacklistedtoken
36	Can view blacklisted token	9	view_blacklistedtoken
37	Can add bnks	10	add_bnks
38	Can change bnks	10	change_bnks
39	Can delete bnks	10	delete_bnks
40	Can view bnks	10	view_bnks
\.


--
-- TOC entry 4015 (class 0 OID 180996)
-- Dependencies: 219
-- Data for Name: banks_customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banks_customer (id, last_login, is_superuser, email, first_name, last_name, is_active, date_joined, password) FROM stdin;
7	\N	f	jmadjanor6@gmail.com	Jed	Tetteh	t	2022-03-19 00:28:23.45739+00	pbkdf2_sha256$180000$pBvjW7Aht15J$AJdeS2c5i7qP8ST8JNz8c7JlZLXuj6Mq0CMQ9aScGrM=
\.


--
-- TOC entry 4017 (class 0 OID 181009)
-- Dependencies: 221
-- Data for Name: banks_customer_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banks_customer_groups (id, customer_id, group_id) FROM stdin;
\.


--
-- TOC entry 4019 (class 0 OID 181017)
-- Dependencies: 223
-- Data for Name: banks_customer_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banks_customer_user_permissions (id, customer_id, permission_id) FROM stdin;
\.


--
-- TOC entry 4023 (class 0 OID 181033)
-- Dependencies: 227
-- Data for Name: banks_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banks_history (id, purpose, amount, success, date_created, processed, processed_date, customer_fk_id, customer_wallet_fk_id) FROM stdin;
\.


--
-- TOC entry 4027 (class 0 OID 181112)
-- Dependencies: 231
-- Data for Name: blacklist_blacklistedtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blacklist_blacklistedtoken (id, token, expires_at, blacklisted_at, user_id, token_id) FROM stdin;
\.


--
-- TOC entry 4030 (class 0 OID 181152)
-- Dependencies: 234
-- Data for Name: bnks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bnks (id, geom, email_1, website_1, bank_nam_1, bank_typ_1, branch_1, atm_1, interest_1, address_1, telephon_1, fax_1, weekend__1, base_rat_1, money_tr_1, atm_type_1, mobile_m_1) FROM stdin;
1	0101000020E61000008F9FD27094BCD5BF5E457FFB3A301640	unionruralbank@yahoo.com	www.unionruralbank.com	UNION RURAL BANK	Rural and Community Bank	Weija	No	2.0000	P.O Box WG978	0501281932	\N	No	0.0000	Western Union	\N	None
2	0101000020E6100000B485229DF4BED5BF697BF80A31341640	magnate.2012@yahoo.com	\N	MAGNATE SUSU SERVICE	Savings and Loans	Scc	No	18.0000	P.O Box DC224	0268583633/0246711864	\N	\N	0.0000	None	None	Airtel
3	0101000020E6100000830DEBCEC7B1D5BF74FC5B1558381640	\N	www.prudentialbank.com.gh	PRUDENTIAL BANK	Major Bank	Gicel	Yes	3.0000	\N	0302850174-6	\N	No	25.0500	Western Union, MoneyGram,Vigo	VISA & GH Link	None
4	0101000020E61000001F0447625AAED5BFE2A0D95E31301640	info@firstnationalghana.com	www.firstnationalghana.com	FIRST NATIONAL GHANA BANK	Savings and Loans	Weija	No	8.0000	first national bank. weija branch scc junction	0302218860	\N	Saturday	24.5000	Western Union, MoneyGram,Vigo	\N	None
5	0101000020E6100000136846886BA2D5BF9B52A782B0301640	\N	www.adb.com.gh	AGRICULTURAL DEVELOPMENT BANK	Major Bank	Korkordzor	Yes	0.0000	\N	0202030100	\N	No	0.0000	Western Union & MoneyGram	VISA & GH Link	\N
6	0101000020E6100000C7E5846BF0ADCDBFC806566715241640	korlebu@icbankgh.com	www.icbankingroup.com	INTERNATIONAL CONTINENTAL BANK	Major Bank	Korle Bu	Yes	20.9500	pmb 16 mamprobi	0302687147	0302687126	Saturday	20.9500	Other	VISA	\N
7	0101000020E6100000AA4371E5EBC6CDBFBB8B0BEADD241640	customerservice@gcb.com.gh	www.gcb.com.gh	GHANA COMMERCIAL BANK	Major Bank	Korle bu	Yes	20.0000	P O BOX 3852 Accra	0302666521	0302666522	No	19.6000	Other	MasterCard, VISA, GH Link	\N
8	0101000020E61000008FAD11E3516BD0BFC5D555EEE8261640	whobattlesthelord@gmail.com	\N	WHO BATTLES THE LORD	Savings and Loans	Mamprobi	No	84.0000	\N	0303934511	\N	\N	0.0000	\N	\N	\N
9	0101000020E610000036FF3A43AFDCCDBFFB41D1D4EA401640	jagyarko@turningpointmicrofinance.com	\N	TURNING POINT MICROFINANCE CO. LTD.	Other	Abossey Okai	\N	0.0000	#B11/6 Ayikai Street, Abossey Okai, Accra	+233302764214	+233302764223	No	0.0000	\N	\N	\N
10	0101000020E6100000719237802DCCCDBF890A88D6C33F1640	\N	\N	DWETIRE MICRO FINANCE	Other	Abossey Okai	\N	0.0000	P.O Box ST 159, Abossey Okai	0202027446	\N	\N	0.0000	\N	\N	MTN
11	0101000020E61000002B9D59A674C9CABFB774867063621640	\N	\N	\N	Major Bank	Kotobabi	\N	0.0000	\N	0302681146	\N	\N	0.0000	\N	\N	\N
12	0101000020E61000002385468235C9CABFE7D98B6061621640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	Kotobabi	\N	0.0000	\N	0302681146	\N	Saturday	0.0000	Western Union	MasterCard	\N
13	0101000020E610000049C809644AD3C9BFC074FCB26B611640	\N	www.beigecapital.com	BEIGE CAPITAL	Savings and Loans	Pigfarm	\N	6.9000	\N	0302500506	\N	No	0.0000	Western Union	None	MTN
14	0101000020E610000019C9C52303E6C9BF46A89B97E9601640	\N	\N	\N	Savings and Loans	Pigfarm	No	6.9000	\N	0302500506	\N	No	0.0000	\N	\N	\N
15	0101000020E6100000E7D53BC7FCF4C9BFB80B1AE67E601640	barclays@africaonline.com.gh	www.barclays.com/africa/ghana	BARCLAYS BANK	Major Bank	kotobabi	Yes	1.0000	P.O Box Gp2949, accra	0302664901,665382	660579	No	15.0000	None	MasterCard	None
16	0101000020E6100000DABD75371F9CA0BFA592E071D8BD1640	info@dangmerb.com	www.dangmerb.com	UNION RURAL BANK	Rural and Community Bank	ashaiman	No	27.0000	p.o.box 39 prampram	0303303115	\N	No	22.2500	Western Union & MoneyGram	\N	\N
17	0101000020E61000003284C88D948CCABF283634D1AF5B1640	info@firstcapitalplus.net	www.firstcapitalplus.net	FIRST CAPITAL PLUS BANK	Savings and Loans	Newtown	Yes	20.0000	1528 Newtown Main Road	233 (0) 30 2240380	233-302-211473	No	0.0000	Western Union & MoneyGram	VISA	\N
18	0101000020E6100000767191DC22229DBFF64C67672CBE1640	info@unicreditghana.com	www.unicreditghana.com	UNION CREDIT GHANA	Savings and Loans	ashaiman	No	14.0000	opp.papaye enterprise the bp market	0303305582	\N	Saturday	4.5000	MoneyGram	\N	\N
19	0101000020E61000004F46C80C3511CBBF8F4EA156B8371640	utbank@ghana.com	www.utbankghana.com	UT BANK	Major Bank	adabraka	Yes	3.0000	p.o.box 14776	\N	\N	Saturday	3.5000	Western Union & MoneyGram	VISA & GH Link	MTN
20	0101000020E6100000AD0CD52187F2D0BF8E24E8EAA93C1640	info@nib-ghana.com	www.nib-ghana.com	NATIONAL INVESTMENT BANK	Major Bank	Dansoman	Yes	0.0000	P.O Box AN 3726, Accra-North.	0302661702	\N	\N	0.0000	Western Union & MoneyGram	VISA	\N
21	0101000020E61000001536E0878096CABF2EA84411E05C1640	accracentral@hfcbank.com.gh	www.hfcbank.com.gh	HFC BANK	Major Bank	Accra Central	Yes	16.0000	\N	0302683756-9	0302683761	Saturday	0.0000	Western Union & MoneyGram	VISA	\N
22	0101000020E61000004D08CE4198D5CDBF16DFAE8B88391640	\N	\N	TRANSWEST MICROFINANCE	Other	Abossey Okai	\N	6.0000	P.O Box KN 4784, Kaneshie-Accra	0506732211	\N	\N	0.0000	\N	\N	\N
23	0101000020E610000080F2947277E09CBF3D295ECA99BE1640	customercare@stanbic.com.gh	www.stanbic.com.gh	STANBIC	Major Bank	ashaiman	Yes	3.0000	P.O Box CT2334	0303305582	\N	Saturday	20.9200	MoneyGram	GH Link	MTN
24	0101000020E6100000ECD3FCFC6E92CABFB9E2ACD6C4591640	sgghana.info@socgen.com.gh	www.societegenerale.com.gh	SG-SSB	Major Bank	New Town	Yes	0.0000	P.O Box NT 444, New Town	0302-228512	0302-228512	No	7.0000	Western Union	VISA	\N
25	0101000020E61000004D752172550ECBBF338639CDE4381640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	Reinsurance House	Yes	6.0000	\N	080030000	\N	No	21.5000	Western Union & MoneyGram	VISA & GH Link	GloGhana
26	0101000020E6100000929AA95930E2D2BF32A1517A9ECE1640	grbamasaman@yahoo.com	www.garural.com	GA RURAL BANK	Rural and Community Bank	amasaman	No	2.5000	P.O Box AM 70, Amasaman	0302900120 /03020990251	\N	No	2.5000	Western Union & MoneyGram	None	None
27	0101000020E61000007D5C7B1E96A3CABF6BADBCB8F3561640	customerservice@gcb.com.gh	www.gcb.com.gh	GHANA COMMERCIAL BANK	Major Bank	Accra New Town	Yes	0.0000	\N	+233-302 024 6025/30	\N	No	19.8600	Western Union & MoneyGram	MasterCard & VISA	None
28	0101000020E6100000FA6CAC24C007CBBF98666D8A49381640	service.excellence@barclays.com	www.barclays.com/africa/ghana	BARCLAYS BANK	Major Bank	avenue central	Yes	28.0000	p.o.box 558 accra	03022429150	\N	No	19.9800	None	VISA & GH Link	\N
29	0101000020E610000066E369757D98CDBFC10BD54AD33B1640	enquiries@boaghana.com	www.boaghana.com	BANK OF AFRICA	Major Bank	Abossey Okai	Yes	0.0000	\N	0302769634	\N	Saturday	34.0000	Western Union	VISA	MTN
30	0101000020E610000083A0E7462EB1CABF91A5295033541640	newtown.bo@boaghana.com	www.boaghana.com	BANK OF AFRICA	Major Bank	New Town	Yes	3.0000	B Plaza, Hill Street Intesection.	233 302 243310	233 302 243321	No	0.0000	Western Union	VISA	\N
31	0101000020E6100000EDCDC5D1328DCDBFB77278CF5C3C1640	\N	www.barclays.com/africa/ghana	BARCLAYS BANK	Major Bank	Abossey Okai	Yes	0.0000	P.O Box GP 2949	0302672919	\N	No	19.9200	Other	MasterCard	\N
32	0101000020E61000004254F489EDACCABFE65014445C531640	\N	\N	MIDLAND SAVINGS AND LOANS	Savings and Loans	malata, new town	No	5.0000	\N	0307024126	\N	Saturday	48.0000	Western Union & MoneyGram	\N	Airtel
33	0101000020E61000007A3ACDCDD82BCBBFE127798D013B1640	info@myfidelitybank.net	www.fidelitybank.com.gh	FIDELITY BANK	Major Bank	kwabena Nkrumah Av.	No	29.6000	p.o.box 43 Ct accra	0302214490	\N	No	26.7400	Western Union & MoneyGram	None	MTN
34	0101000020E61000001B4DB9FE12D1CABF74E66CD52A531640	info@gaslghana.com	www.gaslghana.com	GLOBAL ACCESS SAVINGS AND LOANS	Savings and Loans	New town, Mallam Atta, accra	No	10.0000	\N	0302241768	\N	Sunday	0.0000	Western Union, MoneyGram,Vigo	\N	MTN
35	0101000020E6100000D639ACD8121CCABFBBB626B930AB1640	enquiries@utbankghana.com	www.utbankghana.com	UT BANK	Major Bank	Haatso	Yes	4.5000	Box ct 1777, cantonment	0202114848	\N	Saturday	0.0000	Western Union & MoneyGram	MasterCard	\N
36	0101000020E6100000A36B48289FD2CABFD26EB19118531640	\N	\N	\N	Major Bank	accra new town	Yes	7.0000	P.O Box Gp 2363, Accra	0302770403	\N	Sunday	48.0000	Western Union & MoneyGram	MasterCard	\N
37	0101000020E610000029D9555DC22ACABF11464C32E9AB1640	info@beigecapital.com	www.beigecapital.com	BEIGE CAPITAL	Savings and Loans	Haatso	No	6.9000	PMB 9AF	0302500506	0302500515	Saturday	0.0000	Western Union & MoneyGram	None	MTN
38	0101000020E6100000FE4BE45467A8C9BF8EE3C97FA14D1640	info@ghana.accessbankplc.com	www.accessbankplc.com/gh	ACCESS BANK	Major Bank	Nima	Yes	3.0000	\N	0289555654	\N	No	2.0000	Western Union & MoneyGram	MasterCard	MTN
39	0101000020E610000049EBAB1165BCC9BF4783FB415BAB1640	jlbrisk@yahoo.com	www.jlbrisk.com.gh	JLBRISK MICRO FINANCE	Other	Haatso	No	4.0000	Box	0302969099/0201651132	\N	Saturday	0.0000	None	None	None
40	0101000020E6100000C818C362307FC9BF5551061745AB1640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	Haatso	Yes	29.0000	\N	0302 2213999	\N	Saturday	23.0000	Western Union & MoneyGram	MasterCard	\N
41	0101000020E6100000165FE85B64B59FBFF75964EC9DBF1640	info@myfidelitybank.net	www.fidelitybank.com.gh	FIDELITY BANK	Major Bank	Ashaiman	Yes	0.0000	pmb 31,accra	0302214490	\N	No	26.7400	Western Union, MoneyGram,Vigo	MasterCard, VISA, GH Link	MTN
42	0101000020E61000003F3F974138F9D0BF2CC189A680331640	hfcomp@hfcbank.com.gh	www.hfcbank.com.gh	HFC BANK	Major Bank	Dansoman	Yes	20.0000	P.O Box CT 4603, Cantoment.	0289559310	\N	Sunday	27.6900	Western Union & MoneyGram	VISA	\N
43	0101000020E6100000005038C75E0EC9BFF0846D4931AB1640	info@connectcapital.com	www.connectcapital.com	CONNECT CAPITAL	Other	Haatso supermarket	No	7.0000	P.O Box OS 0132, Osu	0302542710	\N	No	0.0000	None	None	None
44	0101000020E6100000CBAC8098A4E8A1BF2066E8E0F8BB1640	info@utbankghana.com	www.utbankghana.com	UT BANK	Major Bank	Ashaiman	Yes	4.0000	25B manet towers,aiport city	0303310316	\N	No	25.9000	Western Union & MoneyGram	VISA & GH Link	None
45	0101000020E6100000BE44F0F9DAFBD0BF8AAC90309E331640	\N	\N	\N	Major Bank	Dansoman	Yes	0.0000	\N	\N	\N	Saturday	0.0000	Western Union, MoneyGram,Vigo	MasterCard, VISA, GH Link	MTN
46	0101000020E6100000C23D078DB81DA3BF170D594B1CB81640	customerservice@gcb.com.gh	www.gcb.com.gh	GHANA COMMERCIAL BANK	Major Bank	Ashaiman	Yes	11.0000	P.o.box AS 199,Ashaiman	0303307691	\N	No	19.8600	Western Union, MoneyGram,Vigo	MasterCard, VISA, GH Link	None
47	0101000020E610000071A6EAA19F6DCBBF9FE9E6CC174F1640	sgghana.info@socgen.com	www.societegenerale.com.gh	SG-SSB	Major Bank	\N	Yes	5.2000	P.O Box 13119, ring road central, Accra	0302214314	\N	No	21.0000	Western Union & MoneyGram	MasterCard & VISA	\N
48	0101000020E61000006EE94831D213CEBFD425D1F16D711640	abeka@nib-ghana.com	\N	\N	Major Bank	Abeka	Yes	0.0000	P.O Box Gp3726, Accra	0302400113	+233302416190	No	0.0000	Western Union, MoneyGram,Vigo	VISA	\N
49	0101000020E610000019D09B7B602ACBBFB41C4F80624F1640	\N	\N	\N	Savings and Loans	Kokomlemle	Yes	7.0000	\N	\N	\N	Saturday	0.0000	Western Union & MoneyGram	VISA	None
50	0101000020E6100000EE55EA5D479AC9BF2B9AA987D1501640	\N	\N	\N	Major Bank	Nima	Yes	0.0000	\N	\N	\N	No	0.0000	Western Union & MoneyGram	VISA & GH Link	None
51	0101000020E61000002E8D80CCC791C8BF1C990BF8444A1640	rrc.branch@prudentialbank.com.gh	www.prudentialbank.com.gh	PRUDENTIAL BANK	Major Bank	RRC	Yes	22.0000	General post office private email	0302781200	\N	No	27.5800	Western Union, MoneyGram,Vigo	VISA	\N
52	0101000020E610000077E484A6C481C8BFD7A96929A4491640	info@firstnationalghana.com	www.firstnationalghana.com	FIRST NATIONAL GHANA BANK	Savings and Loans	\N	\N	0.0000	\N	0302218855	\N	\N	0.0000	\N	\N	\N
53	0101000020E6100000142BF88956CBC9BF66D439DF8D4A1640	\N	www.stanbic.com.gh	STANBIC BANK	Major Bank	Ring Road	Yes	0.0000	P.O Box CT2344 cantoments	030225480325	0302687669	Saturday	22.0000	MoneyGram	MasterCard & VISA	MTN
54	0101000020E610000010B6EDEDBBD8C9BF0CF7F17F994A1640	calbank@calbank.net	www.calbank.net	CAL BANK	Major Bank	Ring Road	Yes	0.0000	P.O Box 14596 Accra Ghana	0302680061279	233303680061	Saturday	25.0000	Western Union, MoneyGram,Vigo	MasterCard	MTN
55	0101000020E6100000494DE423247ACEBFCF7B49C9AA6D1640	info@ghana.accessbankplc.com	www.accessbankplc.com/gh	ACCESS BANK	Major Bank	abeka	Yes	2.3000	\N	\N	\N	Saturday	0.0000	Western Union & MoneyGram	VISA & GH Link	MTN
56	0101000020E61000007443B1891CBECEBFD74ED0F0EC6C1640	info@ghana.accessbankplc.com	www.accessbankplc.com/gh	ACCESS BANK	Major Bank	abeka	Yes	2.3000	P.O Box GP353 accra	0244344222	\N	Saturday	0.0000	Western Union & MoneyGram	VISA & GH Link	MTN
57	0101000020E61000004DDCA68A29E2C9BFCCDF5D66684A1640	\N	\N	\N	Major Bank	Ring Road	Yes	0.0000	\N	\N	\N	Saturday	0.0000	Western Union, MoneyGram,Vigo	MasterCard	MTN
58	0101000020E61000000C4EEA4ED7BCCEBF101C14F8ED6C1640	service.excellence@barclays.com	www.barclays.com/africa/ghana	BARCLAYS BANK	Major Bank	abeka	Yes	20.0000	P.O Box 2949 accra	23330242915	\N	No	19.9700	None	MasterCard & VISA	\N
59	0101000020E610000091DE30CA037ACEBFD91FF120AB6D1640	infoghana@ubagroup.com	www.ubaghana.com	UNITED BANK OF AFRICA	Major Bank	abeka lapaz	Yes	0.0000	\N	233(0)80010035/233(0)302689511	\N	Saturday	0.0000	Western Union & MoneyGram	MasterCard	MTN
60	0101000020E6100000403E1BAFFEFCC9BFDD71A24BF5491640	infoghana@ubagroup.com	www.ubaghana.com	\N	Major Bank	Ring Road	Yes	0.0000	\N	030268352630	0302680666	No	23.9300	Western Union & MoneyGram	MasterCard	MTN
61	0101000020E6100000E877206BCB04CABF807F05DB1E4A1640	corporateaffairs@gtbghana.com	www.gtbghana. com	UNITED BANK OF AFRICA	Major Bank	Ring Road	Yes	28.0000	P.O Box 25A Castle Road, Ambassadorial Area Ridge	+(233302)675224, 680662	(+233302) 665564, 662727	Saturday	24.0000	Western Union, MoneyGram,Vigo	MasterCard & VISA	MTN
62	0101000020E61000000939B8BA8910CABFED8251440A4A1640	\N	\N	GUARANTY TRUST BANK	Major Bank	Ring Road	Yes	26.0000	\N	\N	\N	No	19.9200	None	\N	\N
63	0101000020E6100000EED673D72D9FCABFE762DFAADC481640	www.sc.com/gh	\N	\N	Major Bank	Ring Road	Yes	28.9500	P.O Box 768 Accra	0302740100	\N	No	0.0000	None	MasterCard	\N
64	0101000020E61000005BAEC7C363B1CABF1DE51E33CB481640	agricbank.com	www.agricbank.com	AGRICULTURAL DEVELOPMENT BANK	Major Bank	Ring Road	Yes	23.0000	P.O Box 419 Accra	0302229110	\N	No	0.0000	Western Union & MoneyGram	MasterCard	MTN
65	0101000020E6100000A2461C1A05B5CABF8F7EB05ABB481640	info@myfidelitybank.net	www.fidelitybank.com.gh	FIDELITY BANK	Major Bank	Ring Road	Yes	0.0000	P.O Box pmp 43. Cantoments	0302637144	\N	Sunday	0.0000	Western Union, MoneyGram,Vigo	VISA & GH Link	MTN
66	0101000020E6100000DEC760E9B4DDCABF31CB052467481640	info@firstnationalghana.com	www.firstnationalghana.com	FIRST NATIONAL GHANA BANK	Savings and Loans	Ring Road	Yes	12.0000	P. O Box 17187. Accra	0501259311	\N	Saturday	0.0000	Western Union, MoneyGram,Vigo	VISA	\N
67	0101000020E6100000A6533B03881DCDBFC0EAB304433E1640	corporateaffairs@gtbghana.com	www.gtbghana.com	GUARANTY TRUST BANK	Major Bank	ring road	Yes	16.0000	number 1 graphic road	0289446300 - 302	\N	Saturday	22.7500	Western Union, MoneyGram,Vigo	VISA & GH Link	MTN
68	0101000020E6100000310C89225029CDBFCFC1D169A03D1640	calbank@calbank.net	www.calbank.net	CAL BANK	Major Bank	Graphic road	Yes	10.0000	P.O Box 14596, accra ghana	0302678241	\N	Saturday	25.0000	Western Union, MoneyGram,Vigo	VISA & GH Link	MTN
69	0101000020E610000092DD8EF9D54DCBBF49D12036DD8B1640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	Kisseiman	Yes	0.0000	\N	0302 213999	\N	Saturday	0.0000	Western Union, MoneyGram,Vigo	MasterCard	\N
70	0101000020E6100000843777F58E2ECDBFCF9FD9506C7B1640	customercare@stanbic.com.gh	www.stanbic.com.gh	STANBIC BANK	Major Bank	Achimota	Yes	28.0000	\N	0302 420064	0302420067	Saturday	0.0000	MoneyGram	MasterCard & VISA	\N
71	0101000020E6100000100FA516D36BCEBFF75C12B1AC871640	service.excellence@barclays.com	www.barclays.com/africa/ghana	BARCLAYS BANK	Major Bank	Achimota ABC	Yes	27.0000	\N	03022242915	\N	No	19.9200	None	MasterCard	\N
108	0101000020E6100000B9D212E5AC4190BFC18CB75F5BC91640	Info@firstcapitalplus.com	www.firstcapitalplusbank.com	FIRST CAPITAL PLUS BANK	Major Bank	Ashaiman	No	12.0000	\N	\N	\N	\N	31.0000	\N	\N	None
72	0101000020E6100000D64477BBB172D2BF19CF4FD5CC431640	iniciomicrofinance@gmail.com	n/a	\N	Savings and Loans	McCarthy Hills	No	5.5000	P.O Box ML 987 ,Mallam	0302335294	N/A	No	5.5000	None	None	\N
73	0101000020E6100000D1012BEE1D2DB5BF7078ACCF71641640	info@firstnationalghana.com	www.firstnationalghana.com	FIRST NATIONAL GHANA BANK	Savings and Loans	Nungua	Yes	8.0000	\N	0302713558	\N	Saturday	5.0000	Western Union & MoneyGram	VISA	\N
74	0101000020E610000098D925122C58CEBF46002BA17F861640	BSic@gh.com	www.baic.gh	\N	Major Bank	Achimota ABC	Yes	28.0000	\N	028931497	\N	No	19.9200	Western Union	VISA	\N
75	0101000020E61000008E7930DF635BCEBF94843B5E11861640	info@theroyalbank.com.gh	www.theroyalbank.com.gh	THE ROYAL BANK	Major Bank	Achimota ABC	Yes	27.5000	Box CT 8134, Cantoments	0302 213561	0302 213567	No	0.0000	Western Union	VISA	\N
76	0101000020E6100000C7A1ABDD5032D1BF8A88BCC3655E1640	\N	www.biege capital.com	BEIGE CAPITAL	Savings and Loans	Santa Maria junction	No	10.0000	PMB 9AF Adenta	\N	0302500515	Saturday	16.0000	Western Union & MoneyGram	\N	MTN
77	0101000020E61000006579FE0ADC54CEBF4C868AAA72861640	\N	www.umb.gh.com	UNITED MERCHANT BANK	Other	Achimota ABC	No	26.0000	\N	0302 914627	\N	No	0.0000	Western Union & MoneyGram	\N	MTN
78	0101000020E610000079518E4A87E2B5BFDB2E14193F601640	info@legacycapital.com	www.legacycapital.com.gh	LEGACY CAPITAL	Savings and Loans	Nungua	No	5.5000	P.O.Box GP 19210, legacy capital, kuku hills	0303933007-9	\N	No	54.0000	None	None	\N
79	0101000020E610000033633409C55CCEBF0A73086F86861640	corporateaffairs@gtbghana.com	www.grbghana.com	GUARANTY TRUST BANK	Major Bank	Achimota ABC	Yes	6.0000	\N	0302 675224	0302 665564	Saturday	0.0000	Western Union	MasterCard	MTN
80	0101000020E6100000D1012BEE1D2DB5BF7078ACCF71641640	info@firstnationalghana.com	www.firstnationalghana.com	FIRST NATIONAL GHANA BANK	Savings and Loans	Nungua	Yes	8.0000	\N	0302713558	\N	Saturday	5.0000	Western Union & MoneyGram	VISA	\N
81	0101000020E6100000ACF7FFEEC561B4BF67A317C847661640	info@agricbank.com	www. agricbank.com	AGRICULTURAL DEVELOPMENT BANK	Major Bank	nungua	Yes	33.4100	P.o.box 875, Teshie-Nungua estate	0302712660	0302717078	Saturday	21.9200	Western Union & MoneyGram	MasterCard	MTN
82	0101000020E610000071FFD131E1C0CEBF46275CF0C68A1640	info@bestpointgh.com	www.bestpointgh.com	BEST POINT SAVINGS AND LOANS LIMITED	Savings and Loans	Mile 7	Yes	4.0000	P.O Box CT 10191, Cantoments	0303932990-4	\N	No	0.0000	Western Union	VISA	MTN
83	0101000020E61000003577CB637C7EA0BF00E6822416BE1640	info@procredit.com.gh	www.procredit.com.gh	PROCREDIT	Major Bank	ashaiman	Yes	6.0000	P.O Box Nt328,newtown accra	0246954332,0207113399	\N	Saturday	0.0000	None	None	\N
84	0101000020E6100000BAB44A5BB598A0BF86587E12D2BD1640	\N	www.unibankghana.com	UNIBANK	Major Bank	Ashaiman	Yes	18.0000	P.O Box An15367 Accra north	233212536969	\N	Saturday	31.1100	Western Union & MoneyGram	MasterCard	Airtel
85	0101000020E61000004E3488A4EE2FCFBF1E5BC7A43F901640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	St John's	Yes	29.0000	\N	0302 213999	\N	Saturday	23.0000	Western Union, MoneyGram,Vigo	MasterCard	\N
86	0101000020E6100000A1E6CCA02F62B4BF93AFCDB8816C1640	info@agtfinancialservices.com	www.agtfinancialservices.com	AGT MICRO FINANCE	Savings and Loans	nungua	No	7.0000	P.O Box GP 22059 Accra Ghana	0302716925	0245016420	Saturday	0.0000	None	None	\N
87	0101000020E6100000B6BAAE9C529DB3BFC4285C0D92701640	info@myfidelitybank.net	www.fidelitybank.com.gh	FIDELITY BANK	Major Bank	nungua	Yes	27.0000	PMB 43 cantonment	0501328202	\N	No	26.7400	Western Union & MoneyGram	MasterCard	MTN
88	0101000020E61000006698926D21969CBF896A8F7561C21640	\N	www.unibankghana.com	UNIBANK	Major Bank	Ashaiman	Yes	18.0000	P.O Box An15367accra north	233212536969	\N	Saturday	31.1100	Western Union & MoneyGram	VISA & GH Link	Airtel
89	0101000020E610000071FEE56075E8C5BFA6C88A9E65C71640	adenta@nib-ghana.com	\N	NATIONAL INVESTMENT BANK	Major Bank	Adenta	Yes	0.0000	P. O. Box GP 3726, Accra	+233(30)2519349-51	+233(30)2519350	No	21.0000	Western Union, MoneyGram,Vigo	VISA	None
90	0101000020E6100000451E9C27DCE2A2BFF427F35CA3BD1640	info@ghana.accessbankplc.com	www.accessbankplc.com/gh	ACCESS BANK	Major Bank	ashaiman	Yes	3.0000	starlets '91 road .P.O Box go 353,osu accra	0302742699/ 244 344222	\N	Saturday	0.0000	Western Union & MoneyGram	VISA & GH Link	MTN
91	0101000020E6100000914B43AAE5309CBF291AADED1AC21640	Info@manyaruralbank.com	www.manyaruralbank.com	MANYA RURALBANK	Rural and Community Bank	Ashaiman	No	8.0000	P.o.box 176 odumase krobo	0245820281,	\N	No	22.7500	Western Union & MoneyGram	None	MTN
92	0101000020E6100000FC168EE698DFC6BF4A30EEB1D2641640	\N	www.ifsfinanceservicegroup.com	IFS FINANCIAL SERVICES	Savings and Loans	head office	No	3.5000	\N	\N	\N	\N	0.0000	\N	\N	\N
93	0101000020E61000002E5654050E90B5BFFD41B42AA0631640	customerservice@gcb.com.gh	www.gcb.com.gh	GHANA COMMERCIAL BANK	Major Bank	Nungua	Yes	29.0000	P O Box TN 30 Teshie Nungua Est	0302715351	\N	Saturday	19.8600	Western Union, MoneyGram,Vigo	MasterCard, VISA, GH Link	\N
94	0101000020E610000035439064D2ECA8BF793B2C1A6CB11640	info@gtbghana.com	www.gtbghana.com	GUARANTY TRUST BANK	Major Bank	ashaiman	Yes	3.0000	\N	0302923914	\N	Saturday	0.0000	Western Union & MoneyGram	MasterCard & VISA	MTN
95	0101000020E6100000B59C88B8C171D1BFF5B870697F651640	\N	\N	\N	Major Bank	\N	Yes	0.0000	\N	\N	\N	\N	0.0000	Other	VISA	\N
96	0101000020E610000028D9C7B219E39BBF9BD5E56D57C21640	\N	www.ezisavingsandloans.com	EZI SAVINGS AND LOANS	Savings and Loans	Ashaiman	Yes	11.0000	\N	0202810708	\N	Saturday	23.4600	Western Union	VISA	\N
97	0101000020E6100000BF2ED8F0FC02A2BF444939196EB91640	info@fletcherholdingsghana.com	www.fletcherholdingsghana.com	FLETCHERHOLDINGSGHANA	Savings and Loans	sovereign micro finance ashaiman	No	7.0000	p.o.box OS133,pay,accra	0281065987/0303313097	\N	Saturday	5.0000	None	\N	None
98	0101000020E61000008293E38CA97ECEBF1DDF67377F931640	info@siriusmicrofinance.com	www.siriusmicrofinance.com	SIRIUS MICROFINANCE	Other	Dome mrkt	No	6.0000	P.O Box CT 6382, Cantoments Accra	0307 032173	\N	No	0.0000	None	None	None
99	0101000020E6100000A4D24F17E507C6BF036384E680C51640	shairuralbank@yahoo.com	\N	SHAI RURAL BANK	Rural and Community Bank	Adenta	No	30.0000	P. O. Box 47, Dodowa	+233243265321	\N	No	27.0000	Western Union & MoneyGram	None	None
100	0101000020E6100000C87E568C037FCEBFBF23E9A88F931640	mikenabs2004@yahoo.com	www.catamountfinance.com	CATAMOUNT FINANCE MONEY LENDING LTD	Other	Dome mrkt	No	20.0000	\N	0307 033594	\N	No	20.0000	None	None	\N
101	0101000020E6100000D3E22252577396BF8681246758C61640	\N	www.barclays.com/africa/ghana	BARCLAYS BANK	Major Bank	Ashiaman	Yes	0.0000	\N	0302429150	\N	No	19.9200	\N	MasterCard & VISA	\N
102	0101000020E61000007E92655F6002C7BF4237A60432651640	\N	\N	\N	Major Bank	opeibea	Yes	0.0000	\N	\N	\N	Saturday	0.0000	\N	MasterCard & VISA	Airtel
103	0101000020E61000008A0016FC08F8C5BF53A1809AE0C61640	shairuralbank@yahoo.com	\N	SHAI MICRO FINANCE-ADENTA	Savings and Loans	Adenta	No	4.5000	\N	+233307030295	\N	No	27.0000	None	None	\N
104	0101000020E6100000CCA71FE5173794BF0442F5BE06C71640	\N	www.unionbanking.com.gh	UNION BANK	Savings and Loans	Ashaiman	No	19.0000	\N	0501255397	\N	Saturday	24.0000	Western Union	\N	\N
105	0101000020E6100000BD85CB8012DDC6BF47D996F66C661640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	silver star branch	Yes	0.0000	\N	\N	\N	Saturday	0.0000	Western Union & MoneyGram	MasterCard	MTN
106	0101000020E61000003923957CD858D2BF4EB13DB243461640	info@eb-accion.com	www.eb-accion.com	EB-ACCION	Savings and Loans	McCarthy	Yes	0.0000	\N	0302782750-51	0302782755	Saturday	0.0000	Western Union	VISA & GH Link	Airtel
107	0101000020E610000000E94752A0F9D1BF6A60787675BF1640	melbondghana@yahoo.com	www.melbondghana.com	MELBOND	Savings and Loans	Pokuase	No	0.0000	P.O Box KT 538, Accra.	0302632104	\N	No	0.0000	None	None	\N
109	0101000020E6100000F8FC8A7DBB66D3BFB1B1D39E2AD61640	acbamicro@gmail.com	\N	ABCA MICROFINANCE	Other	Amasaman	No	40.0000	PO. Box Ms 29 Mile 7	0263017954	\N	No	24.0000	None	None	Airtel
110	0101000020E61000000005931B2B8CD1BF66234D3E446D1640	\N	\N	BEIGE CAPITAL	Savings and Loans	Santa Maria	No	0.0000	\N	\N	\N	Saturday	0.0000	Western Union, MoneyGram,Vigo	\N	MTN
111	0101000020E610000076C4F061FD9FBDBF91C33CEA544E1640	info@advansghana.com	www.advansghana.com	ADVANS SAVINGS AND LOANS	Savings and Loans	teshie laskala	\N	0.0000	p.o.box an 11426 accra	0285320118	0302247867	Saturday	0.0000	Western Union & MoneyGram	None	\N
112	0101000020E61000004DF174F0D995BBBFD8E12DA9C9521640	\N	\N	GOODNESS MICROFINANCE	Savings and Loans	teshie	\N	0.0000	\N	\N	\N	No	0.0000	\N	None	\N
113	0101000020E6100000F06779A3A476B9BF8BF5B97691581640	\N	\N	\N	Savings and Loans	\N	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
114	0101000020E61000007A90FA9A5D52B8BFC0FBD64E5B5B1640	\N	\N	\N	Major Bank	\N	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
115	0101000020E610000072EE2EDA3666D3BFFAC5F07B10D61640	info@cashplusm.com	www.cashplusm.com	CASHPLUS	Other	Amasaman	No	8.0000	PO.  Box MD 524	0202029313	\N	No	25.0000	None	None	\N
116	0101000020E61000007874A2E1C92CC3BFE902F2BB454A1640	\N	www.beigecapital.com.gh	BEIGE CAPITAL	Savings and Loans	Trade Fair	No	8.0000	\N	\N	\N	No	25.0000	Western Union	None	\N
117	0101000020E61000001DFAD1F62261D2BFA000BC089E461640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	McCarthy Hill	Yes	24.0000	19th Avenue Ridge West, P.M.B, G.P.O,Accra, Ghana	0302681146-8	0302680423	\N	24.0000	Western Union, MoneyGram,Vigo	VISA & GH Link	MTN
118	0101000020E610000051BE58FD17E8C5BF0EE9A8EE73CE1640	mtfinancialservicesltd@gmail.com	www.mtmicrofinance.com	MUTUAL TRUST (MT) MICROFINANCE LTD.	Savings and Loans	Adenta	No	26.0000	P.O Box SE 2023, Suame-Kumasi.	+233302977985	\N	Saturday	0.0000	None	None	\N
119	0101000020E61000004FD2B8B0FF95D1BF3C8B54C1E26F1640	entrepreneurscapital@gmail.com	\N	ENTREPRENEURSCAPITAL	Other	Sowutuom	No	0.0000	\N	0302943945	\N	\N	0.0000	\N	\N	\N
120	0101000020E610000066DD41D11D60D2BF6A49F2DED0451640	info@firstnationalghana.com	www.firstnationalghana.com	FIRST NATIONAL GHANA BANK	Savings and Loans	McCarthy Hill	No	0.0000	\N	0302218855	\N	Saturday	0.0000	Western Union & MoneyGram	None	MTN
121	0101000020E610000038F2B1EA196590BF4E2DAA3457C91640	Info@expresssavingsandloans.com	www.expresssavingandloans.com	EXPRESS SAVINGS AND LOANS LTD	Savings and Loans	Ashaiman	No	0.0000	P.O Box an10476accra north	0302227648	\N	No	12.0000	Other	None	None
122	0101000020E610000076C4F061FD9FBDBF91C33CEA544E1640	\N	\N	\N	Major Bank	teshie laskala	\N	4.0000	\N	\N	\N	\N	0.0000	Western Union & MoneyGram	MasterCard	MTN
123	0101000020E6100000F1A3DEB04739CABFC915D29090391640	feedback.ghana@standardchartered.com	www.standardchartered.com/gh	STANDARD CHARTERED	Major Bank	liberia road	Yes	0.6000	private mail bag. t.u.c accra	0217011709	021233681	No	15.7900	None	VISA & GH Link	None
124	0101000020E61000001F8DF02B528FCFBF38A976F0946C1640	\N	www.procredit.com.gh	PROCREDIT	Savings and Loans	Abeka lapaz	Yes	2.0000	P.O Box Nt 328 new town accra	\N	0302775809	Saturday	0.0000	\N	None	\N
125	0101000020E6100000B38F2EDB53D68DBFEE414646F5CA1640	Info@credit&finance.com	www.creditandfinancehouse.com	CREDIT AND FINANCE  HOUSE	Savings and Loans	Ashaiman	No	10.0000	\N	0303313166	\N	No	23.0000	None	\N	None
126	0101000020E61000003A754E7E2D4CD2BF47149EB726491640	grbamasaman@yahoo.com	\N	\N	Rural and Community Bank	Mallam Branch	No	0.0000	P.O box AM 70,Amasaman,Accra.	0302975261	\N	No	0.0000	Western Union & MoneyGram	None	MTN
127	0101000020E6100000596632AB1132CABF666363513F3A1640	info@firstatlanticbank.com.gh	www.firstaltanticbank.com.gh	FIRST ATLANTIC BANK	Major Bank	ridge west	Yes	4.0000	\N	0302682203/4	0302679245	No	0.0000	Western Union & MoneyGram	VISA	MTN
128	0101000020E6100000805187ECB8D58DBFC6D5EA3306CB1640	Info@gadmicrofinance.com	www.gadmicrofinance.com	GAD MICROFINANCE	Savings and Loans	Ashaiman	No	8.0000	P.o.box cE 11726 tema	0501286266	\N	No	6.0000	\N	None	None
129	0101000020E6100000826197EB483FB9BFA790853D485A1640	\N	\N	LA COMMUNITY BANK	Rural and Community Bank	\N	\N	0.0000	\N	\N	\N	No	0.0000	\N	None	\N
130	0101000020E6100000EE3334C7769FCFBF6A5B3C78346D1640	Headoffice@prudentialbank.com.gh	www.prudentialbank.com.gh	PRUDENTIAL BANK	Major Bank	Abeka lapaz	Yes	4.0000	\N	+233(0) 21220927	+233(0213220929)	Saturday	0.0000	Western Union, MoneyGram,Vigo	VISA & GH Link	\N
131	0101000020E6100000363E7BEC5E29C6BF7FDD7670AEB61640	\N	www.uba.group.com	UNITED BANK OF AFRICA	Major Bank	madina	Yes	4.0000	\N	0302520770	\N	Saturday	20.4700	Western Union & MoneyGram	MasterCard	MTN
132	0101000020E610000091C5589E36BCC5BF79A308FC25D31640	\N	www.prudentialbank.com.gh	PRUDENTIAL BANK	Major Bank	Adentan	Yes	6.0000	Private Mail Bag, GPO, Accra	+233302501346	+233302501345	No	27.5800	Western Union, MoneyGram,Vigo	VISA	\N
133	0101000020E61000008C6677642750A0BF5F3765F7F0C11640	info@opportunityghana.com	www.opportunityghana.com	OPPORTUNITY INTERNATIONAL SAVINGS AND LOANS LTD	Savings and Loans	ashaiman	No	2.7500	P.O Box JT323,accra	03022610000/0573233134	\N	Saturday	0.0000	Western Union & MoneyGram	\N	MTN
134	0101000020E610000079D80A89A03ECABF90C4115B883C1640	clientservice@databankgroup.com	www.databankgroup.com	DATABANK	Major Bank	61 barnes road, adabraka	No	22.0000	PMB Ministries post office	0302610610	0302681442	No	0.0000	None	None	Airtel
135	0101000020E6100000E9167C9FEBDB8DBFC39B8D01D1CC1640	Michellecamp.bo@boaghana.com	www.boaghana.com	BANK OF AFRICA	Major Bank	Ashaiman	Yes	3.0000	\N	0303300770	+233320300742	Saturday	24.3400	Western Union	VISA	\N
136	0101000020E61000001E45C955C84DD2BFC07596143A491640	\N	www.beigecapital.com	BEIGE CAPITAL	Savings and Loans	Mallam	No	25.0000	House number 21,Adenta High Street	0302288442	\N	No	24.0000	Western Union, MoneyGram,Vigo	None	MTN
137	0101000020E6100000DB7102963AD6CFBF15A3A4D3D36C1640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	Abeka lapaz	Yes	0.0000	\N	(233)302213999	\N	Saturday	0.0000	Western Union & MoneyGram	VISA & GH Link	\N
138	0101000020E610000012EDEAD86B29C6BF8F59EA54AAB61640	enquiries@utbankghana.com	www.utbankghana.com/region_select.cfm	UT BANK	Major Bank	madina	No	15.5000	\N	0302521333/6	\N	Saturday	25.9000	Other	None	MTN
139	0101000020E61000009D8DE4C4EEE0CFBF8FE2649AAF6C1640	\N	\N	\N	Major Bank	Abeka lapaz	Yes	0.0000	\N	0302740100	\N	Saturday	0.0000	\N	VISA & GH Link	\N
140	0101000020E6100000D960A8BA4D6A9FBFB9CA4EFAD6C01640	ashaiman@hfcbank.com.gh	www.hfcbank.com.gh	HFC BANK	Major Bank	ashaiman	Yes	2.0000	P.O Box cr 4603,cantoments accra	0303307781//0303307795	\N	Saturday	24.0000	Western Union & MoneyGram	None	None
141	0101000020E61000001FBA7DD86A52D1BF44DB1CFC3B631640	\N	www.financial republic.org	FINANCIAL REPUBLIC	Other	Santa Maria	No	6.0000	P.O Box KN 4622	0203296441	0302433049	No	16.0000	None	\N	MTN
142	0101000020E6100000E6F504294E9CC2BFCAD22CE3BF431640	info@myfidelitybank.net	www.fidelitybank.com.gh	FIDELITY BANK	Major Bank	La Trade fair	Yes	3.0000	plot. 57 Burma Camp road	+2335443427876	\N	Saturday	24.6100	Western Union, MoneyGram,Vigo	VISA	MTN
143	0101000020E6100000CC0D01ADD11DD0BFEBD6E2EE721A1640	capitaline.invest@gmail.com	www.capitaline.com	CAPITAL LINE INVESTMENT LIMITED	Other	Chorkor	\N	6.0000	\N	030732202	0302328503	No	0.0000	\N	\N	\N
144	0101000020E6100000A5AAFB789D7C8DBF7A3FD1CCCAC91640	Customercare@agricbank.com	www.adb.com.gh	AGRICULTURAL DEVELOPMENT BANK	Major Bank	Ashaiman	Yes	12.0000	\N	0202030100	\N	No	24.9100	Western Union	MasterCard	None
145	0101000020E61000005DA5685D47B9CDBF3640D7C1053B1640	\N	\N	JOEREGI SUSU AND LENDING COMPANY	Savings and Loans	\N	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
146	0101000020E6100000AC9F91F26C29C6BFA7867CF4AAB61640	info.ghana@accessbankplc.com	www.accessbankplc.com/gh	ACCESS BANK	Major Bank	madina	Yes	18.0000	p.o.box GP 353. osu,accra	0302520709	\N	\N	0.0000	MoneyGram	VISA & GH Link	MTN
147	0101000020E6100000DD5A23CF5046A0BFACA590E7AAC21640	info@advans.com	www.advansghana.com	ADVANS GHANA	Savings and Loans	advans savings and loans ashaiman branch	No	6.0000	p.o.box AN 11426,accra	0268091253/0285404280	\N	Saturday	0.0000	Western Union & MoneyGram	\N	\N
148	0101000020E6100000277B282E50BCC9BF894710DDF03A1640	hfcomp@hfcbank.com.com.gh	www.hfcbank.com.gh	HFC BANK	Major Bank	North ridge	Yes	12.5000	p.o.box ct 4603 accra	0302242090/4	0302242095	No	0.0000	\N	\N	\N
149	0101000020E61000000B06DCB5AF6B8DBFB564C365C3C91640	Info@gaslghana.com	www.gaslghana.com	\N	Savings and Loans	Ashaiman	No	0.0000	\N	0302919240	\N	Saturday	0.0000	Western Union & MoneyGram	\N	tiGO
150	0101000020E610000004D4C2C6C90BA0BF6A9A40D525C31640	INFO@MIDLAND.COM	www.midland.com	MIDLAND SAVINGS AND LOANS	Savings and Loans	midland savings and loans	No	3.0000	plot NO. ASH/B58 ASHAIMAN MARKET	0307099861	\N	Saturday	0.0000	Western Union & MoneyGram	\N	MTN
151	0101000020E6100000B1410E1C240CD0BFEEA68B98C46B1640	Customcare@agricbank.com	www.agricbank.com	AGRICULTURAL DEVELOPMENT BANK	Major Bank	Abeka lapaz	Yes	0.0000	\N	0302224043-4	\N	Saturday	0.0000	Western Union & MoneyGram	MasterCard	MTN
152	0101000020E610000080C1E0D39139A0BF70F73D8BD7C11640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	Ashaiman	Yes	3.0000	\N	0302213999	\N	Saturday	0.0000	Western Union, MoneyGram,Vigo	MasterCard	MTN
153	0101000020E610000025DCD9998EEAC9BF9B553770333D1640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	head office	Yes	2.0000	\N	0302681181	\N	No	30.0000	Western Union & MoneyGram	VISA & GH Link	\N
154	0101000020E61000004349E12DB90BD0BF2475FB12EC6B1640	Info@gaslghana.com	www.gaslghana.com	GLOBAL ACCESS SAVINGS AND LOANS	Savings and Loans	Abeka lapaz	No	10.0000	\N	0302919240	\N	Sunday	0.0000	Western Union, MoneyGram,Vigo	\N	MTN
155	0101000020E610000085949BDB65528CBF85324E1547C91640	\N	www.universalmerchantbank.com	UNIVERSAL MERCHANT BANK	Major Bank	Ashaiman	Yes	0.0500	\N	0303302698	\N	Saturday	28.0000	Western Union, MoneyGram,Vigo	\N	MTN
156	0101000020E6100000459E6D45BFB0D0BF9944001C5B1A1640	\N	www.idghana.org	INITIATIVE DEVELOPMENT GHANA	Other	Shiabu	\N	36.0000	P.O Box 19383 GPO Accra	0302320699	\N	\N	0.0000	\N	\N	\N
157	0101000020E610000009BA1C407DC0C9BF944871E0323A1640	infoghana@ubagroup.com	www.ubaghana.com	UNITED BANK OF AFRICA	Major Bank	Ridge	Yes	22.5700	\N	030(2)683526	030(2)680666	No	23.9300	Western Union & MoneyGram	VISA & GH Link	MTN
158	0101000020E6100000F39045C995F6C6BF30B5BD6A1B701640	\N	ubaghana.com	UNITED BANK OF AFRICA	Major Bank	airport	Yes	4.0000	\N	\N	\N	No	20.0700	Western Union & MoneyGram	VISA & GH Link	MTN
159	0101000020E6100000DACF8D2944E59FBF6740311334C31640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	ashaiman	Yes	3.0000	\N	0302213999	\N	Saturday	0.0000	Western Union, MoneyGram,Vigo	MasterCard	MTN
160	0101000020E61000006836801FD806D1BF60B37C419EA11640	trobu@gmail	\N	TROBU MICROFINANCE	Other	Ofankor branch	No	7.0000	P.O Box AN 15213, Accra North	0303930189	\N	No	0.0137	None	None	\N
161	0101000020E61000005A6DEDAE9644D0BFC1B0F466586B1640	info@myfidelitybank.net	www.fidelitybank.com.gh	FIDELITY BANK	Major Bank	Abeka lapaz	Yes	8.0000	\N	+233241782869	\N	No	0.0000	Western Union & MoneyGram	VISA & GH Link	MTN
162	0101000020E61000007CE8DA62F4D6D0BF596CB966F31B1640	\N	\N	DACCVEST	Savings and Loans	Gbegbese	\N	60.0000	P.O Box 714. Mamprobi, Accra	0303932307	\N	Saturday	0.0000	\N	\N	\N
163	0101000020E6100000C0D7D5308B8FC3BF17765259C63A1640	info@agtfinicialservices.net	www.agtmicrofinance.com	AFRICAN GUARANTY TRUST MICRO FINANCE	Savings and Loans	la branch	No	0.0000	\N	0302773959	\N	Saturday	0.0000	None	None	\N
164	0101000020E6100000BA99321CC5E4D0BF8869732F401D1640	statecapitalgh@yahoo.com	\N	STATE CAPITAL SAVINGS AND LOANS	Savings and Loans	Dansoman - Last Stop	\N	20.0000	P.O.Box 12. Kaneshie	0203297385	\N	Saturday	0.0000	\N	\N	\N
165	0101000020E6100000EA1DC42983DDC9BFB268123321391640	customercare@agricbank.com	www.agricbank.com	AGRICULTURAL DEVELOPMENT BANK	Major Bank	Cedi house	No	5.0000	\N	0302662519/0243109820	\N	No	23.9100	Western Union & MoneyGram	None	\N
166	0101000020E6100000CB598440299CCFBF2E6139BBD66D1640	\N	www.stanbicbank.com.gh	STANBIC BANK	Major Bank	Lapaz	Yes	2.0000	\N	\N	\N	Saturday	0.0000	\N	MasterCard	\N
167	0101000020E610000001DECA4B4290D0BF736C9316449D1640	\N	\N	ADEHYEMAN	Savings and Loans	ofankor	No	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
168	0101000020E610000049B9D817BC9EC9BF7723724FD4401640	info@myfidelitybank.net	www.fidelitybank.com.gh	FIDELITY BANK	Major Bank	Ridge Tower-Ridge	Yes	3.0000	PMB 43, Cantonments, accra ghana	030221302214490	0302678868	Saturday	24.6000	Western Union & MoneyGram	VISA & GH Link	MTN
169	0101000020E61000007CB0CD84C1EBD0BF6497A007981D1640	\N	\N	QUICK CREDIT INVESTMENT & MONEY LENDING COMPANY	Savings and Loans	Agage	\N	0.0000	\N	0509340321	\N	No	0.0000	\N	\N	\N
170	0101000020E61000002A955CF58A3CC7BF7CD96C4CF86F1640	\N	www.gtbghana.com	GUARANTY TRUST BANK	Major Bank	airport	Yes	0.0000	\N	\N	\N	Saturday	23.3300	Western Union, MoneyGram,Vigo	MasterCard	MTN
171	0101000020E6100000EF5BBA2A54B2CEBFE7656C2E3A6F1640	Gh.corperateaffairs@ghbank.com	www.gtbghana.com	GUARANTY TRUST BANK	Major Bank	Abeka lapaz	Yes	0.0000	\N	0302675224	\N	Saturday	0.0000	\N	MasterCard, VISA, GH Link	\N
172	0101000020E6100000D1C90F975C7BC9BF92D8EA3DB73B1640	info@unibankghana.com	www.unibankghana.com	UNIBANK	Major Bank	head office	No	7.0000	P.O Box AN 15367	0302216000	0302233582	No	31.1100	Western Union & MoneyGram	None	\N
173	0101000020E6100000C6E5AB0426E4D0BFB7D03B1C141E1640	info@opportunityghana.com	www.opportunityghana.com	OPPORTUNITY INTERNATIONAL SAVINGS AND LOANS LTD	Savings and Loans	Agage Last Stop	Yes	48.0000	P.O Box JT 323. Accra. Ghana	0307038182	+233302665919	No	0.0000	Western Union & MoneyGram	None	MTN
174	0101000020E6100000DA0AF90E826DC9BF86A4229AC43D1640	customercare@stanbic.com.gh	\N	\N	Major Bank	ridge	Yes	0.0000	\N	0302815789	\N	Saturday	20.9200	Western Union & MoneyGram	MasterCard, VISA, GH Link	MTN
175	0101000020E6100000C3922F237F98CEBF9501D8283A6F1640	\N	www.myumbbank.com	UNIVERSAL MERCHANT BANK	Major Bank	Abeka lapaz	Yes	0.0000	P.O Box 401 abeka	\N	\N	Saturday	0.0000	Western Union & MoneyGram	MasterCard	MTN
176	0101000020E61000001C1CB9DF5794D0BFCCDF6DE2A89C1640	sales@silbanc.com	www.silbanc	SILBANCAPITAL	Other	ofankor	No	0.0000	\N	0302415857	\N	No	0.0000	Western Union	None	MTN
177	0101000020E6100000D933F14B5798CEBFCF5E7AAE0C701640	Info@gaslghana.com	www.gaslghana.com	GLOBAL ACCESS	Savings and Loans	Abeka head office	No	10.0000	\N	0302919245	\N	Saturday	0.0000	MoneyGram & Vigo	None	MTN
178	0101000020E6100000597F4CB38C5CC9BFD0A95B39303D1640	coroporateaffairs@gtbank.com	www.gtbghana.com	GUARANTY TRUST BANK	Major Bank	castle road,ridge	Yes	0.0000	\N	0302675224	0302665564	No	21.9700	Western Union & MoneyGram	MasterCard, VISA, GH Link	MTN
179	0101000020E6100000A4B0EA4F17E3CEBF7D5F0CDF9D6F1640	Excellence@barclays.com	www.barclays.com/africa/ghana	BARCLAYS BANK	Major Bank	Abeka lapaz	Yes	0.0000	P.O Box 2949 Accra	+23330242915	\N	\N	0.0000	None	MasterCard & VISA	None
180	0101000020E610000060A39DD34799C9BFBEA039675C351640	zenithbankghanaltd	www.zenithbank.com.gh	ZENITH BANK	Major Bank	\N	Yes	1.0000	\N	0302611500	\N	Saturday	8.0000	Western Union & MoneyGram	MasterCard	MTN
181	0101000020E6100000BBE0C69063DECEBF257A4FE08F6F1640	\N	\N	\N	Major Bank	Abeka lapaz	\N	0.0000	\N	+233(0)80010035	\N	\N	0.0000	Western Union & MoneyGram	None	MTN
182	0101000020E610000031A8EC904A06CFBF882EDD058F6F1640	Info@ghana.accessbankplc.com	www.accessplc.com/gh	ACCESS BANK	Major Bank	Abeka lapaz	Yes	2.3000	P.O Box Gp 353 accra	0244344222	\N	Saturday	0.0000	Western Union & MoneyGram	MasterCard	MTN
183	0101000020E61000009D846A757BA4C5BF4C388CC4DB451640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	Labone	Yes	17.9500	Block No. B56 Labone	0302933509	\N	Saturday	18.0000	Western Union, MoneyGram,Vigo	MasterCard	\N
184	0101000020E6100000A51A9FEA2AB4C5BF3BEC0A5A30491640	info@zenithbank.com.gh	www.zenithbank.com.gh	ZENITH BANK	Major Bank	Labone	Yes	25.0000	House No.F116-6 North Labone	0302784179	0302782668	Saturday	23.9500	Western Union & MoneyGram	MasterCard	\N
185	0101000020E6100000F32D357BFD83C5BF395279117C571640	\N	\N	\N	Major Bank	\N	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
186	0101000020E61000009F5E516B7628CBBF7F65CB2EF6471640	prudentialbank.com	www.prudentialbank.com.gh	PRUDENTIAL BANK	Major Bank	Kwame Nkrumah Circle	Yes	0.0000	Box pmb Accra	0245348320/ 0203413249	\N	No	0.0000	Western Union, MoneyGram,Vigo	VISA	\N
187	0101000020E61000009F5E516B7628CBBF7F65CB2EF6471640	prudentialbank.com	www.prudentialbank.com.gh	PRUDENTIAL BANK	Major Bank	Kwame Nkrumah Circle	Yes	0.0000	Box pmb Accra	0245348320/ 0203413249	\N	No	0.0000	Western Union, MoneyGram,Vigo	VISA	\N
188	0101000020E6100000087BBEC05C28CBBF56B63362EA471640	izweghana.com	www.izweghana. com	IZWE GHANA	Savings and Loans	Kwame Nkrumah Circle	No	2.9000	Box pmb gp158 Accra Central	0302251046/ 0244914171	\N	Saturday	0.0000	None	None	\N
189	0101000020E6100000746B1062CDDDC8BF6667AC95543E1640	apex@arbapexbank.com	www.apexbank.com	APEX BANK	Rural and Community Bank	Head Office Accra	No	0.0000	P.O Box GP 20321 Accra Ghana	233(0302) 771738, 772129, 772034	233 (0302) 772260	No	0.0000	None	None	\N
190	0101000020E610000005074B817F61C9BF2BF1EE97213C1640	service.excellence@barclays.com	www.barclays.com/africa/ghana	BARCLAYS BANK	Major Bank	ridge	Yes	28.0000	\N	0302429150	\N	No	19.9200	None	MasterCard, VISA, GH Link	None
191	0101000020E610000048476BA42052C8BFFF6DD1859A351640	info.ghana@accessbankplc.com	www.accessbankplc.com	ACCESS BANK	Major Bank	Starlets ΓÇÿ91 Road \nOpposite Accra Sports Stadium	Yes	0.0000	p.o.box Gp 354	+233 (0) 302 673300	\N	No	25.3000	Western Union & MoneyGram	VISA & GH Link	MTN
192	0101000020E6100000A453F47737E0CDBF04EB34865A231640	\N	\N	SPRING BOARD FINANCIAL SERVICES	Other	Korle Bu	\N	84.0000	P.O Box MP 2240. Mamprobi	0302936065	\N	No	0.0000	\N	\N	tiGO
193	0101000020E61000000F46DC6C8C58C7BF78427DB39C3C1640	customercare@agricbank.com	www.adb.com.gh	AGRICULTURAL DEVELOPMENT BANK	Major Bank	osu	Yes	26.5000	\N	0302224043/4	\N	No	21.5000	Western Union & MoneyGram	VISA	\N
194	0101000020E6100000B5411934F55DCEBF7A51EFFC9C221640	info@myfidelitybank.net	www.fidelitybank.com.gh	FIDELITY BANK	Major Bank	Mamprobi Post Bank	Yes	3.0000	PMB 43 Cantoments Accra	0302637144	+233302678868	Saturday	26.7000	Western Union & MoneyGram	VISA & GH Link	MTN
195	0101000020E6100000077BB6653E5ACEBFFF2BC5C0CF221640	info@waxsonfinancialservices.com	www. waxsonfinancialservices.com	WAXSON FINANCIAL SERVICES	Other	Mamprobi	\N	20.0000	P.O Box LT 371. Laterbiokorshie. Accra	0289405700	\N	No	27.0000	None	None	Airtel
196	0101000020E6100000A0A8D6EB763CC7BF3CAFE941AD411640	servicexcellence@boaghana.com	www.boaghana.com	BANK OF AFRICA	Major Bank	osu	\N	14.0000	\N	0302769634	\N	Saturday	24.3400	\N	VISA	\N
197	0101000020E6100000C9CDABAB3F37C7BF68EA0C1015421640	service.excellence@barclays.com	www.barclays.com/africa/ghana	BARCLAYS BANK	Major Bank	osu	Yes	28.0000	\N	0302429150	\N	No	19.9800	None	MasterCard, VISA, GH Link	None
198	0101000020E610000007859751C73CC7BFF7CE7B1247411640	info@ghana.accessbankplc.com	www.accessbankplc.com/gh	ACCESS BANK	Major Bank	osu	Yes	0.0000	P.O Box Gp 353, accra	0244344222	\N	Saturday	25.3000	Western Union & MoneyGram	VISA & GH Link	\N
199	0101000020E61000006328FA9C0148C7BFA36CB3A05B401640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	osu	Yes	16.0000	\N	0302213999	\N	Saturday	21.5000	Western Union, MoneyGram,Vigo	VISA & GH Link	GloGhana
200	0101000020E6100000065382B5D2B1C7BFA339B00941441640	info@leadfinancialservices.com	www.leadfinancialservices.com.gh	LEAD FINANCIAL SERVICES	Other	embassy road osu ringway	No	7.0000	P.O Box AN 8568 north accra	0204353050/233 30 294 5087	0204353050	No	0.0000	None	None	\N
201	0101000020E6100000AB3200213D4EC7BF7C0F950FFA3E1640	feedback.ghana@standardchartered.com	www.standradchartered.com	STANDARD CHARTERED	Major Bank	osu	Yes	0.6000	PMB	0302740100	\N	No	15.7900	\N	VISA & GH Link	None
202	0101000020E6100000F8E01C73C656C7BF35E39663D23D1640	info@unibankghana.com	www.unibankghana.com	UNIBANK	Major Bank	osu	Yes	17.0000	p.o.box AN 15367,accra north	0302785614	0302233582	Saturday	31.1100	Western Union & MoneyGram	VISA & GH Link	Airtel
203	0101000020E61000005F33A21CD8E0C9BF82AC90A219301640	sgghana.info@socgen.com.gh	www.societegenerale.com.gh	SG-SSB	Major Bank	lotteries	Yes	0.0000	P.O Box 13119 Accra	0302667370/672610/667370	0302668651	Saturday	0.0000	Western Union & MoneyGram	VISA	None
204	0101000020E610000046D50509C671CABFFE986F5F6E2B1640	customerservice@gcb.com.gh	www.gcb.com.gh	GHANA COMMERCIAL BANK	Major Bank	Accra High Street	Yes	0.0000	\N	0302246025	\N	No	0.0000	Western Union, MoneyGram,Vigo	MasterCard & VISA	\N
205	0101000020E610000018FCDBBF009FCEBFA1E31D85F53D1640	\N	\N	MELLBETH MONEY LENDING ENTERPRISE	Savings and Loans	Kaneshie	No	80.0000	P.O Box 6755 Accra	0303934479	\N	No	0.0000	None	None	None
206	0101000020E61000003587B9713558CABF70527E1E252C1640	customerservice@gcb.com.gh	www.gcb.com.gh	GHANA COMMERCIAL BANK	Major Bank	Accra High Street	Yes	0.0000	\N	0302246025	\N	No	0.0000	Western Union, MoneyGram,Vigo	MasterCard & VISA	\N
207	0101000020E6100000E2DFACB05665CABF29106452012B1640	sc.com.gh	www.sc.com.gh	STANDARD CHARTERED	Major Bank	high street	Yes	0.0000	P.O Box 59 Accra	0302740100	\N	No	0.0000	None	MasterCard	\N
208	0101000020E610000004F6F3926ADACEBFD46E99A6CC3E1640	infodesk@sinapiaba.com	www.sinapiaba.com	SINAPI ABA SAVINGS AND LOANS	Savings and Loans	Mateheko	No	0.0000	P.O Box 4911 Kumasi Accra	+233 (0)322030112/45359	\N	No	0.0000	Western Union, MoneyGram,Vigo	None	None
209	0101000020E610000061B6C3FB1374CABF9D7D1BF1572A1640	barclays.com/africa/ghana/high street	www.barclays.com/africa/ghana	BARCLAYS BANK	Major Bank	high street	Yes	0.0000	P.O Box GP2949 Accra	030266490124	\N	\N	19.9200	None	\N	\N
210	0101000020E610000003A4739A332ACEBFA00C2551AA391640	info@ftglobalglobe.com	www.ftglobalglobe.com	FT GLOBAL CAPITAL	Savings and Loans	Zongo	No	42.0000	\N	0246148632	\N	No	4.0000	None	\N	MTN
211	0101000020E6100000729604FD5278CABF4178B30E6C2A1640	info@myfidelitybank.net	www.fidelitybank.com.gh	FIDELITY BANK	Major Bank	high street	Yes	0.0000	box PMB 43 cantonments Accra	233 (0) 30267 7966	233 30 267 8868	Saturday	0.0000	Western Union & MoneyGram	MasterCard	MTN
212	0101000020E61000002BBB47A17EB3CEBF99BFCBEA313A1640	ebanking@prudentialbank.com.gh	www.prudentialbank.com.gh	PRUDENTIAL BANK	Major Bank	Zongo Junction Branch	Yes	16.0000	Prudential Bank Private Mail. Accra	0302781166	+233302781210	Saturday	24.0000	Western Union, MoneyGram,Vigo	VISA	None
213	0101000020E6100000640AFA6B5E6ECEBFF4C43A91C6401640	info@unibank.com	www.unibank.com	UNIBANK GHANA LIMITED	Major Bank	Kaneshie	Yes	0.0000	P.O Box AN 15367  Accra North	03023261258	0302326123	No	23.9500	Western Union, MoneyGram,Vigo	MasterCard & GH Link	Airtel
214	0101000020E6100000F995E38499AFCDBF7AC30A64D53A1640	\N	\N	GOLDVYNE FINANCIAL SERVICES	Other	Abossey Okai	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
215	0101000020E610000076739A99E63CCBBFB88E99BFE63C1640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	kwame Nkrumah Avenue	Yes	6.0000	\N	030213999	\N	Saturday	21.5000	Western Union, MoneyGram,Vigo	VISA & GH Link	GloGhana
216	0101000020E610000001CB1B55B66CCEBF843F6AC6CC401640	\N	www.deltamicrofinance.com	DELTA MICRO FINANCE	Savings and Loans	kaneshie	No	36.0000	P O BOX KN3275 Kaneshie	0312296074	\N	No	0.0000	\N	\N	\N
217	0101000020E610000014AA53B28936CEBF2345CB2AC3411640	etmicrofinance@yahoo.com	\N	ET MICROFINANCE	Other	Abossey okai	No	2.5000	P O BOX KN53331 Kaneshie	0302681679	\N	Sunday	2.5000	None	\N	MTN
258	0101000020E61000003E4D359361EED0BF35236776BA3A1640	\N	www.barclaysafrica.com	BARCLAYS BANK	Major Bank	Dansoman	Yes	27.0000	\N	0289543080	\N	No	19.9200	\N	MasterCard & VISA	\N
218	0101000020E6100000DBCADDFBD212CEBF199E0CC96C411640	info@firstnationalghana.com	www.firstnationalghana.com	FIRST NATIONAL GHANA BANK	Savings and Loans	Abossey Okai	Yes	8.0000	P O Box 17187 Accra	0302218855	0302218855	Saturday	32.0000	Western Union & MoneyGram	VISA	\N
219	0101000020E6100000D1D329680613CEBFB51BC2B164411640	info@asnghana.org	www.asnghana.org	AFRICAN SUPPORT NETWORK	Other	Abossey Okai	No	30.0000	P.O.Box KT 604. Kotobabi. Accra	0509451201	\N	No	0.0000	\N	\N	\N
220	0101000020E6100000A7FA33A20ADAC3BF4EDBE8332C501640	info.ghana@accessbank.com	www.accessbank.com	ACCESS BANK	Major Bank	La East cantoment	Yes	12.0000	P.O Box CT 1967 cantoment	+233784143	+233 217843082	No	22.0000	Western Union & MoneyGram	MasterCard	MTN
221	0101000020E61000002499F1D445C8C5BF580BBCBEC6431640	hcfomp@hfcbank.com	www.hfcbank.com.gh	HFC BANK	Major Bank	labone	Yes	12.0000	P.O Box ct 4603 cantoment, Accra	030242090	0302242095	No	24.7500	None	VISA	\N
222	0101000020E610000097444FD9B44EC6BF4DBF591E49461640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	labone	Yes	17.9500	Pmb Ct 443	0302 731610	\N	No	24.0000	Other	MasterCard	None
223	0101000020E61000007140079EEC6AC6BF9D1D30B6E6461640	\N	\N	\N	Major Bank	\N	Yes	23.0000	\N	\N	\N	Saturday	21.9700	Western Union & MoneyGram	MasterCard, VISA, GH Link	\N
224	0101000020E6100000E89190CD33DDC6BF2776C29F9E431640	\N	www.bond.com.gh	BOND CAPITAL	Other	labone cantoment	No	24.5000	\N	0302797184	\N	No	0.0000	None	None	None
225	0101000020E6100000662D9FDCB3ECC6BF0823AB93AF431640	\N	\N	\N	Major Bank	labone cantoment	Yes	22.5000	\N	\N	\N	Saturday	0.0000	MoneyGram	VISA	None
226	0101000020E610000096FAAA35D407C7BF166A2C623B441640	\N	\N	\N	Major Bank	labone cantoment	Yes	0.0000	\N	\N	\N	No	0.0000	MoneyGram	VISA	\N
227	0101000020E6100000968B3CF34143C4BFD75E58665C3D1640	\N	\N	\N	Rural and Community Bank	la	No	0.0000	\N	\N	\N	\N	0.0000	Western Union & MoneyGram	None	\N
228	0101000020E61000000B98D6328F7BCEBF93D05B8E5D931640	\N	\N	LEGEND MICROFINANCE	Other	Dome mrkt	No	7.0000	\N	\N	\N	No	0.0000	None	None	None
229	0101000020E6100000B737903F326BCEBF7DC5391A14941640	\N	\N	UNICREDIT SAVINGS AND LOANS	Savings and Loans	Dome mtkt	No	4.0000	\N	\N	\N	Saturday	0.0000	\N	\N	\N
230	0101000020E610000020ACD073ACD6CDBF62CFC4C0E63F1640	\N	www.mtslghana.com	MULTI CREDIT SAVINGS AND LOANS	Savings and Loans	Abossey Okai	No	4.0000	P.O Box1920. Kumasi	0302660510	0302660495	Saturday	0.0000	Western Union, MoneyGram,Vigo	\N	MTN
231	0101000020E6100000D95FCFA49EAACDBF37CB1F4EAC3F1640	\N	www.hfcbank.com.gh	HFC BANK	Major Bank	Abossey Okai	Yes	0.0000	\N	0302673975	0302671918	Saturday	27.6000	Western Union & MoneyGram	VISA	\N
232	0101000020E6100000F5A83A6201A3CDBF114B6B25123F1640	info@firstcapitalplus.net	www.firstcapitalplus.net	FIRST CAPITAL PLUS BANK	Major Bank	Abossey Okai	No	0.0000	\N	\N	\N	No	0.0000	Western Union, MoneyGram,Vigo	\N	\N
233	0101000020E61000008BB33BC9EBA8CDBF8F34764B063F1640	\N	www.firstalliedghana com	FIRST ALLIED SAVINGS AND LOANS	Savings and Loans	Abossey Okai	No	41.0000	P.O Box 5308. Kumasi	0302661136	0302661162	Saturday	36.0000	Western Union & MoneyGram	None	\N
234	0101000020E6100000A1ED306DB840D1BFDE7EA0633D5D1640	\N	\N	BROKEN YOKE FINANCIAL SERVICES	Savings and Loans	\N	No	0.0000	\N	\N	\N	\N	0.0000	\N	\N	None
235	0101000020E6100000011E70D23F48D1BF8952C759CA5C1640	Info@gaslghana.com	www.gaslghana.com	GLOBAL ACCESS	Savings and Loans	Kwashieman	No	0.0000	\N	0302919240	\N	Sunday	0.0000	Western Union, MoneyGram,Vigo	\N	MTN
236	0101000020E6100000C31800121D9BCDBFDD721B30FF3E1640	\N	\N	BEIGE CAPITAL	Savings and Loans	Abossey Okai	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
237	0101000020E61000008DCB04CF89A1CDBFDC20B080D63E1640	info@diamondcapital.com.gh	www.diamondcapital.com.gh	DIAMOND CAPITAL	Other	Abossey Okai	No	84.0000	P.O BoxGP 167. Asylum Down	0302230010	\N	No	0.0000	None	\N	\N
238	0101000020E610000095A3397810A7CDBF25838EF3A73E1640	top_up_cu@yahoo.com	\N	TOP-UP CREDIT UNION	Other	Abossey Okai	\N	0.0000	P.O Box GP 4311. Accra	0302241836	\N	Saturday	0.0000	\N	\N	\N
239	0101000020E6100000E3DDE5052EF7D0BF795B318581631640	Serviceexcellence@boaghana.com	www.boaghana.com	BANK OF AFRICA	Major Bank	Kwashieman	Yes	3.0000	\N	0302769634	\N	Saturday	0.0000	Western Union	VISA	None
240	0101000020E6100000121DBB832F4CD1BF98B61B61645C1640	\N	\N	\N	Major Bank	kwashieman	\N	0.0000	\N	\N	\N	Saturday	0.0000	Western Union, MoneyGram,Vigo	MasterCard	MTN
241	0101000020E6100000B770028C41B1D0BF66BD367417741640	info@reobgroup.com	www.reobgroup.com	REOB-FEKAMS	Other	Tabora	No	8.0000	P.O Box KN5657,KANESHIE ACCRA	0302432552	\N	Saturday	20.0000	None	None	\N
242	0101000020E61000009AFDE8301A41CEBFA0DB3880A7831640	info@proseedghana.com	www.proseedghana.com	PROSEED MICROFINANCE LIMITED	Other	Achimota	No	5.5000	P.O Box AT 1143 achimota	0307097700	\N	No	7.0000	Other	None	MTN
243	0101000020E61000003476C78FB72ED1BF9B300E56285D1640	\N	www.global access.com/gh	GLOBAL ACCES BANK	Savings and Loans	Santa Maria junction	No	10.0000	\N	03029192240/1	\N	Sunday	0.0000	Western Union & MoneyGram	None	MTN
244	0101000020E6100000BC746822AD4DCEBFB978E33622851640	grbamasaman@yahoo.com	www.garuralbank.com	GA RURAL BANK	Rural and Community Bank	Achimota	No	3.0000	Amasaman 71	0289225930	\N	No	28.0000	Western Union & MoneyGram	None	None
245	0101000020E61000004F13D4AC3299CDBF72A956EB3F3F1640	\N	www.equityfocusltd.com	EQUITY FOCUS MICROFINANCE LIMITED	Other	Abosssey Okai	\N	3.5000	P.O Box KD 277 Kanda	0302684127	\N	Saturday	0.0000	\N	\N	\N
246	0101000020E61000006A9EE71587B1D0BFA05B109ED8741640	\N	\N	GIANT GAIT MICROFINANCE	Other	\N	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
247	0101000020E610000015D4E14DE73DD2BFAF128DAB3C5C1640	cashgrowinvestment@yahoo.com	\N	CASH GROW INVESTMENT	Other	Awoshie	No	10.0000	P.O.BOX DS 1883	0268790545	\N	\N	0.0000	None	\N	MTN
248	0101000020E61000007EB556AE4476CDBF0523AD63E63D1640	ibanking@prudentialbank.com.gh	www.prudentialbank.com.gh	PRUDENTIAL BANK	Major Bank	Abossey Okai	Yes	16.0000	\N	0302781169	03026681226	Saturday	24.0000	Western Union, MoneyGram,Vigo	VISA	\N
249	0101000020E61000004B392B27FCEFD0BFECB84DAF1E3B1640	\N	www.agricbank.com	AGRICULTURAL DEVELOPMENT BANK	Major Bank	Dansoman	Yes	33.4100	P.O Box DS 2270, Dansoman	0302312415	\N	Saturday	24.9100	Western Union & MoneyGram	VISA & GH Link	MTN
250	0101000020E61000001A040C740D5CCEBF81590700A8861640	service.excellence@barclays.com	www.barclays.com/africa/ghana	BARCLAYS BANK	Major Bank	Achimota branch	Yes	28.0000	P.O Box AT1219 achimota	0302429150	\N	Saturday	19.9200	Other	MasterCard & VISA	MTN
251	0101000020E6100000E04F70EC69A8D0BF667DABDE85771640	\N	\N	EAGLET CAPITAL	Savings and Loans	Tabora	No	75.0000	P.O Box EN 16900	0302971994	\N	No	0.0000	None	\N	MTN
252	0101000020E61000008F7FD2134775CDBF9304BC2C9A3C1640	enquiries@utbankghana.com	www.utbankghana.com	UT BANK	Major Bank	Abossey Okai	Yes	48.0000	P.O Box CT 1778. Cantoments. Accra. Ghanap	+2330302740740	233302662640	Saturday	0.0000	Western Union & MoneyGram	VISA & GH Link	\N
253	0101000020E61000004292CA7D026FD0BFD54429158E691640	\N	\N	\N	Major Bank	Abeka lapaz	Yes	0.0000	\N	\N	\N	No	0.0000	Western Union & MoneyGram	MasterCard & VISA	None
254	0101000020E6100000ED8550738269D0BF9D61E74A7A691640	Www.mancapitalghana.com	\N	MAN CAPITAL	Savings and Loans	Abeka lapaz	No	5.0000	\N	0302323753	\N	\N	6.5000	None	None	None
255	0101000020E6100000656C3D75346ACDBF252629E041581640	Cardservices@zenithbank.com.gh	www.zenithbank.com.gh	ZENITH BANK	Major Bank	North Industrial Area Kaneshie	\N	1.0000	\N	+2333022533158	+2333022533158	\N	0.0000	Western Union & MoneyGram	VISA & GH Link	\N
256	0101000020E6100000519DA88DD360D0BF5DFC65E99F681640	Info@nfsghana.com	www.nfsghana.com	NATIONWIDE MICRO FINANCE LIMITED	Savings and Loans	Nyamekye darkuman	No	6.0000	P.O Box Sd 131 stadium accra	0302976636	\N	No	0.0000	Western Union	None	MTN
257	0101000020E61000009770A3C41EC1CEBFE488DEC839891640	Diberumicrofinance@yahoo.com	\N	DIBERU MICROFINANCE	Other	Achimota branch	No	19.0000	P.O Box AD88 adabraka	0302433080	\N	No	0.0000	None	None	None
259	0101000020E6100000894B2E9348ECCCBFEAA46AE156581640	\N	www.stanbicbank.com.gh	STANBIC BANK	Major Bank	industrial area	Yes	14.5000	\N	0302815789	\N	Saturday	20.9200	MoneyGram	MasterCard & VISA	MTN
260	0101000020E6100000DB76AFAD1BC6D0BF8F27E8BC947C1640	business@demmbert.com	www.demmbert.com	DEMMBERT INVESTMENT	Other	Tabora	No	6.0000	\N	0264947955	\N	No	16.0000	None	None	MTN
261	0101000020E61000003894DE6BC3A2D2BFB361E0A7C4651640	\N	www.melbondgh.com	MELBOND MICROFINANCE LIMITED	Other	Anyaa	No	5.0000	\N	0302632104	\N	No	0.0000	None	None	None
262	0101000020E610000056B5D8E1506BCDBFBFD5F6C1473C1640	\N	\N	UNION SAVINGS AND LOANS	Savings and Loans	\N	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
263	0101000020E61000007BE595053D61D0BFBF2057CD84671640	Info@advansghana.com	www.advansghana.com	ADVANS GHANA	Savings and Loans	Darkuman	No	6.9500	P.O Box An 11426 accra	+233265654771	+233(0)302247867	No	0.0000	Western Union & MoneyGram	None	None
264	0101000020E6100000227BF0ED69D8CCBF8F79C79BA3561640	nia@nib-ghana.com	\N	NATIONAL INVESTMENT BANK	Major Bank	industrial area	Yes	2.5000	\N	0302247754	0302246690	\N	0.0000	Western Union, MoneyGram,Vigo	VISA	\N
265	0101000020E61000003D270D45C16ECCBF64987C084B581640	bsicghana@bsic.com.gh	www.bsic.com.gh	SAHEL SAHARA	Other	North industrial area	\N	6.0000	\N	0302240110	0302240110	Saturday	0.0000	Western Union	VISA	\N
266	0101000020E6100000DE0B44DCF8EAD0BF0F49C407E7331640	\N	www.boaghana.com	BANK OF AFRICA	Major Bank	Dansoman	Yes	12.0000	\N	0302312842	\N	Saturday	24.3400	Western Union	VISA	MTN
267	0101000020E6100000B0AC2EAA94CFCCBF1166D66832561640	\N	\N	\N	Major Bank	industrial area	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
268	0101000020E6100000FED42A68C2C5CCBF54DF6E155F381640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	South Industrial Area	Yes	2.3500	P.O Box 19 7th Avenue. Ridge West. PMB Accra Ghana	0302213999	\N	Saturday	24.0000	Western Union, MoneyGram,Vigo	VISA & GH Link	MTN
269	0101000020E61000008D82EE0F0652D0BF5333AD129B661640	Firstrateinvest@gmail.com	\N	FIRST RATE INVESTMENTS	Savings and Loans	Darkuman nyamekye	No	5.0000	\N	0204344828	\N	No	0.0000	None	None	None
270	0101000020E61000005C7CB0806265CCBFE68898E5C9571640	Coperateaffairs@gtbghana.com	www.gtbghana.com	GUARANTY TRUST BANK	Major Bank	North industrial area	Yes	0.0000	+233302665564	\N	+233302665564	Saturday	0.0000	Western Union	MasterCard, VISA, GH Link	\N
271	0101000020E6100000A7533672F0F2D0BF70182CE148331640	customerservice@gcb.com.gh	www.gcb.com.gh	GHANA COMMERCIAL BANK	Major Bank	Dansoman	Yes	29.0000	\N	0302681531	\N	No	19.8600	Western Union & MoneyGram	MasterCard & VISA	\N
272	0101000020E61000001A7EA3891DABCCBFA9FB408366371640	customerservice@hfcbank.com.gh	www.hfcbank.com.gh	HFC BANK	Major Bank	South Industrial Area branch	\N	0.0000	P.O Box CT 4603. Cantoments. Accra	0302671963	+23321242095	Saturday	24.4000	Western Union & MoneyGram	VISA	\N
273	0101000020E610000077664FFB5871D2BF1D4DCB4456651640	pmclimited.gh@gmail.com	\N	PARAGON MICROFINANCE CO. LTD	Other	Anyaa	No	5.0000	P.O.Box AN 19179 Accra North	0302944450	\N	Saturday	0.0000	None	None	None
274	0101000020E6100000AE61A81FC735D0BFB87F4908B1621640	Info@beigecapital.com	www.beigecapital.com	BEIGE CAPITAL	Savings and Loans	Darkuman	No	10.0000	\N	0302258444	+233302500515	No	0.0000	Western Union	None	MTN
275	0101000020E61000002D472AE703C8CEBFEE6966A7D2891640	info@myfidelitybank.net	www.fidelitybank.com.gh	FIDELITY BANK	Major Bank	Achimota branch	Yes	2.0000	PMP 43 cantoment	0302214490	\N	No	26.7400	Western Union & MoneyGram	MasterCard, VISA, GH Link	MTN
276	0101000020E6100000021AF36CF9EAD0BF102BEDA513331640	info@myfidelitybank.net	www.fidelitybank.com.gh	FIDELITY BANK	Major Bank	Dansoman	Yes	25.6300	\N	0302301185	\N	Saturday	10.0000	Western Union, MoneyGram,Vigo	VISA	Airtel
277	0101000020E6100000D90AF863C3FCCBBF8E22540669591640	Info@unibank.com	www.unibank.com	UNIBANK	Major Bank	North industrial area	Yes	7.0000	\N	0302326123	0302326123	Saturday	0.0000	Western Union	VISA	\N
278	0101000020E6100000F4F76ACEEC81D2BF7A4D62AE43641640	\N	\N	EASY ACCESS SUSU ENTERPRISE	Other	Anyaa	No	5.0000	P.O.Box MD4 Accra	0244125975	\N	Saturday	0.0000	None	None	None
279	0101000020E610000043AE81278367CCBFEAD1E26AAF571640	Ebanking@prudentialbank.com.gh	www.prudentialbank.com.gh	PRUDENTIAL BANK	Major Bank	North industrial area	Yes	3.5000	\N	021781201	021781201	No	0.0000	\N	VISA	MTN
280	0101000020E6100000C3A2EF28B0F1D0BFBF68EC3CC7321640	info@firstcapitalplus.net	www.firstcapitalplus.net	FIRST CAPITAL PLUS BANK	Major Bank	Dansoman	Yes	3.5000	\N	0302955896	\N	No	23.0000	Western Union, MoneyGram,Vigo	None	\N
281	0101000020E61000007A279CC3EE3CD0BF6E678FEBBF5C1640	Captainsfinancialserv@gmail.com	\N	CAPTAINS MICROFINANCE	Savings and Loans	Darkuman	No	0.0000	\N	0302900650	\N	No	0.0000	None	None	MTN
282	0101000020E6100000414AA5039EF0D0BFEE8DD28592311640	\N	www.stanbicbank.com	STANBIC BANK	Major Bank	Dansoman	Yes	0.0000	\N	0244257885	\N	Saturday	20.9200	MoneyGram	MasterCard & VISA	MTN
283	0101000020E61000005C784BD0A411D0BF8AFD3404625A1640	Info@ghana.accessbankplc.com	www.accessbankplc.com/gh	ACCESS BANK	Major Bank	Darkuman	No	2.3000	\N	0302742699	\N	Saturday	0.0000	Western Union & MoneyGram	None	\N
284	0101000020E61000001FDDD475915FCFBF9C7C9010CF8B1640	\N	\N	GLOBAL ACCESS	Major Bank	New Achimota	No	0.0000	\N	\N	\N	Sunday	0.0000	Western Union, MoneyGram,Vigo	\N	MTN
285	0101000020E610000087EA476052C2D0BF0B0C91192D831640	royalcash46@yahoo.com	\N	ROYAL CASH MICROFINANCE	Other	alhaji	No	6.0000	P.O Box 297,Kaneshie,Accra	0302424003	\N	No	20.0000	None	None	\N
286	0101000020E61000007FC3ACE3DFA4CCBF8573C62E44371640	\N	www.myumbbank. com	UNIVERSAL MERCHANT BANK	Major Bank	South Industrial Area	Yes	24.0000	P.O Box 401. Accra	0302673228	0302673391	No	26.5000	Western Union, MoneyGram,Vigo	VISA	MTN
287	0101000020E6100000EB499C515F20D0BF1F3DBB4103531640	\N	\N	MULTI CREDIT SAVINGS AND LOANS	Savings and Loans	Darkuman	No	4.0000	\N	0302956513	\N	Saturday	0.0000	Western Union, MoneyGram,Vigo	None	MTN
288	0101000020E61000007EB171DF6BEAD0BF23146BE3EA3B1640	\N	www.beigecapital.com	BEIGE CAPITAL	Savings and Loans	Dansoman roundabou	No	6.9000	\N	0302500506	\N	No	0.0000	Western Union, MoneyGram,Vigo	None	MTN
289	0101000020E6100000E5DEFE057EB7D0BF289897BC1A831640	silbanccapital@yahoo.com	www.silbanccapital	SIL BANC CAPITAL	Other	alhaji	No	4.0000	P.O Box 9181KIA, ACCRA	0302415857	\N	No	17.5000	Western Union	\N	\N
290	0101000020E6100000846060E23A1ED0BFB2DAE4E1BF521640	\N	\N	ABII NATIONAL	Savings and Loans	Darkuman	Yes	0.0000	\N	\N	\N	No	0.0000	Western Union & MoneyGram	VISA	Airtel
291	0101000020E61000005CBAF5D12534D0BFCFD2D65866511640	Info@beigecapital.com	www.beigecapital.com	BEIGE CAPITAL	Savings and Loans	Darkuman	No	6.9000	\N	\N	\N	No	0.0000	Western Union	None	MTN
292	0101000020E61000000A0FF90DC201CDBFA00C2FCDAF391640	\N	\N	MIDLAND SAVINGS AND LOANS	Savings and Loans	South Industrial Area	No	0.0000	\N	\N	\N	\N	0.0000	Western Union & MoneyGram	None	MTN
293	0101000020E61000009AB5CBFF6592CEBFEB2652EF8B421640	\N	\N	\N	Major Bank	Kaneshie market	Yes	5.0000	\N	\N	\N	Saturday	0.0000	Western Union	\N	tiGO
294	0101000020E61000003D2B4D0797C6CEBF8E7F080EE6891640	rgiservices@yahoo.com	\N	ROYAL GOLDEN MICROFINANCE	Other	Mile 7	No	0.0000	P.O Box CT 2551 cantoment	0302998358	\N	No	0.0000	None	None	None
295	0101000020E6100000DEC48513905AD0BF2C24D7922C4F1640	bsicghana@bsic.com.gh	www.bsic.com.gh	SAHEL SAHARA	Major Bank	Darkuman	Yes	0.0000	P.O Box Ct 1732 cantonment accra	02302302471	0302234490	No	0.0000	Western Union & MoneyGram	VISA	\N
296	0101000020E6100000AA7DC9BDB4C7CEBF05FD6A52198A1640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	Achimota Mile 7	Yes	0.0000	\N	0302213999	\N	Saturday	24.0000	Western Union, MoneyGram,Vigo	MasterCard	MTN
297	0101000020E6100000706828B02F5BD0BF7E775B6F8F4E1640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	Darkuman	Yes	0.0000	\N	(233)302213999	\N	Saturday	0.0000	Western Union	MasterCard	\N
298	0101000020E61000002AC0D413EE95D0BF39FE3D3B6B821640	goshen.iseagle@gmail.com	www.goshen.com	GOSHEN INVESTMENTS SOLUTION	Other	Alhaji	No	1.5000	MS465, mile7, Accra	0248195113	\N	No	15.0000	None	None	MTN
299	0101000020E61000008EAACC95C15BD0BF6D257326714E1640	Info@micaidgh.com	www.micaidgh.com	MICAIDGH MICROFINANCE	Savings and Loans	Darkuman	No	6.0000	\N	0577667060	0302310888	No	0.0000	\N	None	None
300	0101000020E6100000F0FEE1310A59D0BF3376CCEE6B4E1640	\N	www.unibank.com	UNI BANK	Major Bank	Darkuman	Yes	7.0000	\N	\N	\N	Saturday	0.0000	Western Union & MoneyGram	VISA	\N
301	0101000020E61000008602690C3D5ED0BFD8256E6F8E811640	leapcredit@yahoo.com	\N	LEAP CREDIT	Other	chantan	No	5.0000	P.O Box 722,Nsawam	0574101468	0302423231	No	16.5000	None	None	MTN
302	0101000020E61000000285E3BB125ECFBF69BC6D9FC58B1640	startwealth gh. com	\N	STAR WEALTH MICROFINANCE	Other	New Achimota	No	4.0000	P.O Box AT 438  Achimota	0242960240	\N	No	0.0000	None	None	MTN
303	0101000020E6100000B4D4F75B9CE4CFBFD94CE84022961640	customerservice@gcb.com.gh	www.gcb.com.gh	GHANA COMMERCIAL BANK	Major Bank	Tantra Hills	Yes	24.0000	pmb achimota	0302412822,0202015795	\N	No	23.0000	Western Union, MoneyGram,Vigo	MasterCard, VISA, GH Link	MTN
304	0101000020E6100000B55FE41589CBCFBFED22FFEAFF941640	info@citizenfinancegh.com	www.citizenfinancegh.com	CITIZEN FINANCE	Savings and Loans	Tantra Hills	No	6.0000	P.O Box AT 2118,Accra	\N	\N	No	0.0000	None	None	MTN
305	0101000020E6100000C5C91DECF125CABFDC79765F71EC1640	info@abokobiarearuralbank.com	www.abokobiarearuralbank.com	ABOKOBI AREA RURAL BANK	Rural and Community Bank	Abokobi	No	30.0000	\N	028 9113050	\N	No	25.0000	Western Union & MoneyGram	None	\N
306	0101000020E610000037681E34AFD6C8BFC54C05DD69BE1640	info@beigecapital.com	www.beigecapital.com	BEIGE CAPITAL  S&L	Savings and Loans	Agbogba	No	6.9000	\N	\N	\N	No	0.0000	Western Union, MoneyGram,Vigo	None	MTN
307	0101000020E6100000B57E4D697DA4C9BFB66A158BBDAB1640	info@myfidelitybank.net	www.fidelitybank.com.gh	FIDELITY BANK	Major Bank	Haatso	Yes	30.1000	Pmb 43, Cantomen	0302 214490	0302 678868	Saturday	26.7100	Western Union, MoneyGram,Vigo	VISA	MTN
308	0101000020E6100000B478C322528DCEBF3D1ED933FDA91640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	Kwabenya	Yes	29.0000	\N	0302 213999	\N	Saturday	23.0000	Western Union, MoneyGram,Vigo	MasterCard	\N
309	0101000020E610000062DDFE63698ECEBF1514435BE9A91640	ghmystic@yahoo.com	\N	SAFE CREDIT	Other	Kwabenya	No	0.0000	\N	0240415502	\N	\N	0.0000	\N	None	None
310	0101000020E6100000B53D1025318ECEBF5A1530B7D4A91640	evecapital@yahoo.com	\N	EVE CAPITAL	Other	Kwabenya	No	150.0000	P.O Box 16570, Accra-north	0273975168	\N	No	0.0000	None	None	\N
311	0101000020E6100000B630B8A49090CEBF8D8F746D9BAA1640	evercomersgh@gmsil.com	\N	OVERCOMERS CAPITAL	Other	Kwabenya	No	30.0000	\N	0204796373	\N	No	0.0000	None	None	None
312	0101000020E610000046F2BFAE9966CEBF2FB50E4BCCA41640	info@themgigroup.com	www.themgigroup.com	M G I MICROFINANCE LTD	Other	Dome	No	0.0000	\N	0280002098	\N	No	0.0000	None	None	None
313	0101000020E6100000A5464E7F9766CEBF6089335F66A41640	customerservice@gcb.com.gh	www.gcb.com.gh	GHANA COMMERCIAL BANK	Major Bank	Dome	Yes	29.0000	\N	0302430039-40	\N	No	19.8600	Western Union & MoneyGram	GH Link	None
314	0101000020E61000004BBD0B25AF5FCEBF01B4298F5EA41640	voa.fslgh@gmail.com	www.voamicrofinance .com	VOA MICROFINANCE	Other	Dome	No	5.0000	P.O Box kn 923, kaneshie	0208502944	\N	No	0.0000	None	None	None
315	0101000020E610000079D6BB957B6BCEBF9957143824A11640	\N	\N	\N	Major Bank	Dome	Yes	30.0000	\N	0302418787	0302418789	No	21.7400	\N	VISA	None
316	0101000020E6100000E2EC145BC768CEBF96F67B4B3D941640	\N	\N	ADEHYEMAN SAVINGS AND LOANS	Savings and Loans	Dome mrkt	No	5.0000	\N	\N	\N	No	0.0000	None	None	None
317	0101000020E6100000103678A92B6AC5BF623DD99E6EDB1640	info@myfidelitybank.net	www.fidelitybank.com.gh	FIDELITY BANK	Major Bank	Adenta	Yes	26.7400	\N	+233244803670	\N	No	26.7400	Western Union & MoneyGram	VISA & GH Link	MTN
318	0101000020E61000000BB632B9DC05C8BF8797506DCB931640	\N	\N	\N	Major Bank	Madina	Yes	0.0000	\N	\N	\N	Saturday	0.0000	\N	\N	\N
319	0101000020E61000008820E0157E26C5BF8050F9DBC9D21640	\N	\N	ABOKOBMI AREA RURAL BANK LTD.	Rural and Community Bank	Adenta	No	0.0000	\N	+233302939924	\N	No	0.0000	Western Union & MoneyGram	\N	\N
320	0101000020E610000024111CBC45F2C2BFEA187FBFB6D21640	customerservice@gcb.com.gh	www.gcb.com.gh	GHANA COMMERCIAL BANK	Major Bank	Adenta	Yes	0.0000	P.O BOX AF 2070, Adenta	+233302522541	+233302522542	No	22.7500	Western Union, MoneyGram,Vigo	MasterCard, VISA, GH Link	None
321	0101000020E6100000F63A4CF2A286C6BF49D92F0D80AD1640	info@manyaruralbank.com	www.manyaruralbank.com	MANYA RURALBANK	Rural and Community Bank	manya rural bank	No	0.0000	\N	0302531593	\N	No	0.0000	Western Union & MoneyGram	None	None
322	0101000020E61000003DA3A21979B4C4BF68DD7051F4B01640	\N	www.bsic.com.gh	SAHEL-SAHARA BANK	Major Bank	madina	Yes	4.0000	\N	0302242861/080010079	\N	Saturday	27.3500	Western Union & MoneyGram	VISA	\N
323	0101000020E6100000955335B84723C3BF27BED72501D31640	\N	www.beigecapital.com	BEIGE CAPITAL	Major Bank	Adenta	No	8.0000	\N	\N	\N	No	0.0000	Western Union, MoneyGram,Vigo	\N	MTN
324	0101000020E6100000B6749A768BC0C4BFC2B6CE41A8B41640	bsicghana@bsic.com.gh	www.bsic.com.gh	SAHEL-SAHARA BANK	Major Bank	MADINA	Yes	4.0000	P.O Box CT 1732 CANTOMENTS ACCRA	0302 522374	0302234490	Saturday	27.3100	Western Union & MoneyGram	VISA	None
325	0101000020E610000034656C731288C6BF5D86CB6E6BAF1640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	madina	Yes	24.0780	\N	233302213999	\N	No	21.0030	Western Union & MoneyGram	MasterCard	\N
326	0101000020E61000001AAA251A2914C4BF8B5A820A826B1640	\N	\N	\N	Major Bank	\N	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
327	0101000020E61000002DAE72AB9DBCC4BF6A1C43AE0DAD1640	info@speedmicrofinance.com	www.speedmicrofinace.com	SPEED MICRO FINANCE	Savings and Loans	madina	No	8.0000	P.O Box CT 9169, MADINA ACCRA	0302984515	\N	No	0.0000	None	\N	\N
328	0101000020E6100000B1BF8D7DA08ACABFE17E89C096421640	farrar.bo@boaghana.com	www.boaghana.com	BANK OF AFRICA	Major Bank	Adabraka	Yes	3.0000	P.O. BOX C1541. Cantoment, Accra	+233 302 249690	+233 302 249 697	Saturday	0.0000	Western Union	VISA	MTN
329	0101000020E61000002DAE72AB9DBCC4BF6A1C43AE0DAD1640	info@haubins.com	www.haubins.com	HAUBINS COMPANY	Savings and Loans	MADINA	No	6.0000	P.O Box KIA 9525 ACCRA	0302505342	\N	No	0.0000	\N	\N	\N
330	0101000020E6100000570C7DCDFF6DC6BFD8D7D9726CAF1640	\N	www.standardchartered.com/gh	STANDARD CHARTERED	Major Bank	Madina	\N	27.9500	\N	+233289546065	\N	\N	27.9500	None	VISA & GH Link	\N
331	0101000020E610000042FBD20F1C68C6BF82F8222BBFAF1640	ssgghana.info@socgen.com	www.societygenerale.com.gh	SG-SSB	Major Bank	Madina	Yes	0.0000	\N	\N	\N	\N	21.0000	\N	MasterCard, VISA, GH Link	\N
332	0101000020E6100000078CDD2A6102CEBF9BD53B719D411640	jbiney@agricbank.com	www.adb.com.gh	AGRICULTURAL DEVELOPMENT BANK	Major Bank	Kaneshie	Yes	0.0000	P.O Box 4191 Accra	+23302688400	+233302688400	Sunday	24.9100	Western Union, MoneyGram,Vigo	VISA & GH Link	MTN
333	0101000020E610000000E7DD4910F9CDBF003270FEA3411640	sgghana.info@socgen.com	www.societegenerale.com.gh	SG-SSB	Major Bank	kaneshie	Yes	5.2000	P.O Box 13119 Ringroad Central Accra	03002214314	\N	Saturday	21.0000	Western Union & MoneyGram	MasterCard, VISA, GH Link	\N
334	0101000020E610000044239D643CB9CDBFBB6A828538401640	info@bostonpremiergroup.com	www.bostonpremiergroup.com	BOSTON PREMIER GROUP	Other	Abossey Okai	No	72.0000	P.O Box AN 15076. Dome. Accra	03002631066	0302432627	No	0.0000	None	\N	\N
335	0101000020E61000007F8D0010E1ACCDBF05902EAF0D401640	cicghana@ubagroup.com	www.ubagroup.com	UNITED BANK OF AFRICA	Major Bank	Kaneshie	Yes	3.0000	PMB 29. Ministries. Accra. Ghana	0302683526	0302680666	Saturday	23.9300	None	VISA & GH Link	MTN
336	0101000020E61000006E6D19F2B9A6CDBFB7B958B0F33F1640	info@myfidelitybank.net	www.fidelitybank.com.gh	FIDELITY BANK	Major Bank	Abossey Okai	Yes	3.0000	PMB. 43 Cantoment Accra	+23321679352	233302678868	Saturday	26.7000	Western Union & MoneyGram	MasterCard, VISA, GH Link	MTN
337	0101000020E61000003C1DABBAF3A2CDBFC7471022E13F1640	info@ghana.accessbankplc.com	www.accessbankplc.com	ACCESS BANK	Major Bank	Abossey Okai	Yes	3.0000	P.O Box GP 353. Accra	0302742699	0302742699	Saturday	0.0000	Western Union & MoneyGram	\N	MTN
338	0101000020E610000033CB6CB3FC63CEBF1B42CE87EA3F1640	\N	\N	EZI SAVINGS AND LOANS	Savings and Loans	Kaneshie	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
339	0101000020E6100000655757DCEF0ECEBFF1C4011BF8411640	info@ezisavings.com	www.ezisavings.com	EZI SAVINGS AND LOANS	Savings and Loans	Kaneshie	Yes	22.0000	P.O Box 5261. Accra	0302689387	0302666985	Saturday	0.0000	Western Union & MoneyGram	VISA	\N
340	0101000020E6100000D486E2C04B3ACEBFB61D1651D0421640	uptimahse@gmail.com	\N	UPTIMA CREDIT AND MICROFINANCE HOUSE	Other	Kaneshie Branch	No	14.0000	P.O Box SK 980. Sakumono	0303313166	\N	No	0.0000	None	None	\N
341	0101000020E6100000A6368A145B41CEBFA643CF9CAC421640	adwenepamicrofinance@yahoo.com	www.adwenepafinance.com	ADWENEPA  MICROFINANCE LIMITED	Other	Kaneshie	No	24.0000	P.O Box 7555. Accra-North	0302192959	\N	No	0.0000	None	None	\N
342	0101000020E6100000686E51324364CEBF9D340D4E87431640	info@procredit.com	www.processor.com	PROCREDIT	Savings and Loans	Kaneshie branch	Yes	37.6000	P.O Box NT 328, New Town. Accra	0207113399	+233302775809	Saturday	0.0000	None	None	\N
343	0101000020E61000009473D7D5B2C2CEBFF23C74F15F451640	multimmf@yahoo.com	www.multimoneygh.com	MULTI MONEY MICROFINANCE. LTD	Savings and Loans	kaneshie	No	30.0000	\N	0302328451	\N	No	0.0000	None	None	\N
344	0101000020E6100000684F78D84937CFBF3633276231431640	info@progressivemicrofinance.co.uk	www.progressivemicrofinance.co.uk	PROGRESSIVE MICROFINANCE COMPANY LIMITED	Other	Kaneshie Branch	No	60.0000	P.O.Box AT 315, Achimota-Accra	233289152525	\N	No	0.0000	None	None	\N
345	0101000020E6100000B7D104EF1E01D0BF45332754374B1640	\N	www.barclays.com/africa/ghana	BARCLAYS BANK	Major Bank	Darkuman Branch	Yes	0.0000	P.O Box 2949. Accra	0302672919	\N	\N	19.9200	\N	MasterCard	\N
346	0101000020E6100000E20E4DCB0239D0BFBB6C8C592C471640	info@capitalline.com	www.capitallinegroup.com	CAPITAL LINE MICROFINANCE	Savings and Loans	mateheko	No	72.0000	P.O Box DS 1628 Accra	0307033448	\N	No	0.0000	None	None	MTN
347	0101000020E61000007ABAA0D29B77CDBFCC60CCEFCC5C1640	info@theroyalbank.com.gh	www.theroyalbank.com.gh	THE ROYAL BANK	Major Bank	North Industrial Area	Yes	0.0000	P.O Box CT 8134, Cantoments-Accra	0302213561-4	0302213567	No	0.0000	\N	VISA	\N
348	0101000020E6100000F3BF0B709541CDBF59584EF941511640	service.excellence@barclays.com	www.barclays.com/africa/ghana	BARCLAYS BANK	Major Bank	North Kaneshie	Yes	0.0000	\N	0302429150	\N	Saturday	0.0000	\N	MasterCard	\N
349	0101000020E6100000B76FC8102CB3CCBFA789A43EAD541640	\N	www.utbankghana.com	UT BANK	Major Bank	North Industrial Area	Yes	0.0000	\N	0202114848	\N	Saturday	25.9000	Western Union & MoneyGram	\N	\N
350	0101000020E610000005402DBD783CC6BF548A76ECF1B31640	info@ezisavings.com	\N	EZI SAVINGS AND LOANS	Savings and Loans	madina	Yes	5.0000	P.O Box 5261,accra-north	0302511522/0243690287	0302503220	No	0.0000	Western Union	None	\N
351	0101000020E6100000A67C867FF132C6BF2668FAB7ECB41640	\N	www.gtbghana.com	GUARANTY TRUST BANK	Major Bank	madina	Yes	25.0000	\N	\N	\N	No	25.4600	Western Union, MoneyGram,Vigo	MasterCard, VISA, GH Link	MTN
352	0101000020E6100000FDF3219D3526C6BF6E4DA61EE3B51640	inbanking@prudentialbank.com.gh	www.prudentialbank.com.gh	PRUDENTIAL BANK	Major Bank	madina	Yes	0.0000	\N	0244235900 / 028183741	\N	Saturday	27.5800	Western Union, MoneyGram,Vigo	VISA	None
353	0101000020E6100000FF4599DEFCE1C5BF35D63E64F5B51640	\N	www.beigecapital.com	BEIGE CAPITAL	Savings and Loans	madina	No	4.0000	\N	030220844	\N	No	0.0000	Western Union	\N	MTN
354	0101000020E6100000B7F09C1C65CCC5BFC91D6587ECB51640	\N	\N	MULTI CREDIT	Savings and Loans	madina	No	4.0000	\N	03022037418	0322037420	No	0.0000	MoneyGram	None	MTN
355	0101000020E6100000D81BEBF17EC0C5BF73445D5C1FB61640	\N	www.midland.com.gh	MIDLAND SAVINGS AND LOANS	Savings and Loans	madina	No	5.0000	zion hous QIC road. No.1 Nii Yamoah	0307099860	\N	Saturday	0.0000	Western Union	None	MTN
356	0101000020E61000007DE15B7AD9BFC5BF18A607CF1EB61640	\N	\N	OYIBI RURAL BANK	Rural and Community Bank	madina	No	5.5000	madina ,old road	0232073163 / 0302958832	\N	No	0.0000	Western Union, MoneyGram,Vigo	None	\N
357	0101000020E6100000538F3ED006B3C5BF1504B293D6B61640	\N	www.procredit.com.gh	PROCREDIT	Savings and Loans	madina	Yes	4.5000	\N	0302775830 / 0302775846	\N	No	26.0000	None	\N	\N
358	0101000020E61000009374437C549AC5BF4F3EE01EC8B51640	\N	www.firstalliedghana.com	FIRST ALLIED SAVING AND LOANS LTD	Savings and Loans	Madina	No	8.0000	madina police station	030252258/85	0302522495	Saturday	0.0000	Western Union & MoneyGram	None	None
359	0101000020E6100000AE2A74699077C5BF7103BDAC24B61640	service.excellence@barclays.com	www.barclays.com/africa/ghana	BARCLAYS BANK	Major Bank	madina	Yes	0.0000	\N	23330683512	\N	No	19.9211	None	MasterCard & VISA	\N
360	0101000020E610000013B0FA700273C5BF7B1CAE18DBB51640	customerservice@hfcbank.com.gh	www.hfcbank.com.gh	HFC BANK	Major Bank	madina	Yes	4.0000	\N	0285085539	\N	\N	27.6400	Western Union & MoneyGram	None	\N
361	0101000020E610000049EDD67E565FC5BF2974D1A911B61640	\N	www.unibankghana.coym	UNIBANK	Major Bank	madina	Yes	7.0000	\N	080010055	\N	No	31.1100	Western Union	None	None
362	0101000020E61000005F8875ADC436C5BFE1C3BB65EAB51640	\N	www.womensworldgh.com	WOMEN'S WORLD BANKING GHANA	Major Bank	madina	Yes	3.8000	\N	0263754527	\N	Saturday	0.0000	Western Union	None	\N
363	0101000020E61000003BAB10D4721AC5BF1DCC3498E0B51640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	madina	Yes	24.0800	\N	0302681146	\N	Saturday	21.0078	Western Union, MoneyGram,Vigo	MasterCard, VISA, GH Link	None
364	0101000020E61000008189B17CEF28C6BFC26DBBFFB2B61640	\N	\N	\N	Savings and Loans	madina	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
365	0101000020E610000034834913DC28C6BF4F32A020B0B61640	\N	www.stanbic.com.gh	STANBIC BANK	Major Bank	madina	No	25.0000	\N	08001009	\N	Saturday	20.9200	MoneyGram	\N	\N
366	0101000020E6100000D84DDCD21D28C6BFB67907CAB7B61640	\N	\N	\N	Major Bank	madina	Yes	19.2000	\N	080010034	\N	Saturday	24.0000	Western Union & MoneyGram	VISA & GH Link	\N
367	0101000020E6100000579CF4D48C1DC6BF841133BA40B71640	\N	www.boaghana.com	BANK OF AFRICA	Major Bank	madina	Yes	3.0000	\N	0302769634 / 030276958	\N	Saturday	0.0000	Western Union	None	None
368	0101000020E6100000615CE47D596CC6BF755217F75D901640	\N	\N	\N	Major Bank	Okponglo	Yes	0.0000	\N	\N	\N	\N	0.0000	Western Union & MoneyGram	\N	\N
369	0101000020E61000007AC5B933D00AC6BF9D3B8DE56F8A1640	Sme.serviceghana@sc.com	www.sc.com/gh	STANDARD CHARTERED	Major Bank	\N	Yes	0.0000	\N	0307011709	\N	Saturday	0.0000	\N	MasterCard & VISA	\N
370	0101000020E610000002357871500AC6BFC1788E066C891640	\N	\N	\N	Major Bank	East legon	No	0.0000	\N	\N	\N	\N	0.0000	Western Union & MoneyGram	\N	\N
371	0101000020E6100000E5ED4CA55A12C6BFD8AAE42961881640	\N	\N	\N	Major Bank	East legon	Yes	0.0000	\N	\N	\N	\N	0.0000	Western Union	VISA & GH Link	MTN
372	0101000020E61000002719F4B58B0BC6BF21F96382BB881640	\N	\N	\N	Major Bank	\N	Yes	0.0000	\N	\N	\N	\N	0.0000	MoneyGram	MasterCard, VISA, GH Link	MTN
373	0101000020E610000021ED19EBF913C6BF9B743F2FF8871640	\N	\N	\N	Major Bank	East legon	Yes	0.0000	\N	\N	\N	\N	0.0000	MoneyGram	MasterCard, VISA, GH Link	\N
374	0101000020E6100000C88A1411E34BC5BF2FF70338868F1640	\N	\N	\N	Major Bank	East Legon	\N	0.0000	\N	\N	\N	\N	0.0000	None	VISA	MTN
375	0101000020E610000084AFC995571EC6BFCAB529682DB71640	customerservice@gcb.com.gh	www.gcb.com.gh	GHANA COMMERCIAL BANK	Major Bank	Madina	\N	4.0000	\N	0302673637	\N	No	18.8900	Western Union & MoneyGram	MasterCard, VISA, GH Link	\N
376	0101000020E61000008A381D9C7D1EC6BF3A80B4382BB71640	\N	\N	\N	Savings and Loans	madina	No	9.5000	\N	0302233570	\N	No	0.0000	\N	None	\N
377	0101000020E61000001F2441E93336CEBF74CC9A43C3431640	info@eb-accion.com	www.eb-accion.com	EB ACCION	Savings and Loans	Kaneshie (Market)	No	0.0000	P.O Box CT 127, Cantoments	0302782750/1	0302782755	Saturday	0.0000	Western Union & MoneyGram	\N	\N
378	0101000020E61000004FD423591935CEBFE233F264E7431640	customerservice@gcb.com.gh	www.gcb.com.gh	GHANA COMMERCIAL BANK	Major Bank	Kaneshie	Yes	0.0000	\N	0302246025	\N	No	0.0000	MoneyGram	MasterCard, VISA, GH Link	\N
379	0101000020E610000000D97C4FE332CEBFDC0C74B161441640	info@ghana.accessbankplc.com	www.accessbankplc.com/gh	ACCESS BANK	Major Bank	Kaneshie	Yes	0.0000	P.O Box GP 353, Accra	0302742699/0244344222	\N	\N	0.0000	Western Union & MoneyGram	MasterCard	MTN
380	0101000020E6100000A60CBABA4852CEBF6DA17C4F22441640	\N	www.wwbg.com.gh	WOMEN'S WORLD BANKING GHANA	Savings and Loans	Kaneshie	Yes	0.0000	P.O Box 2989, Accra	0302245177	0302245177	\N	0.0000	Western Union	\N	\N
381	0101000020E61000002C8424F76088CABFF49C07D6F43A1640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	Adabraka	Yes	6.5000	\N	\N	\N	Saturday	0.0000	Western Union, MoneyGram,Vigo	MasterCard	MTN
382	0101000020E61000003E4853FF868BCABF3BD5F9AFBA421640	\N	www.blue.co.za	BLUE FINANZIA SERVICES	Other	Adabraka	No	2.0000	PUB CT325 Cantonment,Accra	+233 302 263 194	+233 302 243 065	Saturday	0.0000	\N	\N	\N
383	0101000020E6100000E9A90300B48BCABF52EA00D8B0421640	\N	www.blue.co.za	BLUE FINANZIA SERVICES	Savings and Loans	Adabraka	No	2.0000	PMB CT 325 Cantoment,Accra	+233 289 104 593	+233 302 243 065	Saturday	0.0000	None	None	\N
384	0101000020E610000009D32600C589CABF81C9F967A8421640	Capital@semcapitalgh.com	www.semcapitalgh.com	SEM CAPITAL MANAGEMENT LIMITED	Savings and Loans	Adabraka, ferrari avenue	No	2.0000	\N	0302 238 382	\N	Saturday	0.0000	None	None	\N
385	0101000020E610000029D22400C769CABFCEF30060C0411640	\N	www.diamondcapital.com.gh	DIAMOND CAPITAL	Savings and Loans	Asylum-Down	No	5.0000	P.O Box GP 167, Asylum Down -Accra	030 2230 010	\N	No	0.0000	Western Union, MoneyGram,Vigo	None	\N
386	0101000020E6100000C1F2AE00AB3ACABF56B0FF7794461640	info@firstnationalghana.com	www.firstnationalghana.com	FIRST NATIONAL GHANA BANK	Savings and Loans	Asylum Down	Yes	8.0000	\N	030 221 8855	\N	Saturday	0.0000	Western Union, MoneyGram,Vigo	VISA	\N
387	0101000020E6100000FFD6E3078BABC7BF0B93BED7D5921640	\N	\N	\N	Major Bank	legon	Yes	22.4000	\N	\N	\N	Saturday	22.4000	Western Union & MoneyGram	MasterCard	None
388	0101000020E61000009B2D53FCA204C8BF90B563DECC931640	\N	\N	EXPRESS SAVINGS AND LOANS	Other	Madina	No	0.0000	\N	\N	\N	No	0.0000	Other	\N	\N
389	0101000020E6100000F232919F48E6BFBF0D52A4C222901640	\N	\N	\N	Major Bank	spintex	Yes	0.0000	\N	\N	\N	Saturday	0.0000	\N	MasterCard	\N
390	0101000020E6100000F232919F48E6BFBF0D52A4C222901640	\N	\N	\N	Major Bank	spintex	\N	0.0000	\N	\N	\N	No	0.0000	\N	MasterCard	\N
391	0101000020E6100000EE88A7E24389BABFB399768BF9891640	\N	www.societegenerale.com.gh	SG-SSB	Major Bank	\N	Yes	0.0000	\N	030934970	\N	Saturday	0.0000	Western Union & MoneyGram	VISA & GH Link	\N
392	0101000020E6100000CE72FCAB39F6BABFA4C251CDF68A1640	\N	\N	\N	Other	spintex	No	0.0000	\N	\N	\N	No	0.0000	\N	None	\N
393	0101000020E6100000715A4C293163BBBF2905300FF48B1640	\N	\N	SIM MICROFINANCE	Other	spintex	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
394	0101000020E6100000715A4C293163BBBF2905300FF48B1640	\N	\N	\N	Major Bank	spintex	Yes	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
395	0101000020E6100000715A4C293163BBBF2905300FF48B1640	\N	\N	\N	Major Bank	\N	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
396	0101000020E61000007254145A2A46BBBF1381E84B3D8C1640	info@myfidelitybank.net	www.fidelitybank.com.gh	FIDELITY BANK	Major Bank	spintex	\N	0.0000	\N	\N	\N	Saturday	0.0000	Western Union & MoneyGram	MasterCard	MTN
397	0101000020E6100000CC8BD2549FCBBABFAF46C552138B1640	spintex.bo@boaghana.com	www.boaghana.com	BANK OF AFRICA	Major Bank	spintex road	Yes	0.0000	PMB 269 Tema baatsona spintex road.	0302868401	030286847	No	0.0000	Western Union & MoneyGram	MasterCard	\N
398	0101000020E61000000D4D7E1EAE30B8BFC4C21C894D8A1640	\N	\N	\N	Major Bank	\N	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
399	0101000020E61000000D4D7E1EAE30B8BFC4C21C894D8A1640	\N	\N	\N	Major Bank	\N	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
400	0101000020E610000097D26028F812B9BFBFC2A325FB891640	\N	\N	\N	Major Bank	\N	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
401	0101000020E6100000383173ADB310B7BF360E0FDC15851640	\N	\N	\N	Major Bank	\N	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
402	0101000020E610000068607807C646B7BF594700C446841640	\N	\N	\N	Major Bank	spintex	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
403	0101000020E61000005A64C2312A34B7BF5B9262FA72841640	\N	\N	\N	Major Bank	spintex	Yes	0.0000	\N	\N	\N	\N	0.0000	\N	MasterCard & VISA	\N
404	0101000020E6100000B38696A82007B7BFC08F6E6EF0831640	\N	\N	\N	Major Bank	spintex	Yes	0.0000	\N	\N	\N	\N	0.0000	MoneyGram	MasterCard	\N
405	0101000020E6100000E6838399EBBDB6BF705D2FF1C3831640	\N	\N	\N	Major Bank	spintex	Yes	0.0000	\N	\N	\N	No	0.0000	MoneyGram	VISA & GH Link	MTN
406	0101000020E61000004160CC207DB7B6BF6FD2DF10B4831640	ecobankenquiries@ecobank.com	www.ecobank.com	ECOBANK	Major Bank	batsona	Yes	0.0000	\N	\N	\N	Saturday	0.0000	\N	MasterCard	\N
407	0101000020E61000003836F2BD8AE8B5BFE77D52BA0B821640	\N	\N	\N	Major Bank	batsona	Yes	0.0000	\N	\N	\N	\N	0.0000	MoneyGram	MasterCard	\N
408	0101000020E61000001E93549D89C9B5BF24622D60E4811640	\N	\N	\N	Major Bank	batsona	Yes	0.0000	\N	\N	\N	\N	0.0000	Western Union & MoneyGram	MasterCard	\N
409	0101000020E6100000CB95887A89CCB5BFA62C9163EC811640	\N	\N	UNIVERSAL MERCHANT BANK	Major Bank	batsona	Yes	0.0000	\N	\N	\N	\N	0.0000	\N	MasterCard	\N
410	0101000020E610000002924A991D6BB6BFE6CD411C13831640	\N	\N	UNIVERSAL MERCHANT BANK	Major Bank	batsona total	Yes	0.0000	\N	\N	\N	\N	0.0000	\N	MasterCard	\N
411	0101000020E61000004E2A0519270CC9BF206DBD89FA5D1640	\N	\N	\N	\N	\N	\N	0.0000	\N	\N	\N	\N	0.0000	\N	\N	\N
\.


--
-- TOC entry 4021 (class 0 OID 181025)
-- Dependencies: 225
-- Data for Name: customer_wallet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_wallet (id, account_type, bank_branch, account_balance, customer_fk_id) FROM stdin;
\.


--
-- TOC entry 4025 (class 0 OID 181088)
-- Dependencies: 229
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 4007 (class 0 OID 180934)
-- Dependencies: 211
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	banks	customer
7	banks	customerwallet
8	banks	history
9	blacklist	blacklistedtoken
10	banks	bnks
\.


--
-- TOC entry 4005 (class 0 OID 180923)
-- Dependencies: 209
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-03-15 22:48:07.356333+00
2	contenttypes	0002_remove_content_type_name	2022-03-15 22:48:07.388248+00
3	auth	0001_initial	2022-03-15 22:48:07.527543+00
4	auth	0002_alter_permission_name_max_length	2022-03-15 22:48:07.735057+00
5	auth	0003_alter_user_email_max_length	2022-03-15 22:48:07.778422+00
6	auth	0004_alter_user_username_opts	2022-03-15 22:48:07.798618+00
7	auth	0005_alter_user_last_login_null	2022-03-15 22:48:07.814859+00
8	auth	0006_require_contenttypes_0002	2022-03-15 22:48:07.829576+00
9	auth	0007_alter_validators_add_error_messages	2022-03-15 22:48:07.845034+00
10	auth	0008_alter_user_username_max_length	2022-03-15 22:48:07.856397+00
11	auth	0009_alter_user_last_name_max_length	2022-03-15 22:48:07.86797+00
12	auth	0010_alter_group_name_max_length	2022-03-15 22:48:07.881117+00
13	auth	0011_update_proxy_permissions	2022-03-15 22:48:07.903316+00
14	banks	0001_initial	2022-03-15 22:48:08.179138+00
15	admin	0001_initial	2022-03-15 22:48:08.500891+00
16	admin	0002_logentry_remove_auto_add	2022-03-15 22:48:08.592719+00
17	admin	0003_logentry_add_action_flag_choices	2022-03-15 22:48:08.62087+00
18	blacklist	0001_initial	2022-03-15 22:48:08.691443+00
19	blacklist	0002_add_token_id	2022-03-15 22:48:08.838683+00
20	sessions	0001_initial	2022-03-15 22:48:08.916619+00
21	banks	0002_auto_20220315_2253	2022-03-15 22:53:59.430819+00
22	banks	0003_auto_20220315_2304	2022-03-15 23:04:36.028706+00
23	banks	0004_auto_20220315_2305	2022-03-15 23:06:03.100187+00
\.


--
-- TOC entry 4028 (class 0 OID 181132)
-- Dependencies: 232
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- TOC entry 3777 (class 0 OID 180213)
-- Dependencies: 204
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 4050 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 4051 (class 0 OID 0)
-- Dependencies: 216
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 4052 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- TOC entry 4053 (class 0 OID 0)
-- Dependencies: 220
-- Name: banks_customer_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banks_customer_groups_id_seq', 1, false);


--
-- TOC entry 4054 (class 0 OID 0)
-- Dependencies: 218
-- Name: banks_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banks_customer_id_seq', 7, true);


--
-- TOC entry 4055 (class 0 OID 0)
-- Dependencies: 222
-- Name: banks_customer_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banks_customer_user_permissions_id_seq', 1, false);


--
-- TOC entry 4056 (class 0 OID 0)
-- Dependencies: 226
-- Name: banks_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banks_history_id_seq', 1, false);


--
-- TOC entry 4057 (class 0 OID 0)
-- Dependencies: 230
-- Name: blacklist_blacklistedtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blacklist_blacklistedtoken_id_seq', 1, false);


--
-- TOC entry 4058 (class 0 OID 0)
-- Dependencies: 233
-- Name: bnks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bnks_id_seq', 411, true);


--
-- TOC entry 4059 (class 0 OID 0)
-- Dependencies: 224
-- Name: customer_wallet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_wallet_id_seq', 1, false);


--
-- TOC entry 4060 (class 0 OID 0)
-- Dependencies: 228
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 4061 (class 0 OID 0)
-- Dependencies: 210
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- TOC entry 4062 (class 0 OID 0)
-- Dependencies: 208
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- TOC entry 3809 (class 2606 OID 180992)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 3814 (class 2606 OID 180978)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 3817 (class 2606 OID 180967)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3811 (class 2606 OID 180957)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3804 (class 2606 OID 180969)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 3806 (class 2606 OID 180949)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3820 (class 2606 OID 181006)
-- Name: banks_customer banks_customer_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks_customer
    ADD CONSTRAINT banks_customer_email_key UNIQUE (email);


--
-- TOC entry 3825 (class 2606 OID 181041)
-- Name: banks_customer_groups banks_customer_groups_customer_id_group_id_103d3a02_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks_customer_groups
    ADD CONSTRAINT banks_customer_groups_customer_id_group_id_103d3a02_uniq UNIQUE (customer_id, group_id);


--
-- TOC entry 3828 (class 2606 OID 181014)
-- Name: banks_customer_groups banks_customer_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks_customer_groups
    ADD CONSTRAINT banks_customer_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3822 (class 2606 OID 181004)
-- Name: banks_customer banks_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks_customer
    ADD CONSTRAINT banks_customer_pkey PRIMARY KEY (id);


--
-- TOC entry 3830 (class 2606 OID 181055)
-- Name: banks_customer_user_permissions banks_customer_user_perm_customer_id_permission_i_fa5c201c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks_customer_user_permissions
    ADD CONSTRAINT banks_customer_user_perm_customer_id_permission_i_fa5c201c_uniq UNIQUE (customer_id, permission_id);


--
-- TOC entry 3834 (class 2606 OID 181022)
-- Name: banks_customer_user_permissions banks_customer_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks_customer_user_permissions
    ADD CONSTRAINT banks_customer_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3841 (class 2606 OID 181038)
-- Name: banks_history banks_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks_history
    ADD CONSTRAINT banks_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3848 (class 2606 OID 181120)
-- Name: blacklist_blacklistedtoken blacklist_blacklistedtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blacklist_blacklistedtoken
    ADD CONSTRAINT blacklist_blacklistedtoken_pkey PRIMARY KEY (id);


--
-- TOC entry 3858 (class 2606 OID 181157)
-- Name: bnks bnks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bnks
    ADD CONSTRAINT bnks_pkey PRIMARY KEY (id);


--
-- TOC entry 3837 (class 2606 OID 181030)
-- Name: customer_wallet customer_wallet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_wallet
    ADD CONSTRAINT customer_wallet_pkey PRIMARY KEY (id);


--
-- TOC entry 3844 (class 2606 OID 181097)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3799 (class 2606 OID 180941)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 3801 (class 2606 OID 180939)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3797 (class 2606 OID 180931)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3855 (class 2606 OID 181139)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3807 (class 1259 OID 180993)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 3812 (class 1259 OID 180989)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 3815 (class 1259 OID 180990)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 3802 (class 1259 OID 180975)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 3818 (class 1259 OID 181039)
-- Name: banks_customer_email_5513ce13_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX banks_customer_email_5513ce13_like ON public.banks_customer USING btree (email varchar_pattern_ops);


--
-- TOC entry 3823 (class 1259 OID 181052)
-- Name: banks_customer_groups_customer_id_bd95e035; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX banks_customer_groups_customer_id_bd95e035 ON public.banks_customer_groups USING btree (customer_id);


--
-- TOC entry 3826 (class 1259 OID 181053)
-- Name: banks_customer_groups_group_id_42e4ab7e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX banks_customer_groups_group_id_42e4ab7e ON public.banks_customer_groups USING btree (group_id);


--
-- TOC entry 3831 (class 1259 OID 181066)
-- Name: banks_customer_user_permissions_customer_id_7aa058e9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX banks_customer_user_permissions_customer_id_7aa058e9 ON public.banks_customer_user_permissions USING btree (customer_id);


--
-- TOC entry 3832 (class 1259 OID 181067)
-- Name: banks_customer_user_permissions_permission_id_a435d1c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX banks_customer_user_permissions_permission_id_a435d1c0 ON public.banks_customer_user_permissions USING btree (permission_id);


--
-- TOC entry 3838 (class 1259 OID 181084)
-- Name: banks_history_customer_fk_id_eb95af7a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX banks_history_customer_fk_id_eb95af7a ON public.banks_history USING btree (customer_fk_id);


--
-- TOC entry 3839 (class 1259 OID 181085)
-- Name: banks_history_customer_wallet_fk_id_e3db4a1a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX banks_history_customer_wallet_fk_id_e3db4a1a ON public.banks_history USING btree (customer_wallet_fk_id);


--
-- TOC entry 3846 (class 1259 OID 181128)
-- Name: blacklist_blacklistedtoken_expires_at_8ffda1c1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blacklist_blacklistedtoken_expires_at_8ffda1c1 ON public.blacklist_blacklistedtoken USING btree (expires_at);


--
-- TOC entry 3849 (class 1259 OID 181126)
-- Name: blacklist_blacklistedtoken_token_acbfdd7e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blacklist_blacklistedtoken_token_acbfdd7e ON public.blacklist_blacklistedtoken USING btree (token);


--
-- TOC entry 3850 (class 1259 OID 181127)
-- Name: blacklist_blacklistedtoken_token_acbfdd7e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blacklist_blacklistedtoken_token_acbfdd7e_like ON public.blacklist_blacklistedtoken USING btree (token text_pattern_ops);


--
-- TOC entry 3851 (class 1259 OID 181131)
-- Name: blacklist_blacklistedtoken_token_id_aee3ed90; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blacklist_blacklistedtoken_token_id_aee3ed90 ON public.blacklist_blacklistedtoken USING btree (token_id);


--
-- TOC entry 3852 (class 1259 OID 181129)
-- Name: blacklist_blacklistedtoken_user_id_e4068fb1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blacklist_blacklistedtoken_user_id_e4068fb1 ON public.blacklist_blacklistedtoken USING btree (user_id);


--
-- TOC entry 3835 (class 1259 OID 181073)
-- Name: customer_wallet_customer_fk_id_7bb13661; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customer_wallet_customer_fk_id_7bb13661 ON public.customer_wallet USING btree (customer_fk_id);


--
-- TOC entry 3842 (class 1259 OID 181108)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 3845 (class 1259 OID 181109)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 3853 (class 1259 OID 181141)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 3856 (class 1259 OID 181140)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3859 (class 1259 OID 181161)
-- Name: sidx_bnks_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sidx_bnks_geom ON public.bnks USING gist (geom);


--
-- TOC entry 3862 (class 2606 OID 180984)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3861 (class 2606 OID 180979)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3860 (class 2606 OID 180970)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3863 (class 2606 OID 181042)
-- Name: banks_customer_groups banks_customer_groups_customer_id_bd95e035_fk_banks_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks_customer_groups
    ADD CONSTRAINT banks_customer_groups_customer_id_bd95e035_fk_banks_customer_id FOREIGN KEY (customer_id) REFERENCES public.banks_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3864 (class 2606 OID 181047)
-- Name: banks_customer_groups banks_customer_groups_group_id_42e4ab7e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks_customer_groups
    ADD CONSTRAINT banks_customer_groups_group_id_42e4ab7e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3865 (class 2606 OID 181056)
-- Name: banks_customer_user_permissions banks_customer_user__customer_id_7aa058e9_fk_banks_cus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks_customer_user_permissions
    ADD CONSTRAINT banks_customer_user__customer_id_7aa058e9_fk_banks_cus FOREIGN KEY (customer_id) REFERENCES public.banks_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3866 (class 2606 OID 181061)
-- Name: banks_customer_user_permissions banks_customer_user__permission_id_a435d1c0_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks_customer_user_permissions
    ADD CONSTRAINT banks_customer_user__permission_id_a435d1c0_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3868 (class 2606 OID 181074)
-- Name: banks_history banks_history_customer_fk_id_eb95af7a_fk_banks_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks_history
    ADD CONSTRAINT banks_history_customer_fk_id_eb95af7a_fk_banks_customer_id FOREIGN KEY (customer_fk_id) REFERENCES public.banks_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3869 (class 2606 OID 181079)
-- Name: banks_history banks_history_customer_wallet_fk_i_e3db4a1a_fk_customer_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks_history
    ADD CONSTRAINT banks_history_customer_wallet_fk_i_e3db4a1a_fk_customer_ FOREIGN KEY (customer_wallet_fk_id) REFERENCES public.customer_wallet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3872 (class 2606 OID 181121)
-- Name: blacklist_blacklistedtoken blacklist_blackliste_user_id_e4068fb1_fk_banks_cus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blacklist_blacklistedtoken
    ADD CONSTRAINT blacklist_blackliste_user_id_e4068fb1_fk_banks_cus FOREIGN KEY (user_id) REFERENCES public.banks_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3867 (class 2606 OID 181068)
-- Name: customer_wallet customer_wallet_customer_fk_id_7bb13661_fk_banks_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_wallet
    ADD CONSTRAINT customer_wallet_customer_fk_id_7bb13661_fk_banks_customer_id FOREIGN KEY (customer_fk_id) REFERENCES public.banks_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3870 (class 2606 OID 181098)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3871 (class 2606 OID 181103)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_banks_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_banks_customer_id FOREIGN KEY (user_id) REFERENCES public.banks_customer(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2022-04-02 11:07:28 GMT

--
-- PostgreSQL database dump complete
--

