# 🌿 GreenEcoHeaven

**GreenEcoHeaven** is a basic organic e-commerce platform built using **JSP/Servlet**, **JDBC**, and **MySQL**. This project demonstrates a complete web-based shopping system with user and admin functionalities.

---

## 🚀 Features

- 🛒 Shopping cart management
- 👥 User registration and login
- 🧑‍💼 Admin dashboard to manage products and users
- 🔍 Product search functionality
- 📦 Product detail view
- 🧾 Simple order placement
- 📊 Order management (Admin)

---

## 🛠️ Technologies Used

| Technology   | Description                          |
|--------------|--------------------------------------|
| Java Servlet | Backend logic handling               |
| JSP          | Dynamic web pages                    |
| JDBC         | Database connectivity                |
| MySQL        | Relational database                  |
| JSTL         | Tag library for JSP processing       |
| Bootstrap    | Responsive and modern UI framework   |

---

## 📁 Project Structure
```
GreenEcoHeaven/
├── src/
│ ├── controller/ # Servlets
│ ├── dao/ # Data Access Objects
│ ├── model/ # Data models/entities
├── web/
│ ├── view/ # JSP views
│ │ ├── admin/
│ │ ├── user/
│ ├── image/ # Product images
├── WebContent/
│ ├── css/, js/, fonts/ # Frontend assets
├── sql/
│ └── greeneco.sql # Database structure & sample data
└── README.md
```

---

## ▶️ Getting Started

```bash
git clone https://github.com/WindDiFbt/GreenEcoHeaven.git
```
- Use IntelliJ IDEA or Eclipse.
- Update the database connection in dao/DBcontext.java.
- Deploy with Apache Tomcat 10 or later.

MIT © WindDiFbt
