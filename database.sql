--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-07-04 14:37:03
CREATE SCHEMA IF NOT EXISTS hotel_reservation;
SET search_path = hotel_reservation;

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
-- TOC entry 4902 (class 1262 OID 5)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--


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
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 4902
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--




SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 16588)
-- Name: facility; Type: TABLE; Schema: hotel_reservation; Owner: postgres
--

CREATE TABLE hotel_reservation.facility (
    id_facility integer NOT NULL,
    room_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE hotel_reservation.facility OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16541)
-- Name: guest; Type: TABLE; Schema: hotel_reservation; Owner: postgres
--

CREATE TABLE hotel_reservation.guest (
    id_guest integer NOT NULL,
    full_name character varying(100),
    email character varying(100),
    phone_number character varying(20),
    nationality character varying(50)
);


ALTER TABLE hotel_reservation.guest OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16559)
-- Name: payment; Type: TABLE; Schema: hotel_reservation; Owner: postgres
--

CREATE TABLE hotel_reservation.payment (
    id_payment integer NOT NULL,
    reservation_id integer NOT NULL,
    amount_paid numeric(12,2),
    payment_date date,
    payment_method character varying(50),
    payment_type character varying(50)
);


ALTER TABLE hotel_reservation.payment OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16564)
-- Name: refund; Type: TABLE; Schema: hotel_reservation; Owner: postgres
--

CREATE TABLE hotel_reservation.refund (
    id_refund integer NOT NULL,
    reservation_id integer,
    refund_amount numeric(12,2),
    reason text,
    date_refunded date,
    status character varying(50)
);


ALTER TABLE hotel_reservation.refund OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16546)
-- Name: reservation; Type: TABLE; Schema: hotel_reservation; Owner: postgres
--

CREATE TABLE hotel_reservation.reservation (
    id_reservation integer NOT NULL,
    guest_id integer,
    check_in_date date,
    check_out_date date,
    status character varying(50),
    booking_date date,
    num_people integer,
    total_price numeric(12,2)
);


ALTER TABLE hotel_reservation.reservation OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16556)
-- Name: reservation_room; Type: TABLE; Schema: hotel_reservation; Owner: postgres
--

CREATE TABLE hotel_reservation.reservation_room (
    reservation_id integer NOT NULL,
    room_id integer NOT NULL
);


ALTER TABLE hotel_reservation.reservation_room OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16551)
-- Name: room; Type: TABLE; Schema: hotel_reservation; Owner: postgres
--

CREATE TABLE hotel_reservation.room (
    id_room integer NOT NULL,
    room_type character varying(50),
    price_per_night numeric(10,2),
    status character varying(50)
);


ALTER TABLE hotel_reservation.room OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16571)
-- Name: staff; Type: TABLE; Schema: hotel_reservation; Owner: postgres
--

CREATE TABLE hotel_reservation.staff (
    id_staff integer NOT NULL,
    name character varying(100),
    role character varying(50)
);


ALTER TABLE hotel_reservation.staff OWNER TO postgres;

--
-- TOC entry 4896 (class 0 OID 16588)
-- Dependencies: 224
-- Data for Name: facility; Type: TABLE DATA; Schema: hotel_reservation; Owner: postgres
--

INSERT INTO hotel_reservation.facility VALUES (1, 101, 'two bed');
INSERT INTO hotel_reservation.facility VALUES (2, 102, 'refrigrator');
INSERT INTO hotel_reservation.facility VALUES (3, 101, 'oven');
INSERT INTO hotel_reservation.facility VALUES (4, 104, 'bathtub');
INSERT INTO hotel_reservation.facility VALUES (5, 105, 'shower');


--
-- TOC entry 4889 (class 0 OID 16541)
-- Dependencies: 217
-- Data for Name: guest; Type: TABLE DATA; Schema: hotel_reservation; Owner: postgres
--

INSERT INTO hotel_reservation.guest VALUES (1, 'Andi Saputra', 'andi@mail.com', '081234567890', 'Indonesia');
INSERT INTO hotel_reservation.guest VALUES (2, 'Maria Tan', 'maria.tan@gmail.com', '081223456789', 'Singapore');
INSERT INTO hotel_reservation.guest VALUES (3, 'John Lee', 'johnlee@mail.com', '082198765432', 'Malaysia');
INSERT INTO hotel_reservation.guest VALUES (4, 'Siti Nurhaliza', 'siti.nur@mail.com', '081298764321', 'Brunei');
INSERT INTO hotel_reservation.guest VALUES (5, 'Ahmad Faisal', 'ahmad.faisal@gmail.com', '082156789012', 'Indonesia');


