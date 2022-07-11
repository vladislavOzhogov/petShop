PGDMP         &                z            petShop    13.0    13.0 C               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    47570    petShop    DATABASE     j   CREATE DATABASE "petShop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Kazakhstan.1251';
    DROP DATABASE "petShop";
                postgres    false            �            1259    47749    basket    TABLE     Y   CREATE TABLE public.basket (
    id integer NOT NULL,
    customer_id bigint NOT NULL
);
    DROP TABLE public.basket;
       public         heap    postgres    false            �            1259    47747    basket_id_seq    SEQUENCE     �   CREATE SEQUENCE public.basket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.basket_id_seq;
       public          postgres    false    213                       0    0    basket_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.basket_id_seq OWNED BY public.basket.id;
          public          postgres    false    212            �            1259    47760    basket_product    TABLE     �   CREATE TABLE public.basket_product (
    basket_id bigint,
    product_id bigint,
    count integer,
    total_price integer
);
 "   DROP TABLE public.basket_product;
       public         heap    postgres    false            �            1259    47647    category    TABLE     p   CREATE TABLE public.category (
    id integer NOT NULL,
    parent_id bigint,
    name character varying(40)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    47645    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    205                       0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    204            �            1259    47610    customer    TABLE     �  CREATE TABLE public.customer (
    id integer NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30),
    birthday_date date,
    phone_number character varying(15),
    address character varying(30),
    language character varying(30),
    country character varying(20),
    role_id bigint,
    username character varying(15),
    password character varying(30),
    email character varying(50)
);
    DROP TABLE public.customer;
       public         heap    postgres    false            �            1259    47608    customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.customer_id_seq;
       public          postgres    false    201            	           0    0    customer_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;
          public          postgres    false    200            �            1259    47723    order    TABLE     b  CREATE TABLE public."order" (
    id integer NOT NULL,
    customer_id bigint,
    date_ordered date,
    date_delivered date,
    status character varying(20),
    target_address character varying(50),
    payment_choice character varying(20),
    preferred_time time(6) without time zone,
    comment character varying(100),
    total_price integer
);
    DROP TABLE public."order";
       public         heap    postgres    false            �            1259    47721    order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.order_id_seq;
       public          postgres    false    210            
           0    0    order_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.order_id_seq OWNED BY public."order".id;
          public          postgres    false    209            �            1259    47734    order_product    TABLE     R   CREATE TABLE public.order_product (
    order_id bigint,
    product_id bigint
);
 !   DROP TABLE public.order_product;
       public         heap    postgres    false            �            1259    47669    product    TABLE     �   CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(200),
    cost integer,
    in_stock integer,
    supplier_id bigint,
    category_id bigint
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    47708    product_category    TABLE     X   CREATE TABLE public.product_category (
    product_id bigint,
    category_id bigint
);
 $   DROP TABLE public.product_category;
       public         heap    postgres    false            �            1259    47667    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    207                       0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    206            �            1259    47618    role    TABLE     [   CREATE TABLE public.role (
    role_id integer NOT NULL,
    name character varying(10)
);
    DROP TABLE public.role;
       public         heap    postgres    false            �            1259    47616    role_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.role_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.role_role_id_seq;
       public          postgres    false    203                       0    0    role_role_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.role_role_id_seq OWNED BY public.role.role_id;
          public          postgres    false    202            �            1259    47778    role_role_id_seq1    SEQUENCE     �   ALTER TABLE public.role ALTER COLUMN role_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.role_role_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    203            R           2604    47752 	   basket id    DEFAULT     f   ALTER TABLE ONLY public.basket ALTER COLUMN id SET DEFAULT nextval('public.basket_id_seq'::regclass);
 8   ALTER TABLE public.basket ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            O           2604    47650    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            N           2604    47613    customer id    DEFAULT     j   ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);
 :   ALTER TABLE public.customer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200    201            Q           2604    47726    order id    DEFAULT     f   ALTER TABLE ONLY public."order" ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);
 9   ALTER TABLE public."order" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            P           2604    47672 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            �          0    47749    basket 
   TABLE DATA           1   COPY public.basket (id, customer_id) FROM stdin;
    public          postgres    false    213   @L       �          0    47760    basket_product 
   TABLE DATA           S   COPY public.basket_product (basket_id, product_id, count, total_price) FROM stdin;
    public          postgres    false    214   bL       �          0    47647    category 
   TABLE DATA           7   COPY public.category (id, parent_id, name) FROM stdin;
    public          postgres    false    205   �L       �          0    47610    customer 
   TABLE DATA           �   COPY public.customer (id, first_name, last_name, birthday_date, phone_number, address, language, country, role_id, username, password, email) FROM stdin;
    public          postgres    false    201   �L       �          0    47723    order 
   TABLE DATA           �   COPY public."order" (id, customer_id, date_ordered, date_delivered, status, target_address, payment_choice, preferred_time, comment, total_price) FROM stdin;
    public          postgres    false    210   7M       �          0    47734    order_product 
   TABLE DATA           =   COPY public.order_product (order_id, product_id) FROM stdin;
    public          postgres    false    211   TM       �          0    47669    product 
   TABLE DATA           b   COPY public.product (id, name, description, cost, in_stock, supplier_id, category_id) FROM stdin;
    public          postgres    false    207   qM       �          0    47708    product_category 
   TABLE DATA           C   COPY public.product_category (product_id, category_id) FROM stdin;
    public          postgres    false    208   �M       �          0    47618    role 
   TABLE DATA           -   COPY public.role (role_id, name) FROM stdin;
    public          postgres    false    203   �M                  0    0    basket_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.basket_id_seq', 13, true);
          public          postgres    false    212                       0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 2, true);
          public          postgres    false    204                       0    0    customer_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.customer_id_seq', 4, true);
          public          postgres    false    200                       0    0    order_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.order_id_seq', 1, false);
          public          postgres    false    209                       0    0    product_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.product_id_seq', 6, true);
          public          postgres    false    206                       0    0    role_role_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.role_role_id_seq', 5, true);
          public          postgres    false    202                       0    0    role_role_id_seq1    SEQUENCE SET     @   SELECT pg_catalog.setval('public.role_role_id_seq1', 1, false);
          public          postgres    false    215            b           2606    47754    basket basket_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.basket
    ADD CONSTRAINT basket_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.basket DROP CONSTRAINT basket_pk;
       public            postgres    false    213            T           2606    47615    customer customer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    201            \           2606    47652    category id_pk 
   CONSTRAINT     L   ALTER TABLE ONLY public.category
    ADD CONSTRAINT id_pk PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.category DROP CONSTRAINT id_pk;
       public            postgres    false    205            `           2606    47728    order order_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_pkey;
       public            postgres    false    210            V           2606    47783    customer password_uk 
   CONSTRAINT     S   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT password_uk UNIQUE (password);
 >   ALTER TABLE ONLY public.customer DROP CONSTRAINT password_uk;
       public            postgres    false    201            ^           2606    47677    product product_id_pk 
   CONSTRAINT     S   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_id_pk PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.product DROP CONSTRAINT product_id_pk;
       public            postgres    false    207            Z           2606    47626    role role_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    203            X           2606    47781    customer username_uk 
   CONSTRAINT     S   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT username_uk UNIQUE (username);
 >   ALTER TABLE ONLY public.customer DROP CONSTRAINT username_uk;
       public            postgres    false    201            l           2606    47755    basket basket_customer_fk    FK CONSTRAINT        ALTER TABLE ONLY public.basket
    ADD CONSTRAINT basket_customer_fk FOREIGN KEY (customer_id) REFERENCES public.customer(id);
 C   ALTER TABLE ONLY public.basket DROP CONSTRAINT basket_customer_fk;
       public          postgres    false    2900    213    201            m           2606    47763 ,   basket_product basket_product_basket_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.basket_product
    ADD CONSTRAINT basket_product_basket_id_fkey FOREIGN KEY (basket_id) REFERENCES public.basket(id);
 V   ALTER TABLE ONLY public.basket_product DROP CONSTRAINT basket_product_basket_id_fkey;
       public          postgres    false    213    214    2914            n           2606    47768 -   basket_product basket_product_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.basket_product
    ADD CONSTRAINT basket_product_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);
 W   ALTER TABLE ONLY public.basket_product DROP CONSTRAINT basket_product_product_id_fkey;
       public          postgres    false    214    207    2910            e           2606    47678    product category_id_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.product
    ADD CONSTRAINT category_id_fk FOREIGN KEY (category_id) REFERENCES public.category(id);
 @   ALTER TABLE ONLY public.product DROP CONSTRAINT category_id_fk;
       public          postgres    false    2908    207    205            h           2606    47716 $   product_category category_id_link_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT category_id_link_fk FOREIGN KEY (category_id) REFERENCES public.category(id);
 N   ALTER TABLE ONLY public.product_category DROP CONSTRAINT category_id_link_fk;
       public          postgres    false    208    2908    205            i           2606    47729    order customer_id_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT customer_id_fk FOREIGN KEY (customer_id) REFERENCES public.customer(id);
 @   ALTER TABLE ONLY public."order" DROP CONSTRAINT customer_id_fk;
       public          postgres    false    201    210    2900            j           2606    47737    order_product order_id_link_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_id_link_fk FOREIGN KEY (order_id) REFERENCES public."order"(id);
 H   ALTER TABLE ONLY public.order_product DROP CONSTRAINT order_id_link_fk;
       public          postgres    false    210    211    2912            d           2606    47653    category parent_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.category
    ADD CONSTRAINT parent_fk FOREIGN KEY (parent_id) REFERENCES public.category(id) NOT VALID;
 <   ALTER TABLE ONLY public.category DROP CONSTRAINT parent_fk;
       public          postgres    false    205    205    2908            g           2606    47711 #   product_category product_id_link_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_id_link_fk FOREIGN KEY (product_id) REFERENCES public.product(id);
 M   ALTER TABLE ONLY public.product_category DROP CONSTRAINT product_id_link_fk;
       public          postgres    false    2910    207    208            k           2606    47742     order_product product_id_link_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT product_id_link_fk FOREIGN KEY (product_id) REFERENCES public.product(id);
 J   ALTER TABLE ONLY public.order_product DROP CONSTRAINT product_id_link_fk;
       public          postgres    false    211    207    2910            c           2606    47688    customer role_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT role_id_fk FOREIGN KEY (role_id) REFERENCES public.role(role_id) NOT VALID;
 =   ALTER TABLE ONLY public.customer DROP CONSTRAINT role_id_fk;
       public          postgres    false    2906    201    203            f           2606    47683    product supplier_id_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.product
    ADD CONSTRAINT supplier_id_fk FOREIGN KEY (supplier_id) REFERENCES public.customer(id);
 @   ALTER TABLE ONLY public.product DROP CONSTRAINT supplier_id_fk;
       public          postgres    false    2900    207    201            �      x�34�4����� oT      �      x�34�4��".CcNc�ʌ���� ��      �   +   x�3���,I-.qN,IM�/��2�$Cy����y)\1z\\\ .�P      �   [   x�=˽
� ���]
��Cmm.��Rx������Lǂs����v�~���3��)�̌ܶ�r����b���m��u�fF!���      �      x������ � �      �      x������ � �      �   a   x�3�,I-.	(�O)M.��C C.#d9#I#.c��D|b^~IFjQ<H1gRNb^�B~^*��������!�0t�F�՚��5ƭ�]�	n�1z\\\ C�E�      �      x������ � �      �   &   x�3�v�2�tt����2���
��qqq mQ�     