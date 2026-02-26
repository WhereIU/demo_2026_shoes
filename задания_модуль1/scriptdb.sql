--
-- PostgreSQL database dump
--

\restrict zyk20ZaH1qg5iRiwBepRUr8ZGzZW39VdGLSpRLzdBFzJyHmbyaPeLG0azZcGAU4

-- Dumped from database version 14.20 (Ubuntu 14.20-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 18.1

-- Started on 2026-02-26 06:52:33

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 49295)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 49298)
-- Name: manufacturers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manufacturers (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.manufacturers OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 49301)
-- Name: order_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_statuses (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.order_statuses OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 49304)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    order_date date NOT NULL,
    delivery_date date NOT NULL,
    pickup_point_id integer NOT NULL,
    user_id integer NOT NULL,
    delivery_code integer NOT NULL,
    status_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 49307)
-- Name: pickup_points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pickup_points (
    id integer NOT NULL,
    index integer NOT NULL,
    city character varying(50) NOT NULL,
    street character varying(50) NOT NULL,
    house integer NOT NULL
);


ALTER TABLE public.pickup_points OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 49310)
-- Name: product_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_types (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.product_types OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 49313)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    article character varying(30) NOT NULL,
    product_type_id integer NOT NULL,
    unit_id integer NOT NULL,
    price numeric(9,2) NOT NULL,
    provider_id integer NOT NULL,
    manufacturer_id integer NOT NULL,
    category_id integer NOT NULL,
    current_discount numeric(5,2) NOT NULL,
    storage_count integer NOT NULL,
    description text,
    img_path character varying(255)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 49318)
-- Name: products_in_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_in_orders (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.products_in_orders OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 49321)
-- Name: providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.providers (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.providers OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 49324)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 49327)
-- Name: units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.units (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.units OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 49330)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    role_id integer NOT NULL,
    surname character varying(50) NOT NULL,
    firstname character varying(50) NOT NULL,
    patronymic character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3386 (class 0 OID 49295)
-- Dependencies: 209
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories VALUES (1, 'Мужская обувь');
INSERT INTO public.categories VALUES (2, 'Женская обувь');


--
-- TOC entry 3387 (class 0 OID 49298)
-- Dependencies: 210
-- Data for Name: manufacturers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.manufacturers VALUES (6, 'CROSBY');
INSERT INTO public.manufacturers VALUES (5, 'Alessio Nesca');
INSERT INTO public.manufacturers VALUES (1, 'Kari');
INSERT INTO public.manufacturers VALUES (4, 'Rieker');
INSERT INTO public.manufacturers VALUES (3, 'Рос');
INSERT INTO public.manufacturers VALUES (2, 'Marco Tozzi');


--
-- TOC entry 3388 (class 0 OID 49301)
-- Dependencies: 211
-- Data for Name: order_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_statuses VALUES (1, 'Завершен');
INSERT INTO public.order_statuses VALUES (2, 'Новый');


--
-- TOC entry 3389 (class 0 OID 49304)
-- Dependencies: 212
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders VALUES (1, '2025-02-27', '2025-04-20', 1, 4, 901, 1);
INSERT INTO public.orders VALUES (2, '2022-09-28', '2025-04-21', 11, 1, 902, 1);
INSERT INTO public.orders VALUES (3, '2025-03-21', '2025-04-22', 2, 2, 903, 1);
INSERT INTO public.orders VALUES (4, '2025-02-20', '2025-04-23', 11, 3, 904, 1);
INSERT INTO public.orders VALUES (5, '2025-03-17', '2025-04-24', 2, 4, 905, 1);
INSERT INTO public.orders VALUES (6, '2025-03-01', '2025-04-25', 15, 1, 906, 1);
INSERT INTO public.orders VALUES (7, '2025-02-28', '2025-04-26', 3, 2, 907, 1);
INSERT INTO public.orders VALUES (8, '2025-03-31', '2025-04-27', 19, 3, 908, 2);
INSERT INTO public.orders VALUES (9, '2025-04-02', '2025-04-28', 5, 4, 909, 2);
INSERT INTO public.orders VALUES (10, '2025-04-03', '2025-04-29', 19, 4, 910, 2);


