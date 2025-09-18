# LibrarySystem

**LibrarySystem** is a university project — a **Java EE 6 web application** that implements a simple library management system.  
It was built using **Servlets, JSP, and MySQL** to demonstrate how enterprise Java technologies can be used for database-driven applications.  

---

## Features

- 📚 **Book management** – add new titles, edit existing entries, delete books, and search by title/author  
- 👥 **Borrower management** – register new library members and view their details  
- 🔄 **Loan handling** – lend books to members and register returns  
- 🌐 **Browser-based interface** – JSP front-end served by Java Servlets  

---

## Tech Stack

- **Java EE 6** – Servlets (3.0), JSP  
- **Server** – tested on Apache Tomcat 7 and GlassFish 3.x  
- **Database** – MySQL 5.x (JDBC connection)  
- **Frontend** – JSP + CSS (basic styling)  
- **IDE** – Eclipse IDE for Enterprise Java Developers  

---

## Setup & Installation

1. Clone the repo:
   ```bash
   git clone https://github.com/Splendorius/LibrarySystem.git
2. Open the project in Eclipse (Enterprise Edition).

3. Configure your database:
  Create a database named librarydb in MySQL. 
  Add tables for books, borrowers, and loans.
  Update JDBC settings (user, password, URL) in the project.
  
  Example JDBC config:
```xml
    <property name="javax.persistence.jdbc.driver" value="com.mysql.cj.jdbc.Driver"/>
    <property name="javax.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/librarydb"/>
    <property name="javax.persistence.jdbc.user" value="root"/>
    <property name="javax.persistence.jdbc.password" value="yourpassword"/>
```
  
4. Deploy to a server:
  Add the project to Tomcat 7+ or GlassFish 3.x in Eclipse.
  Run the project on the server.

5. Access in browser:
  http://localhost:8080/LibrarySystem
