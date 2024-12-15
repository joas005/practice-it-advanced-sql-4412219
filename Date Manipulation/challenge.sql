-- 1: In this challenge, you need to find the longest gap (in days) 
-- between two consecutive events. Retrieve the event names and the duration of the longest gap.

WITH EventGaps AS (
    SELECT
        E1.EventName AS Event1,
        E2.EventName AS Event2,
        JULIANDAY(E2.EventDate) - JULIANDAY(E1.EventDate) AS GapDays
    FROM
        Events E1
    JOIN
        Events E2
    ON
        E1.EventDate < E2.EventDate
)

SELECT
    Event1,
    Event2,
    MAX(GapDays) AS LongestGap
FROM
    EventGaps;

-- 2: In this challenge, you need to calculate the total revenue 
-- earned for each month in the database. 
-- Retrieve the month and year along with the total revenue.

SELECT
    STRFTIME('%m/%Y', EventDate) AS monthYear,
    SUM(TicketPrice) AS sumSales
FROM Events
GROUP BY monthYear
ORDER BY monthYear;
