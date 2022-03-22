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
@ElectionYear date

AS

	-- Get
	SELECT
		CANTONS.[Name]
	FROM dbo.DELIVERABLES WITH(NOLOCK)
		JOIN dbo.CANTONS WITH(NOLOCK) ON(DELIVERABLES.IdCanton = CANTONS.IdCanton)
	WHERE DATEPART(YEAR, DELIVERABLES.PostTime) = DATEPART(YEAR, @ElectionYear)
GO