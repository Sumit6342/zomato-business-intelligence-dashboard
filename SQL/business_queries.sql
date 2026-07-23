CREATE DATABASE zomato_data_analysis;
USE zomato_data_analysis;
SHOW TABLES;
SELECT * FROM zomato;

-- BASIC SQL QUERIES

-- Query 1: Total Restaurants

SELECT COUNT(*) As Total_Restaurants
FROM zomato;

-- Query 2: Average Rating

SELECT ROUND(AVG(rate), 2) As Average_Rating
FROM zomato;

-- Query 3: Average Cost for Two

SELECT ROUND(AVG(approx_cost), 0) As Average_Cost_for_Two
FROM zomato;

-- Query 4: Total Customer Votes

SELECT SUM(votes) As Total_Votes
FROM zomato;

-- Query 5: Highest Rated Restaurants

SELECT 
     name,
     address,
     rate,
     votes
FROM zomato
ORDER BY rate DESC, votes DESC
LIMIT 10;

-- Query 6: Restaurants Offering Online Orders

SELECT
    online_order,
    COUNT(*) AS Total_Restaurants
FROM zomato
GROUP BY online_order;

-- Query 7: Restaurants Offering Table Booking

SELECT 
    book_table,
    COUNT(*) As Total_Restaurants
FROM zomato
GROUP BY book_table;

-- Query 8: Top 10 Locations

SELECT 
      location,
      COUNT(*) As Restaurants
FROM zomato
GROUP BY location
ORDER BY Restaurants DESC
LIMIT 10;

-- Query 9: Top 10 Restaurant Types

SELECT
    rest_type,
    COUNT(*) As Total
FROM zomato
GROUP BY rest_type
ORDER BY Total DESC
LIMIT 10;

-- Query 10: Top 10 Most Popular Cuisines

SELECT 
     cuisines,
     COUNT(*) Restaurants
FROM zomato
GROUP BY cuisines
ORDER BY Restaurants DESC
LIMIT 10;

-- INTERMEDIATE SQL QUERIES

-- Query 11 — Top 10 Restaurants by Customer Votes

SELECT 
     name,
     location,
     cuisines,
     rate,
     votes
FROM zomato
ORDER BY votes DESC
LIMIT 10;

-- Query 12 - Average Rating by Location

SELECT 
     location,
     ROUND(AVG(rate), 2) As Average_Rating
FROM zomato
GROUP BY location
ORDER BY Average_Rating DESC;

-- Query 13 - Average Cost for Two by Restaurant Type

SELECT
	 rest_type,
	 ROUND(AVG(approx_cost),0) As Average_Cost_for_Two
FROM zomato
GROUP BY rest_type
ORDER BY Average_Cost_for_Two DESC;

-- Query 14 - Top 10 Locations with Most Restaurants
          
SELECT
     location,
     COUNT(*) As Total_Restaurants
FROM zomato
GROUP BY location
ORDER BY Total_Restaurants DESC
LIMIT 10;

-- Query 15 - Restaurant Count by Cuisine

SELECT
     cuisines,
     COUNT(*) As Total_Restaurants
FROM zomato
GROUP BY cuisines
ORDER BY Total_Restaurants DESC
LIMIT 10;

-- Query 16 - Restaurants Offering Both Online Order and Table Booking

SELECT 
     name,
     location,
     rate
FROM zomato
WHERE 
    online_order = 'Yes'  
    AND  book_table = 'Yes'
ORDER BY rate DESC;

-- Query 17 - Cost Category using CASE

SELECT
     name,
     approx_cost,
CASE 
    WHEN approx_cost < 500 THEN 'BUDGET'
    WHEN approx_cost BETWEEN 500 AND 1000 THEN 'Mid_Range'
    ELSE 'Premium'
END As cost_category
FROM zomato;

-- QUERY 18 - Rating Category using CASE

SELECT 
     name,
     rate,
CASE 
    WHEN rate >= 4.5 THEN 'Excellent'
    WHEN rate >= 4.0 THEN 'Very_Good'
    WHEN rate >= 3.5 THEN 'Good'
    ELSE 'Average'
END As rating_category
FROM zomato;

-- Query 19 - Top Restaurant Type by Average Rating

SELECT rest_type,
       ROUND(AVG(ratE),2) AS avg_rating
FROM zomato
GROUP BY rest_type
HAVING COUNT(*) >= 10
ORDER BY avg_rating DESC;
 
 -- ADVANCE SQL QUERIES
 
-- Query 20 - Top 3 Restaurants in Each Location (RANK)
     
