USE [ApplicationDataStore]
GO

ALTER TABLE LoanApplications_Unmigrated ADD DOBToken BIGINT NULL
ALTER TABLE LoanApplications_Unmigrated ADD SSNToken BIGINT NULL
GO

INSERT INTO [SecureDataStore].dbo.SecureDates(SecureData, SecureTypeId)
SELECT DOB, 2
FROM LoanApplications_Unmigrated
GROUP BY DOB
EXCEPT
SELECT SecureData, SecureTypeId
FROM [SecureDataStore].dbo.SecureDates
WHERE SecureTypeId = 2

INSERT INTO [SecureDataStore].dbo.SecureTexts(SecureData, SecureTypeId)
SELECT SSN, 1
FROM LoanApplications_Unmigrated
GROUP BY SSN
EXCEPT
SELECT SecureData, SecureTypeId
FROM [SecureDataStore].dbo.SecureTexts
WHERE SecureTypeId = 1
GO

UPDATE LoanApplications_Unmigrated
SET DOBToken = sd.SecureDateId
FROM [SecureDataStore].dbo.SecureDates sd
WHERE sd.SecureData = LoanApplications_Unmigrated.DOB
AND SecureTypeId = 2

UPDATE LoanApplications_Unmigrated
SET SSNToken = st.SecureTextId
FROM [SecureDataStore].dbo.SecureTexts st
WHERE st.SecureData = LoanApplications_Unmigrated.SSN
AND SecureTypeId = 1
GO

ALTER TABLE LoanApplications_Unmigrated ALTER COLUMN DOBToken BIGINT NOT NULL
ALTER TABLE LoanApplications_Unmigrated ALTER COLUMN SSNToken BIGINT NOT NULL

ALTER TABLE LoanApplications_Unmigrated DROP COLUMN DOB
ALTER TABLE LoanApplications_Unmigrated DROP COLUMN SSN