--
-- TOC entry 3390 (class 0 OID 49307)
-- Dependencies: 213
-- Data for Name: pickup_points; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pickup_points VALUES (1, 420151, 'Лесной', 'Вишневая', 32);
INSERT INTO public.pickup_points VALUES (2, 125061, 'Лесной', 'Подгорная', 8);
INSERT INTO public.pickup_points VALUES (3, 630370, 'Лесной', 'Шоссейная', 24);
INSERT INTO public.pickup_points VALUES (4, 400562, 'Лесной', 'Зеленая', 32);
INSERT INTO public.pickup_points VALUES (5, 614510, 'Лесной', 'Маяковского', 47);
INSERT INTO public.pickup_points VALUES (6, 410542, 'Лесной', 'Светлая', 46);
INSERT INTO public.pickup_points VALUES (7, 620839, 'Лесной', 'Цветочная', 8);
INSERT INTO public.pickup_points VALUES (8, 443890, 'Лесной', 'Коммунистическая', 1);
INSERT INTO public.pickup_points VALUES (9, 603379, 'Лесной', 'Спортивная', 46);
INSERT INTO public.pickup_points VALUES (10, 603721, 'Лесной', 'Гоголя', 41);
INSERT INTO public.pickup_points VALUES (11, 410172, 'Лесной', 'Северная', 13);
INSERT INTO public.pickup_points VALUES (12, 614611, 'Лесной', 'Молодежная', 50);
INSERT INTO public.pickup_points VALUES (13, 454311, 'Лесной', 'Новая', 19);
INSERT INTO public.pickup_points VALUES (14, 660007, 'Лесной', 'Октябрьская', 19);
INSERT INTO public.pickup_points VALUES (15, 603036, 'Лесной', 'Садовая', 4);
INSERT INTO public.pickup_points VALUES (16, 394060, 'Лесной', 'Фрунзе', 43);
INSERT INTO public.pickup_points VALUES (17, 410661, 'Лесной', 'Школьная', 50);
INSERT INTO public.pickup_points VALUES (18, 625590, 'Лесной', 'Коммунистическая', 20);
INSERT INTO public.pickup_points VALUES (19, 625683, 'Лесной', 'Марта', 8);
INSERT INTO public.pickup_points VALUES (20, 450983, 'Лесной', 'Комсомольская', 26);
INSERT INTO public.pickup_points VALUES (21, 394782, 'Лесной', 'Чехова', 3);
INSERT INTO public.pickup_points VALUES (22, 603002, 'Лесной', 'Дзержинского', 28);
INSERT INTO public.pickup_points VALUES (23, 450558, 'Лесной', 'Набережная', 30);
INSERT INTO public.pickup_points VALUES (24, 344288, 'Лесной', 'Чехова', 1);
INSERT INTO public.pickup_points VALUES (25, 614164, 'Лесной', 'Степная', 30);
INSERT INTO public.pickup_points VALUES (26, 394242, 'Лесной', 'Коммунистическая', 43);
INSERT INTO public.pickup_points VALUES (27, 660540, 'Лесной', 'Солнечная', 25);
INSERT INTO public.pickup_points VALUES (28, 125837, 'Лесной', 'Шоссейная', 40);
INSERT INTO public.pickup_points VALUES (29, 125703, 'Лесной', 'Партизанская', 49);
INSERT INTO public.pickup_points VALUES (30, 625283, 'Лесной', 'Победы', 46);
INSERT INTO public.pickup_points VALUES (31, 614753, 'Лесной', 'Полевая', 35);
INSERT INTO public.pickup_points VALUES (32, 426030, 'Лесной', 'Маяковского', 44);
INSERT INTO public.pickup_points VALUES (33, 450375, 'Лесной', 'Клубная', 44);
INSERT INTO public.pickup_points VALUES (34, 625560, 'Лесной', 'Некрасова', 12);
INSERT INTO public.pickup_points VALUES (35, 630201, 'Лесной', 'Комсомольская', 17);
INSERT INTO public.pickup_points VALUES (36, 190949, 'Лесной', 'Мичурина', 26);


--
-- TOC entry 3391 (class 0 OID 49310)
-- Dependencies: 214
-- Data for Name: product_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_types VALUES (4, 'Полуботинки');
INSERT INTO public.product_types VALUES (5, 'Кеды');
INSERT INTO public.product_types VALUES (6, 'Тапочки');
INSERT INTO public.product_types VALUES (1, 'Ботинки');
INSERT INTO public.product_types VALUES (2, 'Туфли');
INSERT INTO public.product_types VALUES (3, 'Кроссовки');
INSERT INTO public.product_types VALUES (7, 'Сапоги');


