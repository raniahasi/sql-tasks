
	CREATE TABLE Teachers (
	id int primary key identity (1,1),
    teacher_id INT ,
    name VARCHAR(50),
    subject VARCHAR(50)
);


	CREATE TABLE TeacherDetails (
	id int primary key identity (1,1),
    teacher_id INT unique ,--foreign key
    phone_number VARCHAR(15),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(id)
);


    CREATE TABLE Courses (
    id int primary key identity (1,1),
	course_id INT ,
    course_name VARCHAR(50),
    teacher_id INT, --foreign key
    FOREIGN KEY (teacher_id) REFERENCES Teachers(id)
);

     CREATE TABLE Students (
    id INT PRIMARY KEY identity (1,1),
	student_id int,
    name VARCHAR(50),
    major VARCHAR(50));


	CREATE TABLE Courses_students(
	id int primary key identity (1,1),
	course_id int, --foreign key
	student_id int, -- foreign key
	foreign key (course_id) references Courses (id),
	foreign key (student_id) references Students(id));
----------------------

INSERT INTO Teachers (teacher_id, name, subject) VALUES
(1, 'John Doe', 'Mathematics'),
(2, 'Jane Smith', 'Physics'),
(3, 'Emily Davis', 'Chemistry'),
(4, 'Michael Brown', 'Biology'),
(5, 'Sarah Johnson', 'Computer Science');

INSERT INTO TeacherDetails (teacher_id, phone_number) VALUES
(1, '123-456-7890'),
(2, '234-567-8901'),
(3, '345-678-9012'),
(4, '456-789-0123'),
(5, '567-890-1234');

INSERT INTO Courses (course_id, course_name, teacher_id) VALUES
(1, 'Algebra', 1),
(2, 'Quantum Mechanics', 2),
(3, 'Organic Chemistry', 3),
(4, 'Genetics', 4),
(5, 'Data Structures', 5);


INSERT INTO Students (student_id, name, major) VALUES
(1, 'Alice', 'Mathematics'),
(2, 'Bob', 'Physics'),
(3, 'Charlie', 'Chemistry'),
(4, 'David', 'Biology'),
(5, 'Eve', 'Computer Science');



SELECT * FROM Teachers;


SELECT * FROM TeacherDetails;


SELECT * FROM Courses;


SELECT * FROM Students;