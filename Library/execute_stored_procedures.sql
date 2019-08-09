

/* STORED PROCEDURE 1 */
EXEC [dbo].[copiesAtLocation] @book_title = 'The Lost Tribe', @library_branch = 'Sharpstown';


/* STORED PROCEDURE 2 */
EXEC [dbo].[copiesAtLocation] @book_title = 'The Lost Tribe';


/* STORED PROCEDURE 3 */
EXEC [dbo].[noLoans] 


/* STORED PROCEDURE 4 */
EXEC [dbo].[checkDueToday] @library_branch = 'Sharpstown';


/* STORED PROCEDURE 5 */
EXEC [dbo].[loanedOut];


/* STORED PROCEDURE 6 */
EXEC [dbo].[fiveOrMoreBooks];


/* STORED PROCEDURE 7 */
EXEC [dbo].[searchAuthor] @author = 'Stephen King', @library_branch = 'Central';