--
-- TOC entry 3392 (class 0 OID 49313)
-- Dependencies: 215
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products VALUES (1, 'А112Т4', 1, 1, 4990.00, 1, 1, 2, 3.00, 6, 'Женские Ботинки демисезонные kari', '1.jpg');
INSERT INTO public.products VALUES (2, 'F635R4', 1, 1, 3244.00, 2, 2, 2, 2.00, 13, 'Ботинки Marco Tozzi женские демисезонные, размер 39, цвет бежевый', '2.jpg');
INSERT INTO public.products VALUES (3, 'H782T5', 2, 1, 4499.00, 1, 1, 1, 4.00, 5, 'Туфли kari мужские классика MYZ21AW-450A, размер 43, цвет: черный', '3.jpg');
INSERT INTO public.products VALUES (4, 'G783F5', 1, 1, 5900.00, 1, 3, 1, 2.00, 8, 'Мужские ботинки Рос-Обувь кожаные с натуральным мехом', '4.jpg');
INSERT INTO public.products VALUES (5, 'J384T6', 1, 1, 3800.00, 2, 4, 1, 2.00, 16, 'B3430/14 Полуботинки мужские Rieker', '5.jpg');
INSERT INTO public.products VALUES (6, 'D572U8', 3, 1, 4100.00, 2, 3, 1, 3.00, 6, '129615-4 Кроссовки мужские', '6.jpg');
INSERT INTO public.products VALUES (7, 'F572H7', 2, 1, 2700.00, 1, 2, 2, 2.00, 14, 'Туфли Marco Tozzi женские летние, размер 39, цвет черный', '7.jpg');
INSERT INTO public.products VALUES (8, 'D329H3', 4, 1, 1890.00, 2, 5, 2, 4.00, 4, 'Полуботинки Alessio Nesca женские 3-30797-47, размер 37, цвет: бордовый', '8.jpg');
INSERT INTO public.products VALUES (9, 'B320R5', 2, 1, 4300.00, 1, 4, 2, 2.00, 6, 'Туфли Rieker женские демисезонные, размер 41, цвет коричневый', '9.jpg');
INSERT INTO public.products VALUES (10, 'G432E4', 2, 1, 2800.00, 1, 1, 2, 3.00, 15, 'Туфли kari женские TR-YR-413017, размер 37, цвет: черный', '10.jpg');
INSERT INTO public.products VALUES (11, 'S213E3', 4, 1, 2156.00, 2, 6, 1, 3.00, 6, '407700/01-01 Полуботинки мужские CROSBY', NULL);
INSERT INTO public.products VALUES (12, 'E482R4', 4, 1, 1800.00, 1, 1, 2, 2.00, 14, 'Полуботинки kari женские MYZ20S-149, размер 41, цвет: черный', NULL);
INSERT INTO public.products VALUES (13, 'S634B5', 5, 1, 5500.00, 2, 6, 1, 3.00, 6, 'Кеды Caprice мужские демисезонные, размер 42, цвет черный', NULL);
INSERT INTO public.products VALUES (14, 'K345R4', 4, 1, 2100.00, 2, 6, 1, 2.00, 3, '407700/01-02 Полуботинки мужские CROSBY', NULL);
INSERT INTO public.products VALUES (15, 'O754F4', 2, 1, 5400.00, 2, 4, 2, 4.00, 18, 'Туфли женские демисезонные Rieker артикул 55073-68/37', NULL);
INSERT INTO public.products VALUES (16, 'G531F4', 1, 1, 6600.00, 1, 1, 2, 2.00, 9, 'Ботинки женские зимние ROMER арт. 893167-01 Черный', NULL);
INSERT INTO public.products VALUES (17, 'J542F5', 6, 1, 500.00, 1, 1, 1, 3.00, 12, 'Тапочки мужские Арт.70701-55-67син р.41', NULL);
INSERT INTO public.products VALUES (18, 'B431R5', 1, 1, 2700.00, 2, 4, 1, 2.00, 5, 'Мужские кожаные ботинки/мужские ботинки', NULL);
INSERT INTO public.products VALUES (19, 'P764G4', 2, 1, 6800.00, 1, 6, 2, 3.00, 15, 'Туфли женские, ARGO, размер 38', NULL);
INSERT INTO public.products VALUES (20, 'C436G5', 1, 1, 10200.00, 1, 5, 2, 2.00, 9, 'Ботинки женские, ARGO, размер 40', NULL);
INSERT INTO public.products VALUES (21, 'F427R5', 1, 1, 11800.00, 2, 4, 2, 4.00, 11, 'Ботинки на молнии с декоративной пряжкой FRAU', NULL);
INSERT INTO public.products VALUES (22, 'N457T5', 4, 1, 4600.00, 1, 6, 2, 3.00, 13, 'Полуботинки Ботинки черные зимние, мех', NULL);
INSERT INTO public.products VALUES (23, 'D364R4', 2, 1, 12400.00, 1, 1, 2, 2.00, 5, 'Туфли Luiza Belly женские Kate-lazo черные из натуральной замши', NULL);
INSERT INTO public.products VALUES (24, 'S326R5', 6, 1, 9900.00, 2, 6, 1, 3.00, 15, 'Мужские кожаные тапочки Профиль С.Дали ', NULL);
INSERT INTO public.products VALUES (25, 'L754R4', 4, 1, 1700.00, 1, 1, 2, 2.00, 7, 'Полуботинки kari женские WB2020SS-26, размер 38, цвет: черный', NULL);
INSERT INTO public.products VALUES (26, 'M542T5', 3, 1, 2800.00, 2, 4, 1, 5.00, 3, 'Кроссовки мужские TOFA', NULL);
INSERT INTO public.products VALUES (27, 'D268G5', 2, 1, 4399.00, 2, 4, 2, 3.00, 12, 'Туфли Rieker женские демисезонные, размер 36, цвет коричневый', NULL);
INSERT INTO public.products VALUES (28, 'T324F5', 7, 1, 4699.00, 1, 6, 2, 2.00, 5, 'Сапоги замша Цвет: синий', NULL);
INSERT INTO public.products VALUES (29, 'K358H6', 6, 1, 599.00, 1, 4, 1, 3.00, 2, 'Тапочки мужские син р.41', NULL);
INSERT INTO public.products VALUES (30, 'H535R5', 1, 1, 2300.00, 2, 4, 2, 2.00, 7, 'Женские Ботинки демисезонные', NULL);