WITH RankedRestaurants As (
  SELECT 
       name,
       location,
       rate,
       votes,
       RANK() OVER(
	    PARTITION BY location
        ORDER BY rate DESC, votes DESC
) AS rank_no
FROM zomato
)
SELECT *
FROM RankedRestaurants 
WHERE rank_no <= 3;

-- Query 21 - Highest Rated Restaurant Type in Every Location

WITH RestaurantRank AS (

SELECT
     location,
     rest_type,
     ROUND(AVG(rate), 2) AS average_rating,
     RANK() OVER (
     PARTITION BY location
     ORDER BY ROUND(AVG(rate), 2) DESC
  ) AS rnk
   FROM zomato
   GROUP BY location,rest_type
)
SELECT *
FROM RestaurantRank
WHERE rnk = 1;

-- Query 22 - Restaurants Rated Above City Average

SELECT
     name,
     location,
     rate
FROM zomato z
WHERE rate >
(
    SELECT AVG(rate)
    FROM zomato
    WHERE location = z.location
);

-- Query 23 - Dense Rank Based on Votes

SELECT
     name,
     votes,
     DENSE_RANK() OVER (
     ORDER BY votes DESC
  ) AS vote_rank
  FROM zomato;

-- Query 24 - Row Number Within Each Location

SELECT
     name,
     location,
     rate,
     ROW_NUMBER() OVER(
     PARTITION BY location
     ORDER BY rate DESC
   ) AS row_num
FROM zomato;
     
-- Query 25 - Average Rating Difference from Overall Average

SELECT
     name,
     rate,
     ROUND(
       rate - 
       (SELECT AVG(rate) FROM zomato),
	2) AS rate_difference
FROM zomato;

-- QUERY 26 - Restaurant Count by Cost Category

SELECT
CASE
    WHEN approx_cost < 500 THEN 'Budget'
    WHEN approx_cost BETWEEN 500 AND 1000 THEN 'Mid Rangw'
    ELSE 'Premium'
END AS cost_category,
COUNT(*) AS total_restaurants
FROM zomato
GROUP BY cost_category;

-- Query 27 - Top 5 Costliest Restaurants

SELECT
     name,
     location,
     approx_cost AS cost_for_two,
     rate
FROM zomato
ORDER BY cost_for_two DESC
LIMIT 5;
     
-- Query 28 - Online Order Percentage by Location

SELECT
     location,
	 ROUND(
     100*SUM(
     CASE
        WHEN Online_order = 'Yes'
        THEN 1
        ELSE 0
        END
      )/COUNT(*), 2)
AS online_percentage
FROM zomato
GROUP BY location
ORDER BY online_percentage DESC;

-- Query 29 - Restaurant Type Having Highest Votes

SELECT 
     rest_type,
     SUM(votes) AS total_votes
FROM zomato
GROUP BY rest_type
ORDER BY total_votes DESC;

-- Query 30 - Previous Restaurant Rating in Same Location (LAG)

SELECT 
     location,
     name,
     rate,
     LAG(rate) OVER (
     PARTITION BY location
     ORDER BY rate DESC
     ) AS previous_rating
FROM zomato;

-- Query 31 - Next Restaurant Rating in Same Location (LEAD)

SELECT 
     location,
     name,
     rate,
     LEAD(rate) OVER (
     PARTITION BY location
     ORDER BY rate DESC
     ) AS next_rating
FROM zomato;

-- Query 32 - Divide Restaurants into 4 Rating Groups (NTILE)

SELECT
    name,
    location,
    rate,
    NTILE(4) OVER(
    ORDER BY rate DESC
    ) AS quartile
FROM zomato;

-- Query 33 - Running Total of Votes by Location

SELECT 
     location,
     name,
     votes,
     SUM(votes) OVER (
     PARTITION BY location
     ORDER BY votes DESC
     ) AS running_votes
FROM zomato;

-- Query 34 - Percentage Rank of Restaurants

SELECT 
     name,
     rate,
     PERCENT_RANK() OVER (
     ORDER BY rate DESC
     ) AS percentage_rank
FROM zomato;

-- Query 35 - Cumulative Distribution of Ratings

SELECT
     name,
     rate,
     CUME_DIST() OVER (
     ORDER BY rate DESC
     ) AS cumulative_distribution
FROM zomato;

-- Query 36 - Compare Restaurant Rating with Overall Average

SELECT
     name,
     location,
     rate,
     ROUND(AVG(rate) OVER(), 2) AS overall_avg_rating,
     ROUND(rate - AVG(rate) OVER(), 2) AS rating_difference
FROM zomato;

-- Query 37 - Top Restaurant Type by Total Votes

SELECT
     rest_type,
     SUM(votes) AS total_votes
