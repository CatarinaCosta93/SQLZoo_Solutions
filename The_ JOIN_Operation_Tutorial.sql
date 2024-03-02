-- # The JOIN operation Tutorial - This tutorial introduces JOIN which allows you to use data from two or more tables. 
-- # The tables contain all matches and goals from UEFA EURO 2012 Football Championship in Poland and Ukraine.

-- # Table game contains: id, mdate, stadium, team1, team2
-- # Table goal contains: matchid, teamid, player, gtime
-- # Table eteam contains: id, teamname, coach

-- 1. The first example shows the goal scored by a player with the last name 'Bender'. 
-- The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime
-- Modify it to show the matchid and player name for all goals scored by Germany. 
-- To identify German players, check for: teamid = 'GER'

SELECT matchid, player 
FROM goal 
WHERE teamid = 'GER'

-- 2. Show id, stadium, team1, team2 for just game 1012

SELECT id,stadium,team1,team2 
FROM game
WHERE id = 1012

-- 3. Show the player, teamid, stadium and mdate for every German goal.
-- We are going to join the table game & table goal to get the result

SELECT goal.player, goal.teamid, game.stadium, game.mdate
FROM game JOIN goal ON (game.id = goal.matchid) 
WHERE teamid = 'GER'

-- 4. Use the same JOIN as in the previous question.
-- Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'

SELECT game.team1, game.team2, goal.player
FROM game JOIN goal ON (game.id = goal.matchid) 
WHERE player LIKE 'Mario%'

-- 5. The table eteam gives details of every national team including the coach. 
-- You can JOIN goal to eteam using the phrase goal JOIN eteam on teamid=id
-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10

SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
FROM goal JOIN eteam ON (goal.teamid = eteam.id)
WHERE gtime <= 10

-- 6. To JOIN game with eteam you could use either game JOIN eteam ON (team1=eteam.id) or game JOIN eteam ON (team2=eteam.id)
-- Notice that because id is a column name in both game and eteam you must specify eteam.id instead of just id
-- List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

SELECT game.mdate, eteam.teamname
FROM game JOIN eteam ON (eteam.id = game.team1)
WHERE coach = 'Fernando Santos'

-- 7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

SELECT goal.player 
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE stadium = 'National Stadium, Warsaw'

-- 8. The example query shows all goals scored in the Germany-Greece quarterfinal.
-- Instead show the name of all players who scored a goal against Germany.

SELECT DISTINCT player                    -- DISTINCT to remove duplicates (the same player can scored more than once)
FROM game
JOIN goal ON (goal.matchid = game.id)
WHERE (team1 = 'GER' OR team2 = 'GER')    -- Either Germany was one team1 or team 2
AND teamid <> 'GER'                       -- teamid not equal to Germany. Which means Germany didn't score, but the opposite team did. The result is going to show what was the opposite team

-- 9. Show teamname and the total number of goals scored
-- Using COUNT and GROUP BY

SELECT eteam.teamname, COUNT(goal.player) AS goals_scored
FROM goal JOIN eteam ON (goal.teamid = eteam.id)
GROUP BY teamname 

-- 10. Show the stadium and the number of goals scored in each stadium

SELECT game.stadium, COUNT(goal.player) AS goals_scored
FROM game JOIN goal ON (game.id = goal.matchid)
GROUP BY stadium

-- 11. For every match involving 'POL' show the matchid, date and the number of goals scored.

SELECT goal.matchid, game.mdate, COUNT(goal.player) AS goals_scored 
FROM game JOIN goal ON (goal.matchid = game.id) 
WHERE (team1 = 'POL' OR team2 = 'POL') 
GROUP BY matchid

-- 12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

SELECT goal.matchid, game.mdate, COUNT(goal.player) AS goals_GER 
FROM goal JOIN game ON (goal.matchid = game.id) 
WHERE goal.teamid = 'GER' 
GROUP BY matchid

-- 13. List every match with the goals scored by each team as shown. 
-- This will use "CASE WHEN" which has not been explained in any previous exercises.
-- Sort your result by mdate, matchid, team1 and team2.

SELECT mdate,
       team1,
       SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
       team2,
       SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2 FROM
    game LEFT JOIN goal ON (id = matchid)
    GROUP BY mdate,team1,team2
    ORDER BY mdate, matchid, team1, team2



