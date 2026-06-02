-- ===================================================
-- 🌴 TAMRA CAPITAL DATABASE SCHEMA
-- Generated for Information Systems Project [2026]
-- ===================================================

-- 1. Table: PortfolioType
CREATE TABLE PortfolioType
( 
    TypeID              INT             NOT NULL,
    TypeName            VARCHAR2(50)    NOT NULL,
    TargetReturnRate    DECIMAL(5,2),
    PRIMARY KEY (TypeID) 
);

-- 2. Table: RiskProfile
CREATE TABLE RiskProfile
( 
    ProfileID           INT             NOT NULL,
    ScoreRange          VARCHAR2(20)    NOT NULL,
    RiskLevel           VARCHAR2(20)    NOT NULL,
    TypeID              INT,
    PRIMARY KEY (ProfileID),
    FOREIGN KEY (TypeID) REFERENCES PortfolioType(TypeID)
);

-- 3. Table: Client
CREATE TABLE Client
( 
    NationalID          CHAR(10)        NOT NULL,
    FirstName           VARCHAR2(50)    NOT NULL,
    LastName            VARCHAR2(50)    NOT NULL,
    Email               VARCHAR2(100)   NOT NULL,
    PhoneNumber         VARCHAR2(15),
    DateOfBirth         DATE,
    AnnualIncome        DECIMAL(15,2),
    NetWorth            DECIMAL(15,2),
    IsTaxResident       CHAR(1),
    ProfileID           INT,
    PRIMARY KEY (NationalID),
    FOREIGN KEY (ProfileID) REFERENCES RiskProfile(ProfileID),
    CHECK (IsTaxResident IN ('Y', 'N')) 
);

-- 4. Table: Portfolio
CREATE TABLE Portfolio
( 
    PortfolioID         INT             NOT NULL,
    TotalBalance        DECIMAL(15,2)   DEFAULT 0,
    CreationDate        DATE,
    NationalID          CHAR(10)        NOT NULL,
    TypeID              INT             NOT NULL,
    PRIMARY KEY (PortfolioID),
    FOREIGN KEY (NationalID) REFERENCES Client(NationalID),
    FOREIGN KEY (TypeID) REFERENCES PortfolioType(TypeID) 
);

-- 5. Table: BankAccount
CREATE TABLE BankAccount
( 
    AccountID           INT             NOT NULL,
    IBAN                VARCHAR2(30)    NOT NULL,
    BankName            VARCHAR2(100)   NOT NULL,
    PortfolioID         INT             NOT NULL,
    PRIMARY KEY (AccountID),
    UNIQUE (PortfolioID),
    FOREIGN KEY (PortfolioID) REFERENCES Portfolio(PortfolioID) 
);

-- 6. Table: Asset
CREATE TABLE Asset
( 
    TickerSymbol        VARCHAR2(10)    NOT NULL,
    AssetName           VARCHAR2(100)   NOT NULL,
    AssetType           VARCHAR2(50)    NOT NULL,
    CurrentPrice        DECIMAL(10,2)   NOT NULL,
    PRIMARY KEY (TickerSymbol) 
);

-- 7. Table: PortfolioType_Asset
CREATE TABLE PortfolioType_Asset
( 
    TypeID              INT             NOT NULL,
    TickerSymbol        VARCHAR2(10)    NOT NULL,
    AllocationPercentage DECIMAL(5,2)   NOT NULL,
    PRIMARY KEY (TypeID, TickerSymbol),
    FOREIGN KEY (TypeID) REFERENCES PortfolioType(TypeID),
    FOREIGN KEY (TickerSymbol) REFERENCES Asset(TickerSymbol) 
);

-- 8. Table: PaymentMethod
CREATE TABLE PaymentMethod
( 
    MethodID            INT             NOT NULL,
    MethodName          VARCHAR2(50)    NOT NULL,
    ProcessingTime      VARCHAR2(50),
    PRIMARY KEY (MethodID) 
);

-- 9. Table: Transaction
CREATE TABLE Transaction
( 
    TransactionID       INT             NOT NULL,
    TransactionDate     DATE,
    Amount              DECIMAL(15,2)   NOT NULL,
    Status              VARCHAR2(20)    DEFAULT 'Completed',
    PortfolioID         INT             NOT NULL,
    PRIMARY KEY (TransactionID),
    FOREIGN KEY (PortfolioID) REFERENCES Portfolio(PortfolioID) 
);

-- 10. Table: Deposit (Subtype of Transaction)
CREATE TABLE Deposit
( 
    TransactionID       INT             NOT NULL,
    FundingSource       VARCHAR2(50),
    MethodID            INT,
    PRIMARY KEY (TransactionID),
    FOREIGN KEY (TransactionID) REFERENCES Transaction(TransactionID),
    FOREIGN KEY (MethodID) REFERENCES PaymentMethod(MethodID) 
);

-- 11. Table: Withdrawal (Subtype of Transaction)
CREATE TABLE Withdrawal
( 
    TransactionID       INT             NOT NULL,
    TargetAccount       VARCHAR2(30),
    PRIMARY KEY (TransactionID),
    FOREIGN KEY (TransactionID) REFERENCES Transaction(TransactionID) 
);

-- 12. Table: Transfer (Subtype of Transaction)
CREATE TABLE Transfer
( 
    TransactionID       INT             NOT NULL,
    ToPortfolioID       INT,
    PRIMARY KEY (TransactionID),
    FOREIGN KEY (TransactionID) REFERENCES Transaction(TransactionID),
    FOREIGN KEY (ToPortfolioID) REFERENCES Portfolio(PortfolioID) 
);

-- ===================================================
-- 👁️ DATABASE VIEWS IMPLEMENTATION
-- ===================================================

-- View 1: ClientPortfolioSummary
CREATE VIEW ClientPortfolioSummary AS
SELECT C.FirstName, C.LastName, P.TotalBalance, RP.RiskLevel, PT.TypeName
FROM Client C, Portfolio P, RiskProfile RP, PortfolioType PT
WHERE C.NationalID = P.NationalID
  AND C.ProfileID  = RP.ProfileID
  AND P.TypeID     = PT.TypeID;

-- View 2: DepositMethodSummary
CREATE VIEW DepositMethodSummary AS
SELECT PM.MethodName,
       COUNT(D.TransactionID) AS NumberOfDeposits,
       SUM(T.Amount)         AS TotalDepositedAmount
FROM PaymentMethod PM, Deposit D, Transaction T
WHERE PM.MethodID     = D.MethodID
  AND D.TransactionID = T.TransactionID
GROUP BY PM.MethodName;
