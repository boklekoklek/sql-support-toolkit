-- 1. Which tickets are still open?
SELECT * FROM Tickets WHERE Status = 'Open';

-- 2. Open tickets, newest first
SELECT * FROM Tickets WHERE Status = 'Open' ORDER BY CreatedAt DESC;

-- 3. High priority tickets that are open
SELECT * FROM Tickets WHERE Priority = 'High' AND Status = 'Open';

-- 4. Tickets with no agent assigned (the wrong way returns nothing)
SELECT * FROM Tickets WHERE AgentId = NULL;

-- 4b. The right way
SELECT * FROM Tickets WHERE AgentId IS NULL;

-- 5. How many tickets are there in total?
SELECT COUNT(*) FROM Tickets;

-- 6. How many tickets per status?
SELECT Status, COUNT(*) AS Total
FROM Tickets
GROUP BY Status;

SELECT Priority, COUNT(*) AS Total
FROM Tickets
GROUP BY Priority;

SELECT CustomerId, COUNT(*) AS Total
FROM Tickets
GROUP BY CustomerId;

-- 9. Every ticket with the customer's name
SELECT t.Id, t.Title, c.Name AS Customer
FROM Tickets t
JOIN Customers c ON t.CustomerId = c.Id;

-- 10. Every ticket with the agent's name (unassigned tickets stay in the list)
SELECT t.Id AS TicketID, t.Title, a.Name AS Agent
FROM Tickets t
LEFT JOIN Agents a ON t.AgentId = a.Id;

SELECT
    c.Id AS CustomerID,
    c.Name AS CustomerName,
    COUNT(*) AS TotalTickets
FROM Tickets t
INNER JOIN Customers c
    ON t.CustomerId = c.Id
GROUP BY
    c.Id,
    c.Name
ORDER BY
    c.Id;