![j6](https://github.com/patidarsakshu/Java--Diary/assets/103515914/a67b738a-a5d6-47f8-9b1d-11c8b91481d1)
![j5](https://github.com/patidarsakshu/Java--Diary/assets/103515914/1bd717ee-0acf-4981-b2df-c0c2479cf4c6)
![j4](https://github.com/patidarsakshu/Java--Diary/assets/103515914/1341d7fd-0461-466a-ae2e-1d9f64e8bd8f)
![j3](https://github.com/patidarsakshu/Java--Diary/assets/103515914/eaeb1f8a-19f0-4eed-a9c0-3a13626f3e91)
![j2](https://github.com/patidarsakshu/Java--Diary/assets/103515914/6510c506-895e-4db7-aa9c-7da973303c8b)
![j1](https://github.com/patidarsakshu/Java--Diary/assets/103515914/90b02ab4-4e92-472f-a022-003c63437f5e)


# Java Diary

A simple Java-based web application for managing and displaying notes. This project allows users to add, edit, and delete notes, providing a straightforward way to keep track of personal thoughts and tasks.

## Features

- **User Registration & Login**: Users can register, log in, and manage their sessions.
- **Add Notes**: Logged-in users can add new notes with a title and content.
- **Edit Notes**: Users can edit their existing notes.
- **Delete Notes**: Users can delete their notes.
- **View Notes**: Users can view a list of all their notes.

## Technologies Used

- **Java**: Core programming language used.
- **JSP**: Java Server Pages for the web interface.
- **Servlets**: Java Servlets for handling business logic.
- **MySQL**: Database for storing user and note data.
- **Bootstrap**: For styling the web pages.

## Project Structure

- **`src/com/User/`**: Contains user and post-related classes.
  - `Post.java`: Represents a note with an ID, title, content, date, and associated user.
  - `UserDetails.java`: Represents user information with ID, name, email, and password.
  
- **`webapp/`**: Contains JSP pages and web resources.
  - `addNotes.jsp`: Form to add new notes.
  - `edit.jsp`: Form to edit existing notes.
  - `home.jsp`: Home page displaying note management options.
  - `login.jsp`: Login page for user authentication.
  - `register.jsp`: Registration page for new users.
  - `showNotes.jsp`: Displays a list of all notes.

- **`src/com/DAO/`**: Contains Data Access Object (DAO) classes for database operations.
  - `PostDAO.java`: Handles CRUD operations for notes.

- **`src/com/Servlet/`**: Contains servlet classes for handling HTTP requests.
  - `AddNotesServlet.java`: Handles note addition.
  - `NoteEditServlet.java`: Handles note editing.
  - `DeleteServlet.java`: Handles note deletion.

- **`src/com/Db/`**: Contains database connection utility.
  - `DBConnect.java`: Provides methods to connect to the MySQL database.

## Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/java-diary.git
 2   Configure Database:
        Create a MySQL database and configure the connection details in DBConnect.java.

 3  Deploy the Application:
        Deploy the project to a Java EE server such as Apache Tomcat.

 4   Access the Application:
        Open your web browser and go to http://localhost:8080/java-diary.

How to Use

    Register: Go to the registration page and create a new user account.
    Login: Use your credentials to log in.
    Add Notes: Once logged in, go to the 'Add Notes' page to create new notes.
    Edit Notes: Edit existing notes from the list of notes.
    Delete Notes: Remove notes you no longer need from the list.


   **** Setup Guide*****

1    Clone the Repository

    First, clone the repository to your local machine using Git:

    bash

git clone https://github.com/your-username/java-diary.git

2   Navigate into the project directory:

bash

cd java-diary

3    Install Required Software

    Ensure you have the following installed:

    Java Development Kit (JDK): Version 8 or higher.
    Apache Tomcat: For deploying the web application.
    MySQL: For the database.
    MySQL Connector/J: JDBC driver for MySQL.

4   Configure Database

    Create a Database: Open MySQL Workbench or use the command line to create a new database:

    sql Query 

CREATE DATABASE java_diary;

Create Database Tables: Run the following SQL commands to set up the necessary tables:

sql

USE java_diary;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE notes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

** Configure Database Connection: Open src/com/Db/DBConnect.java and update the database connection details with your MySQL credentials: **

java

    private static final String URL = "jdbc:mysql://localhost:3306/java_diary";
    private static final String USER = "your-username";
    private static final String PASSWORD = "your-password";

**Set Up Apache Tomcat**

    Download Apache Tomcat: Download the appropriate version from Apache Tomcat's official website.

    Deploy the Application: Copy the WAR file (generated after building the project) to the webapps directory of your Tomcat installation. If you’re using an IDE like Eclipse, you can also deploy the project directly to Tomcat from within the IDE.

Build the Project

If you are using an IDE like Eclipse:

    Import the project as a Dynamic Web Project.
    Ensure all dependencies are included and configured properly.

If using command line:

    Ensure you have Maven or Gradle configured if your project uses them. Run the appropriate build command, e.g., mvn clean install or gradle build, to generate the WAR file.

Start Tomcat Server

    Navigate to the bin directory of your Tomcat installation and start the server:

    bash

    cd /path/to/tomcat/bin
    ./startup.sh  # For Unix/Linux/Mac
    startup.bat   # For Windows

Access the Application

Open your web browser and go to:

bash

    http://localhost:8080/java-diary

    Troubleshooting
        Database Connection Issues: Ensure that the database server is running and that the connection details in DBConnect.java are correct.
        Deployment Issues: Check the logs directory in your Tomcat installation for any error messages that might help diagnose deployment problems.

This guide should help you get your Java Diary application up and running. Let me know if you need more details or run into any issues!
