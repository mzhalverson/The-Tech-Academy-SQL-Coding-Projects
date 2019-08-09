
CREATE PROC noLoans
AS 
SELECT borrower_name
	FROM tbl_book_loans a1
	LEFT JOIN tbl_borrower a2 ON a2.borrower_id = a1.loan_borrower
	WHERE a2.borrower_id IS NULL
;