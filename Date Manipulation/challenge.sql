-- 1: In this challenge, you need to find the longest gap (in days) 
-- between two consecutive events. Retrieve the event names and the duration of the longest gap.

-- SELECT * FROM Events

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

