
CREATE PROCEDURE fiveOrMoreBooks 
AS 
SELECT a1.borrower_name, a1.borrower_address, COUNT(a2.loan_book)
	FROM tbl_borrower a1
	INNER JOIN tbl_book_loans a2 ON a2.loan_borrower = a1.borrower_id
	GROUP BY a1.borrower_name, a1.borrower_address
	HAVING COUNT(a2.loan_book) >= 5
;