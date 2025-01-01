# Write your MySQL query statement below
SELECT request_at as DAy ,
 ROUND( SUM(status != 'completed') / COUNT(*),2) AS 'Cancellation Rate' 
FROM Trips 
LEFT JOIN Users Clients
ON Trips.client_id = Clients.users_id
LEFT JOIN Users Drivers
ON Trips.driver_id = Drivers.users_id
WHERE 
Clients.banned = 'No' 
  AND Drivers.banned = 'No' 
  AND request_at BETWEEN '2013-10-01' AND '2013-10-03' 
Group by Day 