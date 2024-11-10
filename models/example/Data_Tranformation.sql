{{ config(materialized='table') }}

SELECT
    SAFE_CAST(NULLIF(CAST(ID AS STRING), '') AS INTEGER) AS ID,
    Username,
    `Profile URL`,
    `Type`,
    CASE 
        WHEN `Site Admin` = '1' THEN TRUE 
        ELSE FALSE 
    END AS Site_Admin,
    Name,
    Company,
    Blog,
    Location,
    Email,
    Bio,
    SAFE_CAST(NULLIF(CAST(`Public Repos` AS STRING), '') AS INTEGER) AS Public_Repos,
    SAFE_CAST(NULLIF(CAST(`Public Gists` AS STRING), '') AS INTEGER) AS Public_Gists,
    SAFE_CAST(NULLIF(CAST(Followers AS STRING), '') AS INTEGER) AS Followers,
    SAFE_CAST(NULLIF(CAST(`Following` AS STRING), '') AS INTEGER) AS `Following`,
    PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%SZ', NULLIF(CAST(`Account Created At` AS STRING), "0")) AS Account_Created_At,
    PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%SZ', NULLIF(CAST(`Last Updated At` AS STRING), "0")) AS Last_Updated_At
FROM `team-ayra-441115`.`github`.`github_user_data`
WHERE SAFE_CAST(NULLIF(CAST(ID AS STRING), '') AS INTEGER) IS NOT NULL
  AND SAFE_CAST(NULLIF(CAST(`Public Repos` AS STRING), '') AS INTEGER) IS NOT NULL
  AND SAFE_CAST(NULLIF(CAST(`Public Gists` AS STRING), '') AS INTEGER) IS NOT NULL
  AND SAFE_CAST(NULLIF(CAST(Followers AS STRING), '') AS INTEGER) IS NOT NULL
  AND SAFE_CAST(NULLIF(CAST(`Following` AS STRING), '') AS INTEGER) IS NOT NULL
  AND SAFE_CAST(NULLIF(CAST(`Account Created At` AS STRING), "0") AS STRING) LIKE '%T%:%:%Z'
  AND SAFE_CAST(NULLIF(CAST(`Last Updated At` AS STRING), "0") AS STRING) LIKE '%T%:%:%Z'
