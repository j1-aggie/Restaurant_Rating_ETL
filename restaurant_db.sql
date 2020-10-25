PGDMP     1    .            	    x           restaurant_db    12.4    12.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    17885    restaurant_db    DATABASE     �   CREATE DATABASE restaurant_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE restaurant_db;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    18124 	   aggregate    TABLE     o  CREATE TABLE public.aggregate (
    id integer,
    name character varying(1000) NOT NULL,
    street character varying(1000),
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
       public         heap    postgres    false    3            �            1259    18130    google    TABLE     J  CREATE TABLE public.google (
    id integer NOT NULL,
    restaurant_name character varying(1000) NOT NULL,
    street_address character varying(1000),
    city text,
    state text,
    zip_code integer,
    avg_rating text,
    total_ratings text,
    price_level text,
    date character varying,
    hour character varying
);
    DROP TABLE public.google;
       public         heap    postgres    false    3            �            1259    18138    yelp    TABLE     }   CREATE TABLE public.yelp (
    id integer NOT NULL,
    yelp_total_ratings text,
    yelp_price_level text,
    name text
);
    DROP TABLE public.yelp;
       public         heap    postgres    false    3                      0    18124 	   aggregate 
   TABLE DATA           �   COPY public.aggregate (id, name, street, city, state, zip_code, avg_rating, total_ratings, price_level, date, hour, yelp_total_ratings, yelp_price_level) FROM stdin;
    public          postgres    false    203   �                 0    18130    google 
   TABLE DATA           �   COPY public.google (id, restaurant_name, street_address, city, state, zip_code, avg_rating, total_ratings, price_level, date, hour) FROM stdin;
    public          postgres    false    204   �                 0    18138    yelp 
   TABLE DATA           N   COPY public.yelp (id, yelp_total_ratings, yelp_price_level, name) FROM stdin;
    public          postgres    false    205   I       �
           2606    18137    google google_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.google
    ADD CONSTRAINT google_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.google DROP CONSTRAINT google_pkey;
       public            postgres    false    204            �
           2606    18145    yelp yelp_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.yelp
    ADD CONSTRAINT yelp_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.yelp DROP CONSTRAINT yelp_pkey;
       public            postgres    false    205            �
           2606    18147    yelp id    FK CONSTRAINT     b   ALTER TABLE ONLY public.yelp
    ADD CONSTRAINT id FOREIGN KEY (id) REFERENCES public.google(id);
 1   ALTER TABLE ONLY public.yelp DROP CONSTRAINT id;
       public          postgres    false    204    2698    205                  x������ � �         �  x��X�R#7}n�BUTm��f4�Gc.!/��lvk_� �SFd.˒��C�"ߑ?ɗ��6`,Mp�2��V��ӧ%tZ�ꖝw��HM5� �Gݴs]��]��O�kZS��o�$��):$�?�?
���� ؓ!]�5͵nt�����5�#`�|���=�<�5��2�5�h�R��V��$��KӴ�Z���WWF�������P�\�����,�a�$x:�!�T�rS�+�Vu�nKB8��<��)�ۙ􋮪G��}.f�G�a��'S/ؑ.�\��itE"��	��gғ�>���U���(aU�r��~y"��_A��͍B����j�aW�P��\��"\1�^�K�=q�YF|8��+�|�e(w ,�$��N+�ta����H|��{��F�s�~)�|�Rx���SoՑ@H�1]"�l�cb:pu8�Q���6`��,u�� ��1v($��
''����E��^;2�z�X�J[{�s`Y����Q��@�����8/H��i�� �XS�Q	6�W�f�C�V���ЭG$�"����h�I>��B���F�V�i�v�ه��<T��q����}'�Tۙ�o+}�s�*U����+c�<��!G���E�hIMR"ث�1���W�CI(2��_{���處�#�7;:�$u�͑���(Co��`���%М�^F��P��-*�Aa %"�i��{��VNà�tSYəoQv���U��w�Ea�ՀS�f;��$(�a�%$PDtrv
>�??���]���=��;vh���D/c	\�_?)]���e�O�Xj���k��x�p�����/�X+��*Ѿ0��KE�?fa���1��ZM��h��p��f���=�Ie���. k�^z�>f���F���b1#4�vR�f�z� o�.��p	ib��V�V�ˀ�G��Ӟ���ܔ�[S@�G]���]�"�n<��G=��\�iv|<=�Sw �x���Q�� h�IiP$�Py�ɀ�J�U�@�`�ZA0��TUnrn�=��]Q��齁�~���A��aDϗ^*����T�W���Y�Z���%�Tu�`���j_�� ���V1nl�����6����xJ��uWӃ�x��u�0x����t�L{}t̟�0vU^�լ���F��E5�&sE����<<��V�5��
��Z=���8�&���x1���N����n���.�w\�*�zY���<k::B-A�i1m�`=��;62��UE	C�}��<b�ǹ�����,�&���j��֓سSH�Wg�`xt]r������z��.ն�'�֦)�2����Qw��)a�g��I��u>�����J��㎰��?��㣳�㫫��x8f�g���or�ǁP>�P�A���*v�<K����:��n�9֮[~�cS�٩b'b��E�(���|� �1.�]�6�kJ�?�}ٰy��Hxb�]�ab`��
��@�Ж�kV�n���YJ����v�y�+�K�\ե~l�%�R���]xV��C�[��K�	�B�6_�^��[`�W�_'�ɷ}��kAD���;�9�!��vIi�Q��^�~5FG�;�p#��NɅ~ Q�8����3�1��o��a�:P����+p~�
F�}�G����,Pl?��[��  ���ۜۏlV��]� 10�9��`oo�?ƙ+f            x������ � �     