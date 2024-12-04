WITH users AS
(
    SELECT DISTINCT requester_id AS id FROM RequestAccepted
    UNION
    SELECT DISTINCT accepter_id AS id FROM RequestAccepted
),
sent_cnt AS
(
    SELECT u.id,COUNT(CASE WHEN r.accepter_id IS NOT NULL THEN 1 END) AS sents FROM users u
    LEFT JOIN RequestAccepted r ON u.id = r.requester_id
    GROUP BY u.id 

),
accept_cnt AS
(
    SELECT u.id,COUNT(CASE WHEN r.requester_id IS NOT NULL THEN 1 END) AS accepts FROM users u
    LEFT JOIN RequestAccepted r ON u.id = r.accepter_id
    GROUP BY u.id 
),
friend_cnt AS
(
    SELECT s.id,(s.sents + a.accepts) AS num FROM sent_cnt s
    INNER JOIN accept_cnt a ON a.id = s.id
) 

SELECT id,num FROM friend_cnt
WHERE num = (SELECT MAX(num) FROM friend_cnt);