--
-- TOC entry 3393 (class 0 OID 49318)
-- Dependencies: 216
-- Data for Name: products_in_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products_in_orders VALUES (1, 1, 1, 2);
INSERT INTO public.products_in_orders VALUES (2, 2, 3, 1);
INSERT INTO public.products_in_orders VALUES (3, 3, 5, 10);
INSERT INTO public.products_in_orders VALUES (4, 4, 7, 5);
INSERT INTO public.products_in_orders VALUES (5, 5, 1, 2);
INSERT INTO public.products_in_orders VALUES (6, 6, 3, 1);
INSERT INTO public.products_in_orders VALUES (7, 7, 5, 10);
INSERT INTO public.products_in_orders VALUES (8, 8, 7, 5);
INSERT INTO public.products_in_orders VALUES (9, 9, 9, 5);
INSERT INTO public.products_in_orders VALUES (10, 10, 11, 5);
INSERT INTO public.products_in_orders VALUES (11, 1, 2, 2);
INSERT INTO public.products_in_orders VALUES (12, 2, 4, 1);
INSERT INTO public.products_in_orders VALUES (13, 3, 6, 10);
INSERT INTO public.products_in_orders VALUES (14, 4, 8, 4);
INSERT INTO public.products_in_orders VALUES (15, 5, 2, 2);
INSERT INTO public.products_in_orders VALUES (16, 6, 4, 1);
INSERT INTO public.products_in_orders VALUES (17, 7, 6, 10);
INSERT INTO public.products_in_orders VALUES (18, 8, 8, 4);
INSERT INTO public.products_in_orders VALUES (19, 9, 10, 1);
INSERT INTO public.products_in_orders VALUES (20, 10, 12, 5);


--
-- TOC entry 3394 (class 0 OID 49321)
-- Dependencies: 217
-- Data for Name: providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.providers VALUES (2, 'Обувь для вас');
INSERT INTO public.providers VALUES (1, 'Kari');


--
-- TOC entry 3395 (class 0 OID 49324)
-- Dependencies: 218
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles VALUES (2, 'Менеджер');
INSERT INTO public.roles VALUES (1, 'Авторизированный клиент');
INSERT INTO public.roles VALUES (3, 'Администратор');


