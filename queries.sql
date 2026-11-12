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