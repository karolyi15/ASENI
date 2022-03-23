DROP PROCEDURE IF EXISTS dbo.Aseni_SetCalificationsByUser
GO

CREATE TYPE CALIFICATION
AS TABLE 
	( IdDeliverables int
	, [Value] float)
GO
--------------------------------------------------------------------------
CREATE PROCEDURE dbo.Aseni_SetCalificationsByUser
--------------------------------------------------------------------------
-- Aseni_SetCalificationsByUser
--
-- 18-MAR-2022 (gkarolyi)
-- Created.
--
--------------------------------------------------------------------------

@IdUser int,
@IdPlan int,
@Califications CALIFICATION READONLY

AS
-- Get Current Date
DECLARE @CurrentDate datetime  = GETDATE()

BEGIN TRY
	-- Init Transaction
	BEGIN TRANSACTION
	
	-- Set Player's Califications
	INSERT INTO [dbo].[CALIFICATIONS]
           ([IdUser]
           ,[IdDeriverable]
           ,[Value]
           ,[PostTime])
    SELECT
		@IdUser, 
		IdDeliverables,
		[Value],
		@CurrentDate
	FROM @Califications

	COMMIT TRANSACTION

END TRY
BEGIN CATCH

	-- In case the transaction fails, then procedd with a rollback
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION

END CATCH
	
GO