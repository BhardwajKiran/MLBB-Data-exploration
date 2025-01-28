create database MLBB;
Use MLBB;
Select * from MLBB;

-- 1. Retrieve the top 5 heroes with the highest physical damage.--

Select Name, Title, Primary_Role, Phy_Damage From MLBB 
Order by Phy_Damage Desc
Limit 5;


-- 2.  Identify all heroes released after 2020-01-01 with "Mage" as their primary role. --- 
SELECT Name, Release_Date, Primary_Role FROM MLBB
WHERE Release_Date > '2020-01-01' AND Primary_Role = 'Mage';


-- 3. Calculate the win rate of each hero and list the top 10 heroes by win rate. -- 
SELECT Name, (Esport_Wins * 100/ (Esport_Wins + Esport_Loss)) AS Win_Rate from MLBB
WHERE Esport_Wins + Esport_Loss > 0
ORDER BY Win_Rate DESC
LIMIT 10;


-- 4. Find the average mana regeneration for each primary role.
SELECT Primary_Role, AVG(Mana_Regen) AS Avg_Mana_Regen
FROM mlbb
GROUP BY Primary_Role;


-- 5. List heroes with both primary and secondary roles specified, sorted by release date.
-- Update the blank records in secondary roles to null
select distinct Secondary_Role from MLBB;
UPDATE MLBB
SET Secondary_Role = NULL
WHERE Secondary_Role = '';

SELECT Name, Primary_Role, Secondary_Role, Release_Date FROM MLBB
WHERE Secondary_Role IS not NULL
Order by Release_Date;


-- 6. Identify heroes with a physical defense higher than the average and list their lanes.
Select Name, Lane, Phy_Defence from MLBB
where Phy_Defence > (Select avg(Phy_Defence) from MLBB);


-- 7. For each lane, find the hero with the highest movement speed.
SELECT Lane, Name, Mov_Speed
FROM MLBB M1
WHERE Mov_Speed = (SELECT MAX(Mov_Speed) FROM MLBB M2 WHERE M1.Lane = M2.Lane);


-- 8. List heroes where the difference between esports wins and losses exceeds 100.
SELECT Name, Esport_Wins, Esport_Loss
FROM MLBB
WHERE ABS(Esport_Wins - Esport_Loss) > 100;



-- 9. Determine the lane with the most heroes and display the count for each Lane in descending order.
SELECT Lane, COUNT(*) AS Hero_Count FROM MLBB
GROUP BY Lane
ORDER BY Hero_Count DESC;


-- 10. Retrieve all heroes whose name starts with "A" and has a movement speed below 250.
SELECT Name, Mov_Speed FROM MLBB
WHERE Name LIKE 'A%' AND Mov_Speed < 250;
