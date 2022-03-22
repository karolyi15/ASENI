DROP PROCEDURE IF EXISTS dbo.Aseni_ListCantonsByDeliverables
GO
--------------------------------------------------------------------------
CREATE PROCEDURE dbo.Aseni_ListCantonsByDeliverables
--------------------------------------------------------------------------
-- Aseni_ListCantonsByDeliverables
--
-- 18-MAR-2022 (gkarolyi)
-- Created.
--
--------------------------------------------------------------------------
@ElectionDate date

AS

	SELECT
		CANTONS.[Name]
	FROM dbo.DELIVERABLES WITH(NOLOCK)
		JOIN dbo.CANTONS WITH(NOLOCK) ON(DELIVERABLES.IdCanton = CANTONS.IdCanton)
	WHERE DELIVERABLES.PostTime <= DATEADD(DAY, 100, @ElectionDate)
	EXCEPT
	SELECT
		CANTONS.[Name]
	FROM dbo.DELIVERABLES WITH(NOLOCK)
		JOIN dbo.CANTONS WITH(NOLOCK) ON(DELIVERABLES.IdCanton = CANTONS.IdCanton)
	WHERE DELIVERABLES.PostTime >= DATEADD(DAY, -100,DATEADD(YEAR, 4, @ElectionDate))
GO