--
-- TOC entry 4893 (class 0 OID 16559)
-- Dependencies: 221
-- Data for Name: payment; Type: TABLE DATA; Schema: hotel_reservation; Owner: postgres
--

INSERT INTO hotel_reservation.payment VALUES (1, 1, 500000.00, '2025-07-01', 'credit_card', 'full');
INSERT INTO hotel_reservation.payment VALUES (2, 2, 1500000.00, '2025-07-02', 'transfer', 'full');
INSERT INTO hotel_reservation.payment VALUES (3, 3, 0.00, NULL, NULL, NULL);
INSERT INTO hotel_reservation.payment VALUES (4, 4, 600000.00, '2025-07-06', 'e-wallet', 'partial');
INSERT INTO hotel_reservation.payment VALUES (5, 5, 1400000.00, '2025-07-10', 'cash', 'full');


--
-- TOC entry 4894 (class 0 OID 16564)
-- Dependencies: 222
-- Data for Name: refund; Type: TABLE DATA; Schema: hotel_reservation; Owner: postgres
--

INSERT INTO hotel_reservation.refund VALUES (1, 3, 600000.00, 'Cancelled by guest', '2025-07-07', 'successful');
INSERT INTO hotel_reservation.refund VALUES (2, 4, 600000.00, 'Room maintenance issue', '2025-07-08', 'pending');
INSERT INTO hotel_reservation.refund VALUES (3, 1, 500000.00, 'Duplicate booking', '2025-07-03', 'cancelled');
INSERT INTO hotel_reservation.refund VALUES (4, 2, 0.00, 'No refund', NULL, 'cancelled');
INSERT INTO hotel_reservation.refund VALUES (5, 5, 0.00, NULL, NULL, 'cancelled');


--
-- TOC entry 4890 (class 0 OID 16546)
-- Dependencies: 218
-- Data for Name: reservation; Type: TABLE DATA; Schema: hotel_reservation; Owner: postgres
--

INSERT INTO hotel_reservation.reservation VALUES (1, 1, '2025-07-10', '2025-07-12', 'pending', '2025-07-01', 2, 1000000.00);
INSERT INTO hotel_reservation.reservation VALUES (2, 2, '2025-07-15', '2025-07-18', 'successful', '2025-07-02', 1, 1500000.00);
INSERT INTO hotel_reservation.reservation VALUES (3, 3, '2025-07-20', '2025-07-22', 'cancelled', '2025-07-05', 2, 600000.00);
INSERT INTO hotel_reservation.reservation VALUES (4, 4, '2025-07-25', '2025-07-28', 'pending', '2025-07-06', 3, 1800000.00);
INSERT INTO hotel_reservation.reservation VALUES (5, 5, '2025-08-01', '2025-08-03', 'successful', '2025-07-10', 2, 1400000.00);


--
-- TOC entry 4892 (class 0 OID 16556)
-- Dependencies: 220
-- Data for Name: reservation_room; Type: TABLE DATA; Schema: hotel_reservation; Owner: postgres
--

INSERT INTO hotel_reservation.reservation_room VALUES (1, 101);
INSERT INTO hotel_reservation.reservation_room VALUES (2, 102);
INSERT INTO hotel_reservation.reservation_room VALUES (3, 103);
INSERT INTO hotel_reservation.reservation_room VALUES (4, 104);
INSERT INTO hotel_reservation.reservation_room VALUES (5, 105);


--
-- TOC entry 4891 (class 0 OID 16551)
-- Dependencies: 219
-- Data for Name: room; Type: TABLE DATA; Schema: hotel_reservation; Owner: postgres
--

INSERT INTO hotel_reservation.room VALUES (101, 'Deluxe', 500000.00, 'available');
INSERT INTO hotel_reservation.room VALUES (102, 'Superior', 400000.00, 'not available');
INSERT INTO hotel_reservation.room VALUES (103, 'Standard', 300000.00, 'available');
INSERT INTO hotel_reservation.room VALUES (104, 'Executive', 600000.00, 'not available');
INSERT INTO hotel_reservation.room VALUES (105, 'Suite', 700000.00, 'available');


--
-- TOC entry 4895 (class 0 OID 16571)
-- Dependencies: 223
-- Data for Name: staff; Type: TABLE DATA; Schema: hotel_reservation; Owner: postgres
--

INSERT INTO hotel_reservation.staff VALUES (1, 'Budi Santoso', 'Admin');
INSERT INTO hotel_reservation.staff VALUES (2, 'Clara Wijaya', 'Receptionist');
INSERT INTO hotel_reservation.staff VALUES (3, 'Kevin Gunawan', 'Housekeeping');
INSERT INTO hotel_reservation.staff VALUES (4, 'Nur Aisyah', 'Manager');
INSERT INTO hotel_reservation.staff VALUES (5, 'Tommy Salim', 'Concierge');


