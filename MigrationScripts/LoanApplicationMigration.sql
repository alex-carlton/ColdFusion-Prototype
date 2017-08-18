USE [ApplicationDataStore]
GO

ALTER TABLE LoanApplications ADD DOBToken UNIQUEIDENTIFIER NULL
ALTER TABLE LoanApplications ADD SSNToken UNIQUEIDENTIFIER NULL
GO

INSERT INTO [SecureDataStore].dbo.SecureDates(SecureData, SecureTypeId)
SELECT DOB, 2
FROM LoanApplications
GROUP BY DOB
EXCEPT
SELECT SecureData, SecureTypeId
FROM [SecureDataStore].dbo.SecureDates
WHERE SecureTypeId = 2

INSERT INTO [SecureDataStore].dbo.SecureTexts(SecureData, SecureTypeId)
SELECT SSN, 1
FROM LoanApplications
GROUP BY SSN
EXCEPT
SELECT SecureData, SecureTypeId
FROM [SecureDataStore].dbo.SecureTexts
WHERE SecureTypeId = 1
GO

UPDATE LoanApplications
SET DOBToken = sd.SecureDateId
FROM [SecureDataStore].dbo.SecureDates sd
WHERE sd.SecureData = LoanApplications.DOB
AND SecureTypeId = 2

UPDATE LoanApplications
SET SSNToken = st.SecureTextId
FROM [SecureDataStore].dbo.SecureTexts st
WHERE st.SecureData = LoanApplications.SSN
AND SecureTypeId = 1
GO

ALTER TABLE LoanApplications ALTER COLUMN DOBToken UNIQUEIDENTIFIER NOT NULL
ALTER TABLE LoanApplications ALTER COLUMN SSNToken UNIQUEIDENTIFIER NOT NULL

CREATE INDEX IX_LoanApplications_DOBToken ON LoanApplications (DOBToken)
CREATE INDEX IX_LoanApplications_SSNToken ON LoanApplications (SSNToken)

ALTER TABLE LoanApplications DROP COLUMN DOB
ALTER TABLE LoanApplications DROP COLUMN SSN