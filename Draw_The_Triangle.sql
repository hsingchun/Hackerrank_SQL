/*

1.Goal: to draw this
* * * * *
* * * *
* * *
* *
*

Analysis:
We can use REPEAT function to solve problem. The syntax is REPEAT(str, count), str is the string to repeat and count is how many times it will repeat. And we also need a table with at least 20 rows, then we can apply REPEAT function once for each row. Additionally, we need a variable to represent the length of each line.

We initialize the variable with 21 and decrease it by 1 for each row. But what if the variable becomes less than 0? The REPEAT function will return null. So, for example, we choose a table with 30 rows, the query will output 30 lines, 20 lines as we expect and 10 lines of null. It is better to exclude null lines.


*/

SET @number = 21;
SELECT REPEAT('* ', @number := @number-1) FROM information_schema.tables LIMIT 20;
/*
FROM information_schema.tables WHERE @number > 0;
*/


/*
1.Goal: to draw this
* 
* * 
* * * 
* * * * 
* * * * *
*/

SET @number = 0;
SELECT REPEAT('* ', @number := @number+1) FROM information_schema.tables LIMIT 20;