-- Support Toolkit: sample database

CREATE TABLE Customers (
    Id INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Email TEXT NOT NULL,
    Country TEXT
);

CREATE TABLE Agents (
    Id INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Level TEXT NOT NULL
);

CREATE TABLE Tickets (
    Id INTEGER PRIMARY KEY,
    CustomerId INTEGER NOT NULL,
    AgentId INTEGER,
    Title TEXT NOT NULL,
    Priority TEXT NOT NULL,
    Status TEXT NOT NULL,
    CreatedAt TEXT NOT NULL,
    ClosedAt TEXT,
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id),
    FOREIGN KEY (AgentId) REFERENCES Agents(Id)
);

INSERT INTO Customers (Id, Name, Email, Country) VALUES
    (1, 'Ana Reyes', 'ana.reyes@example.com', 'Philippines'),
    (2, 'Ben Cruz', 'ben.cruz@example.com', 'Philippines'),
    (3, 'Carla Santos', 'carla.santos@example.com', 'Singapore'),
    (4, 'Ben Cruz', 'ben.cruz@example.com', 'Philippines');

INSERT INTO Agents (Id, Name, Level) VALUES
    (1, 'Mia', 'L1'),
    (2, 'Raj', 'L2'),
    (3, 'Joy', 'L3');

INSERT INTO Tickets (Id, CustomerId, AgentId, Title, Priority, Status, CreatedAt, ClosedAt) VALUES
    (1, 1, 1, 'Login error on mobile app', 'High', 'Open', '2026-11-01', NULL),
    (2, 1, 2, 'Cannot reset password', 'Medium', 'In Progress', '2026-11-03', NULL),
    (3, 2, NULL, 'Slow response on orders API', 'High', 'Open', '2026-10-28', NULL),
    (4, 2, 3, 'Payment failed at checkout', 'High', 'Closed', '2026-10-20', '2026-10-22'),
    (5, 3, 1, 'Typo on login page', 'Low', 'Closed', '2026-10-25', '2026-10-26'),
    (6, 3, NULL, 'App crashes on Android 14', 'High', 'Open', '2026-11-05', NULL),
    (7, 4, 2, 'Login error on mobile app', 'High', 'Open', '2026-11-01', NULL),
    (8, 1, 3, 'Report export times out', 'Medium', 'In Progress', '2026-10-30', NULL),
    (9, 2, 1, 'Email notifications not received', 'Low', 'Open', '2026-11-06', NULL),
    (10, 3, 2, 'Cannot upload profile photo', 'Low', 'Closed', '2026-11-02', '2026-11-04');