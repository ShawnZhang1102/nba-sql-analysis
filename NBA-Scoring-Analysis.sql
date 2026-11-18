/*Chengxiang Zhang*/
/*czhang88@u.rochester.edu*/
USE ewrflights;

/*Question 1: Write a query to produce a list of flights including airline, flight number and 
destination airport,sorted by air time. What was the longest air time for all flights out of 
EWR in April, 2013? What airline flew this flight and what was its destination?*/
SELECT airline, flight, name, air_time
FROM flights f 
JOIN carriers c
	ON f.carrier = c.carrier_code
JOIN airports a
	ON f.dest = a.faa
WHERE f.year = 2013 AND f.month = 4
ORDER BY f.air_time DESC;
/*The longest airtime is 666, and the destination is HonoLulu Intl. */


/*Question 2: What was the shortest air time for all flights? What airline flew this flight 
and what was its destination?*/
SELECT c.airline, a.name, f.air_time
FROM flights f
JOIN carriers c
	ON f.carrier = c.carrier_code
JOIN airports a
	ON f.dest = a.faa
ORDER BY f.air_time;
/*The shortest air time is 20. ExpressJet flew this, and Bradley Intl was the destination. */


/*Question 3: Write a query to produce a list of flights including airline, flight number, 
destination airport and distance. What was the longest distance flown by planes with between 
20 and 60 seats?*/
SELECT c.airline, f.flight, a.name dst, f.distance, p.seats
FROM flights f
JOIN carriers c
	ON f.carrier = c.carrier_code
JOIN airports a
	ON f.dest = a.faa
JOIN planes p
	ON p.tailnum = f.tailnum
WHERE p.seats < 60 AND p.seats >20
ORDER BY f.distance DESC;
/*The longest distance was 1325. */


/*Question 4: How many different destinations did United Airlines flights fly to in April, 2013?*/
SELECT COUNT(DISTINCT f.dest) as 'Number of Different Destinations of UA in April 2013'
FROM flights f
JOIN carriers c
	ON f.carrier = c.carrier_code
WHERE f.month = 4 AND f.year = 2013 AND c.airline = "United Airlines";
/*There are 29 different destinations the UA flights flew to in April 2013. */


/*Question 5: Write a query to produce a list of flights including flight date, carrier, 
flight number, destination, scheduled departure, actual departure, scheduled arrival, actual 
arrival, gain and gain/hour. A screenshot of the first 10 rows of the results are shown below.*/
SELECT CONCAT(LPAD(f.month,2,'0'),'/',LPAD(f.day,2,'0'),'/',f.year) as date, 
f.carrier, f.flight, f.dest, 
CONCAT(LPAD(SUBSTRING(f.sched_dep_time,1,LENGTH(f.sched_dep_time)-2),2,'0'),':',
SUBSTRING(f.sched_dep_time,-2),':00') as 'sched dep', 
CONCAT(LPAD(SUBSTRING(f.dep_time,1,LENGTH(f.dep_time)-2),2,'0'),':',
SUBSTRING(f.dep_time,-2),':00') as 'actual dep', 
CONCAT(LPAD(SUBSTRING(f.sched_arr_time,1,LENGTH(f.sched_arr_time)-2),2,'0'),':',
SUBSTRING(f.sched_arr_time,-2),':00') as 'sched arr', 
CONCAT(LPAD(SUBSTRING(f.arr_time,1,LENGTH(f.arr_time)-2),2,'0'),':',
SUBSTRING(f.arr_time,-2),':00') as 'actual arr', 
f.dep_delay - f.arr_delay as 'gain', 
((f.dep_delay - f.arr_delay)/f.air_time) as 'gain_per_hour' 
FROM flights f
ORDER BY gain DESC, gain_per_hour DESC
LIMIT 10;
/*Results limited to the first 10 rows according to the instruction. */


/*Question 6: Which flight had the worst gain? Which flight had the worst gain/hour? (The 
answer – flight number, gain, gain/hour – is sufficient for this question.*/
/*Worst gain: */
SELECT f.flight, f.dep_delay - f.arr_delay as 'Gain', 
((f.dep_delay - f.arr_delay)/f.air_time) as 'Gain_per_Hour' 
FROM flights f
ORDER BY gain ASC;
/*Flight 2083 had the worst gain which was -148. */

/*Worst gain/hour: */
SELECT f.flight, f.dep_delay - f.arr_delay as 'gain', 
((f.dep_delay - f.arr_delay)/f.air_time) as gain_per_hour
FROM flights f
ORDER BY gain_per_hour ASC;
/*Flight 5667 had the worst gain/hour which was -1.9216. */


/*Question 7: Write a query to produce a list of flights, their departure delay and the weather 
conditions at the time of scheduled departure. A screenshot of sample results are shown below.*/
SELECT CONCAT(LPAD(f.month,2,'0'),'/',LPAD(f.day,2,'0'),'/',f.year) as date,  
CONCAT(LPAD(SUBSTRING(f.sched_dep_time,1,LENGTH(f.sched_dep_time)-2),2,'0'),':',
SUBSTRING(f.sched_dep_time,-2),':00') as 'sched dep', f.dep_delay,  w.temp, w.wind_speed, 
w.wind_gust, w.precip, w.visib
FROM flights f
JOIN weather w
	ON f.time_hour = w.time_hour
ORDER BY dep_delay DESC;




