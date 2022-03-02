DROP PROCEDURE IF EXISTS dbo.Query1
GO

--------------------------------------------------------------------------
CREATE PROCEDURE dbo.Query1
--------------------------------------------------------------------------
-- Query1
/*
 Listar todos los entregables agrupados por partido para un cant�n dado 
 por par�metro y cada hilo usa un cant�n diferente.
*/
--------------------------------------------------------------------------
@IdCanton int
AS
	
	SELECT 
		ACTIONS.[Description] + CAST(DELIVERABLES.KPIValue AS varchar(16)) + DELIVERABLES.KPIType AS [Description],
		PARTIES.[Name] AS 'Party'
	FROM dbo.DELIVERABLES 
		JOIN dbo.PLANS  WITH(NOLOCK) ON (DELIVERABLES.IdPlan = PLANS.IdPlan)
		JOIN dbo.ACTIONS WITH (NOLOCK) ON (DELIVERABLES.IdAction = ACTIONS.IdAction)
		JOIN dbo.PARTIES WITH(NOLOCK) ON (PLANS.IdParty = PARTIES.IdParty)
	WHERE IdCanton = @IdCanton
	ORDER BY PLANS.IdParty;
GO