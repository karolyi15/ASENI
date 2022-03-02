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
		D.KPIValue,
		D.KPIType,
		D.EndDate
	FROM dbo.DELIVERABLES D
		JOIN dbo.PLANS P WITH(NOLOCK) ON (D.IdPlan = P.IdPlan)
	WHERE IdCanton = @IdCanton
	GROUP BY P.IdParty; 
GO