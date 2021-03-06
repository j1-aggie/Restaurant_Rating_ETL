PGDMP                     	    x           restaurant_db    12.4    12.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    17885    restaurant_db    DATABASE     �   CREATE DATABASE restaurant_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE restaurant_db;
                postgres    false                        2615    17999    restaurant_db    SCHEMA        CREATE SCHEMA restaurant_db;
    DROP SCHEMA restaurant_db;
                postgres    false            �            1259    18250 	   aggregate    TABLE     y  CREATE TABLE public.aggregate (
    id integer,
    restaurant_name character varying(1000),
    street_address character varying(1000),
    city text,
    state text,
    zip_code integer,
    avg_rating text,
    total_ratings integer,
    price_level text,
    date character varying,
    hour character varying,
    yelp_total_ratings integer,
    yelp_price_level text
);
    DROP TABLE public.aggregate;
       public         heap    postgres    false            �            1259    18229    google    TABLE     M  CREATE TABLE public.google (
    id integer NOT NULL,
    restaurant_name character varying(1000) NOT NULL,
    street_address character varying(1000),
    city text,
    state text,
    zip_code integer,
    avg_rating text,
    total_ratings integer,
    price_level text,
    date character varying,
    hour character varying
);
    DROP TABLE public.google;
       public         heap    postgres    false            �            1259    18237    yelp    TABLE     �   CREATE TABLE public.yelp (
    id integer NOT NULL,
    yelp_total_ratings integer,
    yelp_price_level text,
    name text
);
    DROP TABLE public.yelp;
       public         heap    postgres    false                      0    18250 	   aggregate 
   TABLE DATA           �   COPY public.aggregate (id, restaurant_name, street_address, city, state, zip_code, avg_rating, total_ratings, price_level, date, hour, yelp_total_ratings, yelp_price_level) FROM stdin;
    public          postgres    false    205   �                 0    18229    google 
   TABLE DATA           �   COPY public.google (id, restaurant_name, street_address, city, state, zip_code, avg_rating, total_ratings, price_level, date, hour) FROM stdin;
    public          postgres    false    203                    0    18237    yelp 
   TABLE DATA           N   COPY public.yelp (id, yelp_total_ratings, yelp_price_level, name) FROM stdin;
    public          postgres    false    204   /       �
           2606    18236    google google_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.google
    ADD CONSTRAINT google_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.google DROP CONSTRAINT google_pkey;
       public            postgres    false    203            �
           2606    18244    yelp yelp_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.yelp
    ADD CONSTRAINT yelp_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.yelp DROP CONSTRAINT yelp_pkey;
       public            postgres    false    204            �
           2606    18245    yelp id    FK CONSTRAINT     b   ALTER TABLE ONLY public.yelp
    ADD CONSTRAINT id FOREIGN KEY (id) REFERENCES public.google(id);
 1   ALTER TABLE ONLY public.yelp DROP CONSTRAINT id;
       public          postgres    false    203    2698    204                  x������ � �            x������ � �            x������ � �     