

CREATE PROCEDURE copiesAtLocation @book_title nvarchar(50) = NULL, @library_branch nvarchar(50) = NULL
AS
SELECT a3.copy_number AS 'Number of Copies:', a2.branch_name AS 'Branch:'
	FROM tbl_book_copies a3
	INNER JOIN tbl_book a1 ON a1.book_id = a3.copy_book
	INNER JOIN tbl_library_branch a2 ON a2.branch_id = a3.copy_branchid
	WHERE book_title = ISNULL(@book_title,book_title) AND branch_name = ISNULL(@library_branch,branch_name)


