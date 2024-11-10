{{ config(materialized='table') }}

SELECT
    CAST(ID AS INTEGER) AS ID,
    Username,
    `Profile URL`,
    Type,
    CAST(`Site Admin` AS BOOLEAN) AS Site_Admin,
    Name,
    Company,
    Blog,
    Location,
    Email,
    Bio,
    CAST(`Public Repos` AS INTEGER) AS Public_Repos,
    CAST(`Public Gists` AS INTEGER) AS Public_Gists,
    CAST(Followers AS INTEGER) AS Followers,
    CAST(Following AS INTEGER) AS Following,
    PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%SZ', `Account Created At`) AS Account_Created_At,
    PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%SZ', `Last Updated At`) AS Last_Updated_At
FROM {{ source('github', 'github_users_data') }}
