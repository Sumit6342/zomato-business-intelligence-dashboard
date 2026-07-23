USE zomato_data_analysis;
SHOW TABLES;

-- create restaurant summary table

DROP TABLE IF EXISTS restaurant_summary;

CREATE TABLE restaurant_summary AS
SELECT
    name AS Restaurant_Name,

    ROUND(AVG(rate),2) AS Avg_Rating,

    SUM(votes) AS Total_Votes,

    ROUND(AVG(approx_cost),0) AS Avg_Cost_For_Two,

    MAX(CASE
            WHEN online_order = 'Yes' THEN 'Yes'
            ELSE 'No'
        END) AS Online_Order,

    MAX(CASE
            WHEN book_table = 'Yes' THEN 'Yes'
            ELSE 'No'
        END) AS Book_Table,

    MIN(location) AS Location,

    MIN(rest_type) AS Rest_Type,

    MIN(cuisines) AS Cuisines

FROM zomato
GROUP BY name;

SELECT * FROM restaurant_summary;

SELECT COUNT(*) AS Total_Restaurants
FROM restaurant_summary;