# 🏨 Hotel Reservation System (PostgreSQL ERD)

Sistem manajemen pemesanan hotel berbasis **PostgreSQL**, dengan desain Entity Relationship Diagram (ERD) untuk mengelola data tamu, reservasi, pembayaran, fasilitas, dan staff.

## 📌 Fitur Database

- Manajemen data tamu (guest)
- Sistem reservasi hotel
- Riwayat pembayaran dan refund
- Manajemen kamar dan fasilitas
- Relasi antar entitas lengkap dengan foreign key

---

## 🧠 ERD Diagram

Berikut adalah diagram ERD yang digunakan pada sistem ini:

![ERD Diagram](./erd.png) <!-- GANTI DENGAN NAMA FILE SEBENARNYA -->

> 📂 Letakkan gambar ERD (misalnya `erd.png`) di root folder repo ini.

---

## 🗃️ Struktur Tabel (Schema: `hotel_reservation`)

| Tabel              | Deskripsi                          |
|--------------------|-------------------------------------|
| `guest`            | Menyimpan data tamu hotel          |
| `reservation`      | Informasi pemesanan kamar          |
| `room`             | Daftar kamar hotel                 |
| `facility`         | Fasilitas yang tersedia di kamar   |
| `staff`            | Pegawai hotel                      |
| `payment`          | Catatan pembayaran                 |
| `refund`           | Pengembalian dana (jika ada)       |
| `reservation_room` | Relasi antara reservasi dan kamar  |

---

## 🛠️ Cara Import SQL ke PostgreSQL

1. **Buka PostgreSQL (DBeaver / pgAdmin)**
2. Buat database baru (misalnya `hotel_db`)
3. Jalankan file `erd_hotel_reservation.sql`
4. Semua tabel dan data akan terbuat dalam schema `hotel_reservation`

---

## 📂 Struktur File

