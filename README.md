# Sales Management System

A Java Swing desktop application for managing sales operations for a medical equipment manufacturer: customers, staff, equipment, orders and returns. Built as a team project at SETU Carlow in Year 2, for Object-Oriented Software Development (77%) and System Analysis & Testing.

The system is designed for a manufacturer whose customers (hospitals and clinics) order equipment such as scrubs, bedpans and scalpels in bulk and return faulty items, and whose staff manage orders and returns and investigate faulty batches.

## Features

- Login screen and main menu
- Create, view, update and delete records for customers, staff, equipment, orders and order returns, stored in MySQL
- Input validation in the GUI (letters-only, numbers-only and decimal-only fields)

## Tech

- Java and Swing (desktop GUI)
- MySQL
- JDBC with parameterised queries (`PreparedStatement`) through MySQL Connector/J 9.2.0

## Analysis and design

The full analysis is in [`docs/SystemAnalysis.pdf`](docs/SystemAnalysis.pdf). It contains:

- **System summary** of what the system does for customers and manufacturer staff
- **User stories** with functional and non-functional acceptance questions
- **Use case diagram** and typical scenarios
- **Class diagram**
- **Sequence diagrams** for ordering, returns, reordering and admin login, plus a message table for reporting faulty items
- **Test cases** for the main workflows

<!-- CHECK: the analysis covers a wider scope than the application. Confirm which designed features the app really implements (for example reports, delivery tracking, customer feedback) and adjust this note. -->
The analysis covers a wider scope than the current application. The Swing app implements a subset of the design (login and record management); other designed features, such as reports, delivery tracking and customer feedback, are not implemented.

### User stories

| ID | Story | Summary |
|----|-------|---------|
| STK001 | Customer Order | Browse, select and order equipment in bulk |
| STK002 | Staff Management | Staff manage orders, process returns and investigate faulty products |
| STK003 | Hospital | Place and edit an order with a running total, so stock is always adequate |
| STK004 | Returns | Return faulty items for credit or replacement and track the request |
| STK005 | Feedback and complaints | Staff view, respond to and escalate customer feedback |

### Use cases

Browse catalogue (C001), equipment type (C002), orders (O001), delivery (D001), return faulty equipment (RF002) and reports (R002).

### Test cases

| ID | Test |
|----|------|
| TC-01 | Place an order |
| TC-02 | Search for equipment by type |
| TC-03 | Track order status |
| TC-04 | Return faulty equipment |
| TC-05 | Generate sales reports |

## Project structure

```
src/    Java source files (GUI and database layer)
db/     MySQL scripts to create the database
docs/   System analysis, project documentation and API documentation
```

## Getting started

**Prerequisites:** a recent JDK, a running MySQL server, and [MySQL Connector/J 9.2.0](https://dev.mysql.com/downloads/connector/j/) (download the platform-independent version and put the `.jar` in a `lib/` folder).

1. **Create the database.** Run `db/SalesSystem.sql` in MySQL to create the `SalesSystem` database and its tables.
2. **Set your database login.** Open `src/GenericDatabaseManager.java` and set the database URL, username and password to match your MySQL setup. The values in the code are placeholders.
3. **Compile.**
   ```
   javac -cp lib/mysql-connector-j-9.2.0.jar -d out src/*.java
   ```
4. **Run** (use `;` instead of `:` on Windows).
   ```
   java -cp out:lib/mysql-connector-j-9.2.0.jar loginPage
   ```

<!-- CHECK before publishing: confirm loginPage is the class with main(), that the credentials really live in GenericDatabaseManager.java, and that these steps work on a clean machine. Then delete this comment. -->

## Team and contributions

Built as a team project by Mantas Bielevicius and Szymon Stepniak, with teammates from SETU Carlow.

**Analysis phase**
- Mantas Bielevicius: system summary, user stories and test cases
- Szymon Stepniak: use cases and typical scenarios
- Both: class and sequence diagrams

**Implementation**
- Mantas Bielevicius: mainly the backend, meaning the MySQL/JDBC database layer, including a reusable parameterised update method used for customer, staff, equipment, order and return records

<!-- CHECK: name the specific files you wrote, for example "GenericDatabaseManager.java and Operations.java", and add what the other team members built if you know it. -->