--
-- TOC entry 3396 (class 0 OID 49327)
-- Dependencies: 219
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.units VALUES (1, 'шт.');


--
-- TOC entry 3397 (class 0 OID 49330)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 3, 'Никифорова', 'Весения', 'Николаевна', '94d5ous@gmail.com', 'uzWC67');
INSERT INTO public.users VALUES (2, 3, 'Сазонов', 'Руслан', 'Германович', 'uth4iz@mail.com', '2L6KZG');
INSERT INTO public.users VALUES (3, 3, 'Одинцов', 'Серафим', 'Артёмович', 'yzls62@outlook.com', 'JlFRCZ');
INSERT INTO public.users VALUES (4, 2, 'Степанов', 'Михаил', 'Артёмович', '1diph5e@tutanota.com', '8ntwUp');
INSERT INTO public.users VALUES (5, 2, 'Ворсин', 'Петр', 'Евгеньевич', 'tjde7c@yahoo.com', 'YOyhfR');
INSERT INTO public.users VALUES (6, 2, 'Старикова', 'Елена', 'Павловна', 'wpmrc3do@tutanota.com', 'RSbvHv');
INSERT INTO public.users VALUES (7, 1, 'Михайлюк', 'Анна', 'Вячеславовна', '5d4zbu@tutanota.com', 'rwVDh9');
INSERT INTO public.users VALUES (8, 1, 'Ситдикова', 'Елена', 'Анатольевна', 'ptec8ym@yahoo.com', 'LdNyos');
INSERT INTO public.users VALUES (9, 1, 'Ворсин', 'Петр', 'Евгеньевич', '1qz4kw@mail.com', 'gynQMT');
INSERT INTO public.users VALUES (10, 1, 'Старикова', 'Елена', 'Павловна', '4np6se@mail.com', 'AtnDjr');


--
-- TOC entry 3213 (class 2606 OID 49334)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3215 (class 2606 OID 49336)
-- Name: manufacturers manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturer_pkey PRIMARY KEY (id);


--
-- TOC entry 3217 (class 2606 OID 49338)
-- Name: order_statuses order_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_statuses
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (id);


--
-- TOC entry 3219 (class 2606 OID 49340)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3221 (class 2606 OID 49342)
-- Name: pickup_points pickup_points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_points
    ADD CONSTRAINT pickup_points_pkey PRIMARY KEY (id);


--
-- TOC entry 3223 (class 2606 OID 49344)
-- Name: product_types product_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_types
    ADD CONSTRAINT product_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3227 (class 2606 OID 49346)
-- Name: products_in_orders products_in_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_orders
    ADD CONSTRAINT products_in_orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 49348)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 49350)
-- Name: providers providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 49352)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 49354)
-- Name: units units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- TOC entry 3235 (class 2606 OID 49356)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3236 (class 2606 OID 49357)
-- Name: orders orders_pickup_point_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pickup_point_id_fkey FOREIGN KEY (pickup_point_id) REFERENCES public.pickup_points(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3237 (class 2606 OID 49362)
-- Name: orders orders_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.order_statuses(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3238 (class 2606 OID 49367)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3239 (class 2606 OID 49372)
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3244 (class 2606 OID 49377)
-- Name: products_in_orders products_in_orders_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_orders
    ADD CONSTRAINT products_in_orders_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3245 (class 2606 OID 49382)
-- Name: products_in_orders products_in_orders_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_orders
    ADD CONSTRAINT products_in_orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3240 (class 2606 OID 49387)
-- Name: products products_manufacturer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_manufacturer_id_fkey FOREIGN KEY (manufacturer_id) REFERENCES public.manufacturers(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3241 (class 2606 OID 49392)
-- Name: products products_product_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_type_id_fkey FOREIGN KEY (product_type_id) REFERENCES public.product_types(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3242 (class 2606 OID 49397)
-- Name: products products_provider_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_provider_id_fkey FOREIGN KEY (provider_id) REFERENCES public.providers(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3243 (class 2606 OID 49402)
-- Name: products products_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.units(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3246 (class 2606 OID 49407)
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2026-02-26 06:52:33

--
-- PostgreSQL database dump complete
--

\unrestrict zyk20ZaH1qg5iRiwBepRUr8ZGzZW39VdGLSpRLzdBFzJyHmbyaPeLG0azZcGAU4