--
-- TOC entry 4737 (class 2606 OID 16592)
-- Name: facility facility_pkey; Type: CONSTRAINT; Schema: hotel_reservation; Owner: postgres
--

ALTER TABLE ONLY hotel_reservation.facility
    ADD CONSTRAINT facility_pkey PRIMARY KEY (id_facility);


--
-- TOC entry 4723 (class 2606 OID 16545)
-- Name: guest guest_pkey; Type: CONSTRAINT; Schema: hotel_reservation; Owner: postgres
--

ALTER TABLE ONLY hotel_reservation.guest
    ADD CONSTRAINT guest_pkey PRIMARY KEY (id_guest);


--
-- TOC entry 4729 (class 2606 OID 16563)
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: hotel_reservation; Owner: postgres
--

ALTER TABLE ONLY hotel_reservation.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id_payment);


--
-- TOC entry 4731 (class 2606 OID 16570)
-- Name: refund refund_pkey; Type: CONSTRAINT; Schema: hotel_reservation; Owner: postgres
--

ALTER TABLE ONLY hotel_reservation.refund
    ADD CONSTRAINT refund_pkey PRIMARY KEY (id_refund);


--
-- TOC entry 4725 (class 2606 OID 16550)
-- Name: reservation reservation_pkey; Type: CONSTRAINT; Schema: hotel_reservation; Owner: postgres
--

ALTER TABLE ONLY hotel_reservation.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id_reservation);


--
-- TOC entry 4727 (class 2606 OID 16555)
-- Name: room room_pkey; Type: CONSTRAINT; Schema: hotel_reservation; Owner: postgres
--

ALTER TABLE ONLY hotel_reservation.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (id_room);


--
-- TOC entry 4735 (class 2606 OID 16575)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: hotel_reservation; Owner: postgres
--

ALTER TABLE ONLY hotel_reservation.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id_staff);


--
-- TOC entry 4733 (class 2606 OID 16582)
-- Name: refund unique_reservation_id; Type: CONSTRAINT; Schema: hotel_reservation; Owner: postgres
--

ALTER TABLE ONLY hotel_reservation.refund
    ADD CONSTRAINT unique_reservation_id UNIQUE (reservation_id);


--
-- TOC entry 4743 (class 2606 OID 16593)
-- Name: facility facility_room; Type: FK CONSTRAINT; Schema: hotel_reservation; Owner: postgres
--

ALTER TABLE ONLY hotel_reservation.facility
    ADD CONSTRAINT facility_room FOREIGN KEY (room_id) REFERENCES hotel_reservation.room(id_room);


--
-- TOC entry 4741 (class 2606 OID 16613)
-- Name: payment payment_reservation; Type: FK CONSTRAINT; Schema: hotel_reservation; Owner: postgres
--

ALTER TABLE ONLY hotel_reservation.payment
    ADD CONSTRAINT payment_reservation FOREIGN KEY (reservation_id) REFERENCES hotel_reservation.reservation(id_reservation);


--
-- TOC entry 4742 (class 2606 OID 16583)
-- Name: refund refund_reservation; Type: FK CONSTRAINT; Schema: hotel_reservation; Owner: postgres
--

ALTER TABLE ONLY hotel_reservation.refund
    ADD CONSTRAINT refund_reservation FOREIGN KEY (reservation_id) REFERENCES hotel_reservation.reservation(id_reservation);


--
-- TOC entry 4738 (class 2606 OID 16576)
-- Name: reservation reservation_guest; Type: FK CONSTRAINT; Schema: hotel_reservation; Owner: postgres
--

ALTER TABLE ONLY hotel_reservation.reservation
    ADD CONSTRAINT reservation_guest FOREIGN KEY (guest_id) REFERENCES hotel_reservation.guest(id_guest);


--
-- TOC entry 4739 (class 2606 OID 16618)
-- Name: reservation_room reservation_room; Type: FK CONSTRAINT; Schema: hotel_reservation; Owner: postgres
--

ALTER TABLE ONLY hotel_reservation.reservation_room
    ADD CONSTRAINT reservation_room FOREIGN KEY (reservation_id) REFERENCES hotel_reservation.reservation(id_reservation);


--
-- TOC entry 4740 (class 2606 OID 16623)
-- Name: reservation_room room_reservation; Type: FK CONSTRAINT; Schema: hotel_reservation; Owner: postgres
--

ALTER TABLE ONLY hotel_reservation.reservation_room
    ADD CONSTRAINT room_reservation FOREIGN KEY (room_id) REFERENCES hotel_reservation.room(id_room);


-- Completed on 2025-07-04 14:37:03

--
-- PostgreSQL database dump complete
--

