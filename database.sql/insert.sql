-- ===================================================
-- 🌴 TAMRA CAPITAL DATA POPULATION
-- Initial Records & Test Data Insert Statements
-- ===================================================

-- 1. Populating PortfolioType
INSERT INTO PortfolioType VALUES (1, 'Conservative', 3.5); [cite: 104]
INSERT INTO PortfolioType VALUES (2, 'Moderate',     5.0); [cite: 105]
INSERT INTO PortfolioType VALUES (3, 'Balanced',     7.5); [cite: 106]
INSERT INTO PortfolioType VALUES (4, 'Growth',      10.0); [cite: 107]
INSERT INTO PortfolioType VALUES (5, 'Aggressive',  12.5); [cite: 108]

-- 2. Populating RiskProfile
INSERT INTO RiskProfile VALUES (101, '0-20',   'Low',         1); [cite: 110]
INSERT INTO RiskProfile VALUES (102, '21-40',  'Medium-Low',  2); [cite: 111]
INSERT INTO RiskProfile VALUES (103, '41-60',  'Medium',      3); [cite: 112]
INSERT INTO RiskProfile VALUES (104, '61-80',  'Medium-High', 4); [cite: 113]
INSERT INTO RiskProfile VALUES (105, '81-100', 'High',        5); [cite: 114]

-- 3. Populating Client
INSERT INTO Client VALUES ('1001112223', 'Ahmad',  'Al-Saud',    'ahmad@email.com',   '0501112223', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 120000, 500000,  'N', 103); [cite: 116, 117]
INSERT INTO Client VALUES ('1002223334', 'Sara',   'Al-Otaibi',  'sara@email.com',    '0552223334', TO_DATE('1985-11-20', 'YYYY-MM-DD'), 250000, 1500000, 'N', 105); [cite: 118, 119]
INSERT INTO Client VALUES ('1003334445', 'Omar',   'Al-Fahad',   'omar@email.com',    '0543334445', TO_DATE('1995-02-10', 'YYYY-MM-DD'),  90000,  200000, 'N', 101); [cite: 120, 121]
INSERT INTO Client VALUES ('1004445556', 'Noura',  'Al-Dosari',  'noura@email.com',   '0564445556', TO_DATE('1988-08-25', 'YYYY-MM-DD'), 180000,  800000, 'Y', 104); [cite: 122, 123]
INSERT INTO Client VALUES ('1005556667', 'Faisal', 'Al-Ghamdi',  'faisal@email.com',  '0595556667', TO_DATE('1992-12-05', 'YYYY-MM-DD'), 150000,  600000, 'N', 102); [cite: 124, 125]

-- 4. Populating Portfolio
INSERT INTO Portfolio VALUES (1001, 150000.00, TO_DATE('2023-01-10', 'YYYY-MM-DD'), '1001112223', 3); [cite: 127]
INSERT INTO Portfolio VALUES (1002, 500000.00, TO_DATE('2022-11-05', 'YYYY-MM-DD'), '1002223334', 5); [cite: 128]
INSERT INTO Portfolio VALUES (1003,  50000.00, TO_DATE('2023-05-20', 'YYYY-MM-DD'), '1003334445', 1); [cite: 129]
INSERT INTO Portfolio VALUES (1004, 300000.00, TO_DATE('2023-02-15', 'YYYY-MM-DD'), '1004445556', 4); [cite: 130]
INSERT INTO Portfolio VALUES (1005, 120000.00, TO_DATE('2023-04-01', 'YYYY-MM-DD'), '1005556667', 2); [cite: 131]

-- 5. Populating BankAccount
INSERT INTO BankAccount VALUES (1, 'SA123456789012345678901 2', 'Al Rajhi Bank', 1001); [cite: 133]
INSERT INTO BankAccount VALUES (2, 'SA2345678901234567890123', 'SNB',          1002); [cite: 134]
INSERT INTO BankAccount VALUES (3, 'SA3456789012345678901234', 'Riyad Bank',     1003); [cite: 135]
INSERT INTO BankAccount VALUES (4, 'SA4567890123456789012345', 'Alinma Bank',    1004); [cite: 136]
INSERT INTO BankAccount VALUES (5, 'SA5678901234567890123456', 'SABB',            1005); [cite: 137]

-- 6. Populating Asset
INSERT INTO Asset VALUES ('VTI',  'Vanguard Total Stock Market',    'Equity',      220.50); [cite: 139]
INSERT INTO Asset VALUES ('SPSK', 'SP Funds Dow Jones Global Sukuk', 'Sukuk',       19.80); [cite: 140]
INSERT INTO Asset VALUES ('GLD',  'SPDR Gold Trust',               'Commodity',   185.20); [cite: 141]
INSERT INTO Asset VALUES ('VNQ',  'Vanguard Real Estate Index',     'Real Estate',  85.60); [cite: 142]
INSERT INTO Asset VALUES ('BND',  'Vanguard Total Bond Market',     'Bond',         72.40); [cite: 143]

-- 7. Populating PortfolioType_Asset
INSERT INTO PortfolioType_Asset VALUES (3, 'VTI',  50.00); [cite: 145]
INSERT INTO PortfolioType_Asset VALUES (3, 'SPSK', 40.00); [cite: 146]
INSERT INTO PortfolioType_Asset VALUES (3, 'GLD',  10.00); [cite: 147]
INSERT INTO PortfolioType_Asset VALUES (5, 'VTI',  80.00); [cite: 148]
INSERT INTO PortfolioType_Asset VALUES (5, 'VNQ',  20.00); [cite: 149]

-- 8. Populating PaymentMethod
INSERT INTO PaymentMethod VALUES (1, 'Apple Pay',       'Instant'); [cite: 151]
INSERT INTO PaymentMethod VALUES (2, 'Mada',            'Instant'); [cite: 152]
INSERT INTO PaymentMethod VALUES (3, 'Bank Transfer',   '1-2 Business Days'); [cite: 153]
INSERT INTO PaymentMethod VALUES (4, 'Visa/Mastercard', 'Instant'); [cite: 154]
INSERT INTO PaymentMethod VALUES (5, 'STC Pay',         'Instant'); [cite: 155]

-- 9. Populating Transaction
INSERT INTO Transaction VALUES (5001, TO_DATE('2023-06-01', 'YYYY-MM-DD'), 10000.00, 'Completed', 1001); [cite: 157]
INSERT INTO Transaction VALUES (5002, TO_DATE('2023-06-15', 'YYYY-MM-DD'),  5000.00, 'Completed', 1002); [cite: 158]
INSERT INTO Transaction VALUES (5003, TO_DATE('2023-07-01', 'YYYY-MM-DD'),  2000.00, 'Completed', 1003); [cite: 159]
INSERT INTO Transaction VALUES (5004, TO_DATE('2023-07-10', 'YYYY-MM-DD'), 15000.00, 'Completed', 1004); [cite: 160]
INSERT INTO Transaction VALUES (5005, TO_DATE('2023-07-20', 'YYYY-MM-DD'),  3000.00, 'Completed', 1005); [cite: 161]

-- 10. Populating Deposit
INSERT INTO Deposit VALUES (5001, 'Salary Account',  2); [cite: 163]
INSERT INTO Deposit VALUES (5002, 'Savings Account', 3); [cite: 164]

-- 11. Populating Withdrawal
INSERT INTO Withdrawal VALUES (5003, 'SA999888777666555444333 2'); [cite: 166]
INSERT INTO Withdrawal VALUES (5004, 'SA888777666555444333222 1'); [cite: 167]

-- 12. Populating Transfer
INSERT INTO Transfer VALUES (5005, 1001); [cite: 169]
