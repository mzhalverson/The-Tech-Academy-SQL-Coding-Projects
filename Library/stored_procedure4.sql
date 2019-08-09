
CREATE PROCEDURE checkDueToday @library_branch nvarchar(50) = NULL
AS 
SELECT book_title, borrower_name, borrower_address
	FROM tbl_book_loans a1
	INNER JOIN tbl_book a2 ON a2.book_id = loan_book
	INNER JOIN tbl_borrower a3 ON a3.borrower_id = loan_borrower
	INNER JOIN tbl_library_branch a4 ON a4.branch_id = loan_branchid
	WHERE loan_datedue = GETDATE() AND branch_name = ISNULL(@library_branch, branch_name)
;