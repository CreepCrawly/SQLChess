USE ChessClub;
GO

IF OBJECT_ID('dbo.ChessGameReset') IS NULL
  EXEC ('CREATE PROCEDURE dbo.ChessGameReset AS RETURN 0;');
GO

-- =============================================
-- Author: Pieter Powell
-- Create date: 2018-10-09
-- Description: Recreate table and insert ChessPieces
-- =============================================
ALTER PROCEDURE dbo.ChessGameReset
AS
	BEGIN
		-- DROP table if exist
		IF OBJECT_ID(N'ChessBoard',N'U') IS NOT NULL
			BEGIN
				DROP TABLE [dbo].[ChessBoard];
			END;

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

		-- CREATE table clean
		CREATE TABLE [dbo].[ChessBoard](
			[RowID] [tinyint] NOT NULL,
			[A] NVARCHAR(2) NULL,
			[B] NVARCHAR(2) NULL,
			[C] NVARCHAR(2) NULL,
			[D] NVARCHAR(2) NULL,
			[E] NVARCHAR(2) NULL,
			[F] NVARCHAR(2) NULL,
			[G] NVARCHAR(2) NULL,
			[H] NVARCHAR(2) NULL
		) ON [PRIMARY]
		
		--INSERT data to reset board
		INSERT INTO [dbo].[ChessBoard](
		    [RowID],
			[A],
			[B],
			[C],
			[D],
			[E],
			[F],
			[G],
			[H]
		) VALUES
		 ('1','3','5','4','2','1','4','5','3')
		,('2','6','6','6','6','6','6','6','6')
		,('3','0','0','0','0','0','0','0','0')
		,('4','0','0','0','0','0','0','0','0')
		,('5','0','0','0','0','0','0','0','0')
		,('6','0','0','0','0','0','0','0','0')
		,('7','12','12','12','12','12','12','12','12')
		,('8','9','11','10','8','7','10','11','9')
	END