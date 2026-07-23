USE zomato_data_analysis;
SHOW TABLES;

SELECT *
FROM zomato
INTO OUTFILE '/path/to/zomato_cleaned.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


CREATE OR REPLACE VIEW cuisine_split AS
WITH RECURSIVE numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 10
)
SELECT
    `Name` AS Restaurant_Name,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Cuisines, ',', n), ',', -1)) AS Cuisine
FROM zomato
JOIN numbers
ON n <= 1 + LENGTH(Cuisines) - LENGTH(REPLACE(Cuisines, ',', ''));

SELECT * FROM zomato_data_analysis.cuisine_split;
