--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: menuprincipal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE menuprincipal (
    idmenu integer NOT NULL,
    titulo character varying(50),
    url character varying(50),
    icono character varying(50),
    activo boolean,
    idpadre integer
);


ALTER TABLE public.menuprincipal OWNER TO postgres;

--
-- Name: perfil; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE perfil (
    idperfil integer NOT NULL,
    nombre character varying(50),
    fechaing date,
    fechaact date,
    activo boolean
);


ALTER TABLE public.perfil OWNER TO postgres;

--
-- Name: perfildetalle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE perfildetalle (
    idperfil character varying(50) NOT NULL,
    idmenu integer,
    activo boolean
);


ALTER TABLE public.perfildetalle OWNER TO postgres;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    idusuario integer NOT NULL,
    iniciosesion character varying(50),
    clave character varying(50),
    fechanacimiento date,
    activo boolean
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuarioperfil; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarioperfil (
    idusuario integer NOT NULL,
    idperfil integer,
    activo boolean
);


ALTER TABLE public.usuarioperfil OWNER TO postgres;

--
-- Data for Name: menuprincipal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY menuprincipal (idmenu, titulo, url, icono, activo, idpadre) FROM stdin;
\.


--
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY perfil (idperfil, nombre, fechaing, fechaact, activo) FROM stdin;
\.


--
-- Data for Name: perfildetalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY perfildetalle (idperfil, idmenu, activo) FROM stdin;
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (idusuario, iniciosesion, clave, fechanacimiento, activo) FROM stdin;
\.


--
-- Data for Name: usuarioperfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuarioperfil (idusuario, idperfil, activo) FROM stdin;
\.


--
-- Name: menuprincipal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menuprincipal
    ADD CONSTRAINT menuprincipal_pkey PRIMARY KEY (idmenu);


--
-- Name: perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY perfil
    ADD CONSTRAINT perfil_pkey PRIMARY KEY (idperfil);


--
-- Name: perfildetalle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY perfildetalle
    ADD CONSTRAINT perfildetalle_pkey PRIMARY KEY (idperfil);


--
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (idusuario);


--
-- Name: usuarioperfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarioperfil
    ADD CONSTRAINT usuarioperfil_pkey PRIMARY KEY (idusuario);


--
-- Name: perfildetalle_idmenu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfildetalle
    ADD CONSTRAINT perfildetalle_idmenu_fkey FOREIGN KEY (idmenu) REFERENCES menuprincipal(idmenu);


--
-- Name: usuarioperfil_idperfil_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarioperfil
    ADD CONSTRAINT usuarioperfil_idperfil_fkey FOREIGN KEY (idperfil) REFERENCES perfil(idperfil);


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

