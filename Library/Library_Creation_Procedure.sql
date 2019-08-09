
CREATE PROCEDURE createLibraryDB
AS
BEGIN

	CREATE TABLE tbl_library_branch (
		branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		branch_name VARCHAR(50) NOT NULL,
		branch_address VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_publisher (
		publisher_name VARCHAR(50) PRIMARY KEY NOT NULL,
		publisher_address VARCHAR(50) NOT NULL,
		publisher_phone VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_book (
		book_id INT PRIMARY KEY NOT NULL IDENTITY (5001,1),
		book_title VARCHAR(50) NOT NULL,
		book_publisher VARCHAR(50) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
	);

	CREATE TABLE tbl_book_authors (
		author_book INT PRIMARY KEY NOT NULL CONSTRAINT fk_bookTOauthor_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
		author_name VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_book_copies (
		copy_id INT PRIMARY KEY NOT NULL IDENTITY (20000,10),
		copy_book INT NOT NULL CONSTRAINT fk_bookTOcopy_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
		copy_branchid INT NOT NULL CONSTRAINT fk_branchTOcopy_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
		copy_number INT NOT NULL
	);

	CREATE TABLE tbl_borrower (
		borrower_id INT PRIMARY KEY NOT NULL IDENTITY (100500,10),
		borrower_name VARCHAR(50) NOT NULL,
		borrower_address VARCHAR(50) NOT NULL,
		borrower_phone VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_book_loans (
		loan_id INT PRIMARY KEY NOT NULL IDENTITY (101,1),
		loan_book INT NOT NULL CONSTRAINT fk_bookTOloan_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
		loan_branchid INT NOT NULL CONSTRAINT fk_branchTOloan_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
		loan_borrower INT NOT NULL CONSTRAINT fk_borrowerTOloan_id FOREIGN KEY REFERENCES tbl_borrower(borrower_id) ON UPDATE CASCADE ON DELETE CASCADE,
		loan_dateout DATE NOT NULL,
		loan_datedue DATE NOT NULL
	);


	INSERT INTO tbl_library_branch
		(branch_name, branch_address)
		VALUES 
		('Sharpstown', '456 C St, Sharpstown'),
		('Central', '5 Main St, Portland'),
		('Petaluma','128 Kennedy St, Petaluma'),
		('Downtown','732 I St, Sunnydale')
	;

	SELECT * FROM tbl_library_branch;

	INSERT INTO tbl_publisher
		(publisher_name, publisher_address, publisher_phone)
		VALUES
		('Picador', '175 5th Avenue, New York', '800-221-7945'),
		('Penguin Books', '1745 Broadway, New York', '800-793-2665'),
		('Penguin Classics', '1745 Broadway, New York', '800-793-2665'),
		('HarperCollins', '201 California St, San Francisco', '212-207-7000'),
		('Jonathan Cape', '1745 Broadway, New York', '800-793-2665'),
		('Viking Press', '1745 Broadway, New York', '800-793-2665'),
		('Doubleday', '1745 Broadway, New York', '800-793-2665'),
		('Bloomsbury', '1385 Broadway, New York', '800-932-4724'),
		('Simon & Schuster', '1230 Avenue of the Americas, New York', '212-698-7000'),
		('Grand Central Publishing', '1290 Avenue of the Americas, New York', '212-364-1200'),
		('Regnery Publishing', '300 New Jersey Ave NW, Washington, DC', '202-216-0600'),
		('DAW Books', '1745 Broadway, New York', '800-793-2665')
	;

	SELECT * FROM tbl_publisher;

	INSERT INTO tbl_book
		(book_title, book_publisher)
		VALUES
		('The Lost Tribe', 'Picador'),
		('1984', 'Penguin Books'),
		('Pride and Prejudice', 'Penguin Classics'),
		('Atonement', 'Jonathan Cape'),
		('Oliver Twist', 'Penguin Classics'),
		('It', 'Viking Press'),
		('The Shining', 'Doubleday'),
		('Mansfield Park', 'Bloomsbury'),
		('Macbeth', 'Simon & Schuster'),
		('Girl, Stop Apologizing', 'HarperCollins'),
		('Harry Potter and the Goblet of Fire', 'Bloomsbury'),
		('Message in a Bottle', 'Grand Central Publishing'),
		('Murder on the Orient Express', 'HarperCollins'),
		('American Gods', 'HarperCollins'),
		('Life After Google', 'Regnery Publishing'),
		('State of Fear', 'HarperCollins'),
		('Name of the Wind', 'DAW Books'),
		('Norse Mythology', 'Bloomsbury'),
		('Alice''s Adventures in Wonderland', 'Simon & Schuster'),
		('Peter Pan', 'Simon & Schuster')
	;

	SELECT * FROM tbl_book;

	INSERT INTO tbl_book_authors
		(author_book, author_name)
		VALUES
		(5013, 'Agatha Christie'),
		(5014, 'Neil Gaiman'),
		(5015, 'George Gilder'),
		(5016, 'Michael Crichton'),
		(5017, 'Patrick Rothfuss'),
		(5018, 'Neil Gaiman'),
		(5019, 'Lewis Carroll'),
		(5020, 'Jim Barrie'),
		(5001, 'Mark Lee'),
		(5002, 'George Orwell'),
		(5003, 'Jane Austen'),
		(5004, 'Ian McEwan'),
		(5005, 'Charles Dickens'),
		(5006, 'Stephen King'),
		(5007, 'Stephen King'),
		(5008, 'Jane Austen'),
		(5009, 'William Shakespeare'),
		(5010, 'Rachael Hollis'),
		(5011, 'J.K. Rowling'),
		(5012, 'Nicholas Sparks')
	;

	SELECT * FROM tbl_book_authors;

	INSERT INTO tbl_book_copies
		(copy_book, copy_branchid, copy_number)
		VALUES
		(5010, 3, 4),
		(5001, 3, 2),
		(5003, 3, 2),
		(5004, 3, 5),
		(5007, 3, 3),
		(5011, 3, 3),
		(5013, 3, 4),
		(5018, 3, 2),
		(5019, 3, 4),
		(5020, 3, 2),
		(5011, 4, 4),
		(5002, 4, 2),
		(5004, 4, 2),
		(5005, 4, 5),
		(5008, 4, 3),
		(5012, 4, 3),
		(5014, 4, 4),
		(5019, 4, 2),
		(5020, 4, 4),
		(5016, 4, 2),
		(5012, 1, 4),
		(5003, 1, 2),
		(5005, 1, 2),
		(5006, 1, 5),
		(5009, 1, 3),
		(5013, 1, 3),
		(5015, 1, 4),
		(5020, 1, 2),
		(5014, 1, 4),
		(5017, 1, 2),
		(5013, 2, 4),
		(5004, 2, 2),
		(5006, 2, 2),
		(5007, 2, 5),
		(5010, 2, 3),
		(5014, 2, 3),
		(5002, 2, 4),
		(5001, 2, 2),
		(5015, 2, 4),
		(5018, 2, 2),
		(5001, 1, 3)
	;


	SELECT * FROM tbl_book_copies;

	INSERT INTO tbl_borrower
		(borrower_name, borrower_address, borrower_phone)
		VALUES
		('Jim Kale', '734 Elm Circle', '555-555-5555'),
		('Bob Nancy', '8340 B Street', '348-234-3402'),
		('Sally Hall', '123 Hamilton Court', '385-298=5839'),
		('Tilly Tell', '458 Poplar Avenue', '349-565-5648'),
		('Dennis Fields', '999 Redwood Highway', '686-835-5648'),
		('Terry Smith', '666 Happy Boulevard', '324-564-6582'),
		('Samantha Jones', '42 Perfect Avenue', '324-763-3254'),
		('Carrie Bradshaw', '847 Main Street', '248-325-6543')
	;

	SELECT * FROM tbl_borrower;


	INSERT INTO tbl_book_loans
		(loan_branchid, loan_borrower, loan_book, loan_dateout, loan_datedue)
		VALUES
		(1, 100500, 5012, '2019-05-25', '2019-06-25'),
		(1, 100500, 5003, '2019-05-25', '2019-06-25'),
		(1, 100500, 5005, '2019-05-25', '2019-06-25'),
		(1, 100500, 5006, '2019-05-25', '2019-06-25'),
		(1, 100500, 5009, '2019-06-11', '2019-07-11'),
		(1, 100500, 5013, '2019-06-11', '2019-07-11'),
		(1, 100520, 5017, '2019-07-04', '2019-08-04'),
		(1, 100520, 5014, '2019-07-04', '2019-08-04'),
		(1, 100520, 5005, '2019-07-04', '2019-08-04'),
		(1, 100530, 5006, '2019-07-20', '2019-08-20'),
		(1, 100530, 5013, '2019-07-20', '2019-08-20'),
		(1, 100530, 5020, '2019-07-20', '2019-08-20'),
		(2, 100510, 5013, '2019-06-30', '2019-07-30'),
		(2, 100510, 5004, '2019-06-30', '2019-07-30'),
		(2, 100510, 5006, '2019-06-30', '2019-07-30'),
		(2, 100510, 5007, '2019-06-30', '2019-07-30'),
		(2, 100510, 5010, '2019-06-30', '2019-07-30'),
		(2, 100510, 5014, '2019-06-30', '2019-07-30'),
		(2, 100510, 5002, '2019-06-30', '2019-07-30'),
		(2, 100510, 5001, '2019-06-30', '2019-07-30'),
		(2, 100510, 5015, '2019-06-30', '2019-07-30'),
		(2, 100510, 5018, '2019-06-30', '2019-07-30'),
		(2, 100530, 5004, '2019-06-12', '2019-07-12'),
		(2, 100530, 5002, '2019-06-12', '2019-07-12'),
		(3, 100540, 5018, '2019-07-19', '2019-08-19'),
		(3, 100540, 5010, '2019-07-19', '2019-08-19'),
		(3, 100540, 5001, '2019-07-19', '2019-08-19'),
		(3, 100540, 5003, '2019-07-19', '2019-08-19'),
		(3, 100540, 5007, '2019-07-19', '2019-08-19'),
		(3, 100540, 5011, '2019-07-19', '2019-08-19'),
		(3, 100550, 5020, '2019-07-02', '2019-08-02'),
		(3, 100550, 5011, '2019-07-02', '2019-08-02'),
		(3, 100550, 5018, '2019-07-02', '2019-08-02'),
		(3, 100550, 5003, '2019-07-02', '2019-08-02'),
		(3, 100550, 5013, '2019-07-02', '2019-08-02'),
		(3, 100560, 5019, '2019-07-31', '2019-08-30'),
		(4, 100560, 5011, '2019-05-28', '2019-06-28'),
		(4, 100560, 5002, '2019-05-28', '2019-06-28'),
		(4, 100560, 5004, '2019-05-28', '2019-06-28'),
		(4, 100560, 5005, '2019-05-28', '2019-06-28'),
		(4, 100560, 5008, '2019-05-28', '2019-06-28'),
		(4, 100560, 5012, '2019-05-28', '2019-06-28'),
		(4, 100560, 5014, '2019-05-28', '2019-06-28'),
		(4, 100560, 5019, '2019-05-28', '2019-06-28'),
		(4, 100560, 5020, '2019-05-28', '2019-06-28'),
		(4, 100560, 5016, '2019-05-28', '2019-06-28'),
		(4, 100570, 5014, '2019-06-22', '2019-07-22'),
		(4, 100570, 5002, '2019-06-22', '2019-07-22'),
		(4, 100570, 5020, '2019-06-22', '2019-07-22'),
		(4, 100570, 5011, '2019-06-22', '2019-07-22')
	;

	SELECT * FROM tbl_book_loans;


/*


	SELECT 
		a1.species_name, a2.animalia_type,
		a3.class_type, a4.order_type, a5.habitat_type,
		a6.nutrition_type, a7.care_type
		FROM tbl_species a1
		INNER JOIN tbl_animalia a2 ON a2.animalia_id = species_animalia
		INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
		INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
		INNER JOIN tbl_habitat a5 ON a5.habitat_id = a1.species_habitat
		INNER JOIN tbl_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
		INNER JOIN tbl_care a7 ON a7.care_id = a1.species_care
		WHERE species_name = 'ghost bat'
	;

	SELECT 
		a1.species_name, a2.habitat_type, a2.habitat_cost,
		a3.nutrition_type, a3.nutrition_cost
		FROM tbl_species a1
		INNER JOIN tbl_habitat a2 ON a2.habitat_id = species_habitat
		INNER JOIN tbl_nutrition a3 ON a3.nutrition_id = a1.species_nutrition
		WHERE species_name = 'ghost bat'
	;
*/
END