FROM zomato
GROUP BY rest_type
ORDER BY total_votes DESC
limit 10;

-- Query 38 - Restaurant with Maximum Votes in Each Location

WITH RankedVotes AS (
    SELECT
        location,
        name,
        votes,
        ROW_NUMBER() OVER (
            PARTITION BY location
            ORDER BY votes DESC
        ) AS rn
    FROM zomato
)
SELECT location, name, votes
FROM RankedVotes
WHERE rn = 1;

-- Query 39 - Premium Restaurants with Excellent Ratings

SELECT
     name,
     location,
     approx_cost,
     rate
FROM zomato
WHERE approx_cost >= 1000
 AND rate >= 4.5
ORDER BY rate DESC, approx_cost DESC;

-- Query 40 - Top 3 Most Popular Cuisines in Each Location

WITH CuisinePopularity AS (
    SELECT
         location,
         cuisines,
         COUNT(*) AS total_restaurants,
         AVG(rate) AS avg_rating,
         RANK() OVER (
            PARTITION BY location
            ORDER BY COUNT(*) DESC
      ) AS cuisine_rank
	FROM zomato
    GROUP BY location,cuisines
)

SELECT
    location,
    cuisines,
    total_restaurants,
    ROUND(avg_rating, 2) AS avg_rating
FROM CuisinePopularity
WHERE cuisine_rank <= 3
ORDER BY location, cuisine_rank;
    
-- BUSINESS INSIGHT QUERIES

-- Query 41 - Top 5 Locations by Average Restaurant Rating

SELECT 
     location,
     ROUND(AVG(rate), 2) AS avg_rating,
     COUNT(*) AS total_restaurants
FROM zomato
GROUP BY location
HAVING COUNT(*) >= 10
ORDER BY avg_rating DESC
LIMIT 5;

-- Query 42 - Restaurant Types with Highest Customer Engagement

SELECT
     rest_type,
     ROUND(AVG(votes), 0) AS avg_votes,
     COUNT(*) AS total_restaurants
FROM zomato
GROUP BY rest_type
HAVING COUNT(*) >= 10
ORDER BY avg_votes DESC;
     
-- Query 43 - Most Expensive Locations to Dine

SELECT 
     location,
     ROUND(AVG(approx_cost), 0) AS avg_cost
FROM zomato
GROUP BY location
ORDER BY avg_cost DESC
LIMIT 10;

-- Query 44 - Locations with Highest Online Ordering Adoption

SELECT
     location,
     COUNT(*) AS total_restaurants,
     SUM(CASE
           WHEN online_order = 'YES' THEN 1
           ELSE 0
		END) AS online_restaurants,
	ROUND(
           SUM(CASE
                  WHEN online_order = 'YES' THEN 1
                  ELSE 0
		    END) * 100 / COUNT(*), 2
		) AS online_percentage
FROM zomato
GROUP BY location
ORDER BY online_percentage DESC;
           
-- Query 45 - Locations Having Highest Average Votes

SELECT
     location,
     ROUND(AVG(votes), 0) AS avg_votes
FROM zomato
GROUP BY location
HAVING COUNT(*) >= 10
ORDER BY avg_votes DESC;     

-- Query 46 - Premium Restaurants with Excellent Ratings

SELECT
     name,
     location,
     approx_cost,
     rate AS rating
FROM zomato
WHERE approx_cost >= 1000
 AND rate >=4.5
ORDER BY approx_cost DESC, rating DESC;

-- Query 47 - Most Popular Cuisine by Average Rating

SELECT 
     cuisines,
     ROUND(AVG(rate), 2) AS avg_rating,
     COUNT(*) AS total_restaurants
FROM zomato
GROUP BY cuisines
HAVING COUNT(*) >= 10
ORDER BY avg_rating DESC
LIMIT 10;

-- Query 48 - Restaurant Types with Highest Average Cost

SELECT 
     rest_type,
     ROUND(AVG(approx_cost), 0) AS avg_cost
FROM zomato
GROUP BY rest_type
ORDER BY avg_cost DESC;

-- Query 49 - High Rated Restaurants with Low Cost

SELECT
    name,
    location,
    approx_cost,
    rate
FROM zomato
WHERE rate >= 4.3
 AND approx_cost <=500
ORDER BY rate DESC,
         approx_cost;  
         
-- Query 50 - Top 10 Restaurants with Highest Customer Popularity Score

SELECT
    name,
    location,
    rate,
    votes,
    ROUND(rate * LOG10(votes + 1),2) AS popularity_score
FROM zomato
WHERE votes > 0
ORDER BY popularity_score DESC
LIMIT 10;


