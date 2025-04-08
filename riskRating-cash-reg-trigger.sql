CREATE TRIGGER dbo.riskRatingCashRegModifiedDateUpdate ON dbo.riskRating
AFTER
INSERT,
    DELETE,
    UPDATE AS BEGIN
UPDATE r
SET MODIFIED_DATE = GETDATE()
FROM riskRatingCashReg r
    INNER JOIN inserted i ON r.ID = i.ID;
END
GO