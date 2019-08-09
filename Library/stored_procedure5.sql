
CREATE PROCEDURE loanedOut
AS 
SELECT count(*) AS 'Number of Loans:', a2.branch_name AS 'Branch:'
	FROM tbl_book_loans a1
	INNER JOIN tbl_library_branch a2 ON a2.branch_id = a1.loan_branchid
	GROUP BY a2.branch_name
;