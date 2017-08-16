USE [ApplicationDataStore]
GO

ALTER TABLE LoanApplication_Unmigrated ADD DOBToken BIGINT NULL
ALTER TABLE LoanApplication_Unmigrated ADD SSNToken BIGINT NULL
GO

INSERT INTO [SecureDataStore].dbo.SecureDate(Data, Type)
SELECT DOB, 2
FROM LoanApplication_Unmigrated
GROUP BY DOB
EXCEPT
SELECT Data, Type
FROM [SecureDataStore].dbo.SecureDate
WHERE Type = 2

INSERT INTO [SecureDataStore].dbo.SecureText(Data, Type)
SELECT SSN, 1
FROM LoanApplication_Unmigrated
GROUP BY SSN
EXCEPT
SELECT Data, Type
FROM [SecureDataStore].dbo.SecureText
WHERE Type = 1
GO

UPDATE LoanApplication_Unmigrated
SET DOBToken = sd.[Key]
FROM [SecureDataStore].dbo.SecureDate sd
WHERE sd.Data = LoanApplication_Unmigrated.DOB
AND Type = 2

UPDATE LoanApplication_Unmigrated
SET SSNToken = st.[Key]
FROM [SecureDataStore].dbo.SecureText st
WHERE st.Data = LoanApplication_Unmigrated.SSN
AND Type = 1
GO

ALTER TABLE LoanApplication_Unmigrated ALTER COLUMN DOBToken BIGINT NOT NULL
ALTER TABLE LoanApplication_Unmigrated ALTER COLUMN SSNToken BIGINT NOT NULL

ALTER TABLE LoanApplication_Unmigrated DROP COLUMN DOB
ALTER TABLE LoanApplication_Unmigrated DROP COLUMN SSN