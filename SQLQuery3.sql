
CREATE TABLE Authors (
    id INT PRIMARY KEY IDENTITY (1,1),
    name VARCHAR(50)
);


CREATE TABLE Sections (
    id INT PRIMARY KEY IDENTITY (1,1),
    section_name VARCHAR(50)
);


CREATE TABLE Categories (
    id INT PRIMARY KEY IDENTITY (1,1),
    category_name VARCHAR(50)
);


CREATE TABLE Employees (
    id INT PRIMARY KEY IDENTITY (1,1),
    employee_name VARCHAR(50),
    position VARCHAR(50)
);


CREATE TABLE Users (
    id INT PRIMARY KEY IDENTITY (1,1),
    userName VARCHAR(50)
);


CREATE TABLE Books (
    id INT PRIMARY KEY IDENTITY (1,1),
    title VARCHAR(50),
    author_id INT,
    category_id INT,
    section_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(id),
    FOREIGN KEY (category_id) REFERENCES Categories(id),
    FOREIGN KEY (section_id) REFERENCES Sections(id)
);

-
CREATE TABLE User_Books (
    id INT PRIMARY KEY IDENTITY (1,1),
    book_id INT,
    userId INT,
    FOREIGN KEY (book_id) REFERENCES Books(id),
    FOREIGN KEY (userId) REFERENCES Users(id)
);


INSERT INTO Authors (name) VALUES
('J.K. Rowling'),
('George R.R. Martin'),
('J.R.R. Tolkien'),
('Agatha Christie'),
('Stephen King');


INSERT INTO Sections (section_name) VALUES
('Fiction'),
('Non-Fiction'),
('Science Fiction'),
('Mystery'),
('Horror');

-
INSERT INTO Categories (category_name) VALUES
('Fantasy'),
('Adventure'),
('Thriller'),
('Romance'),
('Biography');


INSERT INTO Employees (employee_name, position) VALUES
('Alice', 'Librarian'),
('Bob', 'Assistant Librarian'),
('Charlie', 'Administrator'),
('David', 'Janitor'),
('Eve', 'Security');


INSERT INTO Users (userName) VALUES
('John Doe'),
('Jane Smith'),
('Michael Brown'),
('Emily Davis'),
('David Wilson');


INSERT INTO Books (title, author_id, category_id, section_id) VALUES
('Harry Potter', 1, 1, 1),
('A Game of Thrones', 2, 2, 1),
('The Hobbit', 3, 1, 3),
('Murder on the Orient Express', 4, 3, 4),
('The Shining', 5, 4, 5);


INSERT INTO User_Books (book_id, userId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


SELECT * FROM Authors;
SELECT * FROM Sections;
SELECT * FROM Categories;
SELECT * FROM Employees;
SELECT * FROM Users;
SELECT * FROM Books;
SELECT * FROM User_Books;


SELECT Books.title, Authors.name
FROM Books
INNER JOIN Authors ON Books.author_id = Authors.id;


SELECT Books.title, Authors.name
FROM Books
LEFT JOIN Authors ON Books.author_id = Authors.id;


SELECT Books.title, Authors.name
FROM Books
RIGHT JOIN Authors ON Books.author_id = Authors.id;


SELECT Books.title, Authors.name
FROM Books
FULL JOIN Authors ON Books.author_id = Authors.id;


SELECT Users.userName, Books.title
FROM User_Books
INNER JOIN Users ON User_Books.userId = Users.id
INNER JOIN Books ON User_Books.book_id = Books.id;

SELECT Users.userName, Books.title
FROM User_Books
LEFT JOIN Users ON User_Books.userId = Users.id
LEFT JOIN Books ON User_Books.book_id = Books.id;

SELECT Users.userName, Books.title
FROM User_Books
FULL JOIN Users ON User_Books.userId = Users.id
FULL JOIN Books ON User_Books.book_id = Books.id;
