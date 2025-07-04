# 🏨 Hotel Reservation System (PostgreSQL ERD)

A hotel booking database system designed using **PostgreSQL**, structured with an Entity Relationship Diagram (ERD) to manage guests, reservations, payments, room facilities, and hotel staff data efficiently.

---

## 📌 Features

- Guest information management
- Room booking system
- Payment and refund tracking
- Room and facility details
- Relational schema with full foreign key constraints

---

## 🧠 Entity Relationship Diagram (ERD)

Here’s the ERD used for this system:

![ERD Diagram](./erd.png) <!-- Replace with your actual image file -->

> 📎 Make sure the ERD image (e.g., `erd.png`) is placed in the root of this repository.

---

## 🗃️ Table Overview (Schema: `hotel_reservation`)

| Table               | Description                         |
|---------------------|-------------------------------------|
| `guest`             | Stores hotel guest information      |
| `reservation`       | Room reservation data               |
| `room`              | Hotel room list                     |
| `facility`          | Room facilities                     |
| `staff`             | Hotel staff details                 |
| `payment`           | Payment records                     |
| `refund`            | Refund history                      |
| `reservation_room`  | Many-to-many relationship between reservation and room |

---

## 🚀 How to Import SQL into PostgreSQL

1. Open DBeaver / pgAdmin or your preferred SQL client  
2. Create a new database (e.g., `hotel_db`)
3. Run the SQL file `erd_hotel_reservation.sql`
4. All tables and sample data will be created under the `hotel_reservation` schema

---

## 📁 Project Structure

