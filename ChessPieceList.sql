USE ChessClub;

IF OBJECT_ID(N'ChessPiecesList',N'U') IS NOT NULL
			BEGIN
				DROP TABLE [dbo].[ChessPiecesList];
			END;

CREATE TABLE dbo.ChessPiecesList(
[ID] tinyint not null,
[Icon] nvarchar(5) not null,
[Color] nvarchar(5) not null,
[Name] nvarchar(15) not null
);

INSERT INTO dbo.ChessPiecesList([ID],[Icon],[Color],[Name])
          SELECT 1 AS ID, N'♔' AS Icon, 'White' AS Color, 'King' AS [Name]
UNION ALL SELECT 2 AS ID, N'♕' AS Icon, 'White' AS Color, 'Queen' AS [Name]
UNION ALL SELECT 3  AS ID, N'♖' AS Icon, 'White' AS Color, 'Rooks' AS [Name]
UNION ALL SELECT 4  AS ID, N'♗' AS Icon, 'White' AS Color, 'Bishops' AS [Name]
UNION ALL SELECT 5  AS ID, N'♘' AS Icon, 'White' AS Color, 'Knights' AS [Name]
UNION ALL SELECT 6  AS ID, N'♙' AS Icon, 'White' AS Color, 'Pawns' AS [Name]
UNION ALL SELECT 7  AS ID, N'♚' AS Icon, 'Black' AS Color, 'King' AS [Name]
UNION ALL SELECT 8  AS ID, N'♛' AS Icon, 'Black' AS Color, 'Queen' AS [Name]
UNION ALL SELECT 9  AS ID, N'♜' AS Icon, 'Black' AS Color, 'Rooks' AS [Name]
UNION ALL SELECT 10  AS ID, N'♝' AS Icon, 'Black' AS Color, 'Bishops' AS [Name]
UNION ALL SELECT 11  AS ID, N'♞' AS Icon, 'Black' AS Color, 'Knights' AS [Name]
UNION ALL SELECT 12  AS ID, N'♟' AS Icon, 'Black' AS Color, 'Pawns' AS [Name];
