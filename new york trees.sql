Project 1 : New York trees
Dataset: bigquery-public-data.new_york_trees.tree_species

--How many unique trees  do we have in this table?
SELECT 
    COUNT(DISTINCT species_scientific_name) AS unique_trees
FROM `bigquery-public-data.new_york_trees.tree_species` 


--Which forms of trees do we have?
SELECT 
    DISTINCT form
FROM `bigquery-public-data.new_york_trees.tree_species` 


--How many trees do we have with large tree size?
SELECT 
    COUNT(DISTINCT species_scientific_name) AS large_size_trees
FROM `bigquery-public-data.new_york_trees.tree_species` 
WHERE tree_size = 'Large (Mature Height > 50 ft)'


--How many trees do we have by form?
SELECT form,
    COUNT(species_scientific_name) AS total_trees,
FROM `bigquery-public-data.new_york_trees.tree_species` 
GROUP BY form
ORDER BY 2 DESC  


--What kind of trees has pyramidial form?
SELECT 
    species_scientific_name AS trees_name,
    form
FROM `bigquery-public-data.new_york_trees.tree_species` 
WHERE form = 'Pyramidal'
 

--Does table contain more Maroon or Red fall color of trees?
SELECT 
    fall_color,
    COUNT(species_scientific_name) AS trees_name,
FROM `bigquery-public-data.new_york_trees.tree_species` 
WHERE fall_color IN('Maroon', 'Red')
GROUP BY 1

 
--How many trees do we have by fall color Maroon and Red? Associate color code to each color (Maroon = 1; Red = 2). 
WITH new_york AS (
SELECT 
    fall_color,
    COUNT(species_scientific_name) AS trees_total,
FROM `bigquery-public-data.new_york_trees.tree_species` 
WHERE fall_color IN('Maroon', 'Red')
GROUP BY 1 
)
 
SELECT 
    fall_color,
    trees_total,
    CASE 
        WHEN fall_color = 'Maroon' THEN 1
        WHEN fall_color = 'Red' THEN 2
    END AS color_code
FROM new_york 