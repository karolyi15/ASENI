DROP PROCEDURE IF EXISTS dbo.Query1
GO

--------------------------------------------------------------------------
CREATE PROCEDURE dbo.Query1
--------------------------------------------------------------------------
-- Query1
/*
 Listar todos los entregables agrupados por partido para un cantón dado 
 por parámetro y cada hilo usa un cantón diferente.
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