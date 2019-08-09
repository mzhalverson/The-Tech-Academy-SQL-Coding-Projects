
CREATE PROC searchAuthor @author nvarchar(50) = NULL, @library_branch nvarchar(50) = NULL
AS 
SELECT book_title, a1.copy_number
	FROM tbl_book_copies a1
	INNER JOIN tbl_book a2 ON a2.book_id = a1.copy_book
	INNER JOIN tbl_library_branch a3 ON a3.branch_id = a1.copy_branchid
	INNER JOIN tbl_book_authors a4 ON a4.author_book = a1.copy_book
	WHERE a4.author_name LIKE '%' + ISNULL(@author,author_name) AND branch_name = ISNULL(@library_branch, branch_name)
;

