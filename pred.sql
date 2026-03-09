SELECT COUNT(DISTINCT "singer id") AS "number_of_singers"
FROM "singer"	concert_singer
SELECT COUNT(DISTINCT "singer id") AS total_singers
FROM "singer"	concert_singer
SELECT "name", "country", "age" FROM "singer" ORDER BY "age" DESC	concert_singer
SELECT "name", "country", "age" FROM "singer" ORDER BY "age" DESC	concert_singer
SELECT
    AVG("age") AS avg_age,
    MIN("age") AS min_age,
    MAX("age") AS max_age
FROM "singer"
WHERE "country" = 'France'	concert_singer
SELECT AVG("age") AS "average_age", MIN("age") AS "min_age", MAX("age") AS "max_age" FROM "singer" WHERE "country" = 'France'	concert_singer
SELECT "song name", "song release year"
FROM "singer"
WHERE "age" = (SELECT MIN("age") FROM "singer")	concert_singer
SELECT "song name", "song release year"
FROM "singer"
WHERE "age" = (SELECT MIN("age") FROM "singer")	concert_singer
SELECT DISTINCT "country" FROM "singer" WHERE "age" > 20	concert_singer
SELECT DISTINCT "country"
FROM "singer"
WHERE "age" > 20	concert_singer
SELECT
    "country",
    COUNT(DISTINCT "singer id") AS "singer_count"
FROM
    "singer"
GROUP BY
    "country"	concert_singer
SELECT "country", COUNT(DISTINCT "singer id") AS singer_count
FROM "singer"
GROUP BY "country"	concert_singer
SELECT "song name" FROM "singer" WHERE "age" > (SELECT AVG("age") FROM "singer")	concert_singer
SELECT "song name" FROM "singer" WHERE "age" > (SELECT AVG("age") FROM "singer")	concert_singer
SELECT "location", "name" FROM "stadium" WHERE "capacity" BETWEEN 5000 AND 10000	concert_singer
SELECT "location", "name"
FROM "stadium"
WHERE "capacity" BETWEEN 5000 AND 10000	concert_singer
SELECT AVG("capacity") AS average_capacity, MAX("capacity") AS maximum_capacity FROM "stadium"	concert_singer
SELECT
    AVG("capacity") AS "average_capacity",
    MAX("capacity") AS "maximum_capacity"
FROM
    "stadium"	concert_singer
SELECT "name", "capacity"
FROM "stadium"
ORDER BY "average" DESC
LIMIT 1	concert_singer
SELECT "name", "capacity"
FROM "stadium"
ORDER BY "average" DESC
LIMIT 1	concert_singer
SELECT COUNT(*) AS concert_count
FROM "concert"
WHERE "year" IN (2014, 2015)	concert_singer
SELECT COUNT(*) FROM "concert" WHERE "year" IN (2014, 2015)	concert_singer
SELECT
    "stadium"."name" AS "stadium_name",
    COUNT("concert"."stadium id") AS "concert_count"
FROM
    "stadium"
LEFT JOIN
    "concert"
    ON "stadium"."stadium id" = "concert"."stadium id"
GROUP BY
    "stadium"."stadium id",
    "stadium"."name"	concert_singer
SELECT "stadium"."stadium id", "stadium"."name", COUNT("concert"."concert id") AS "concerts_played"
FROM "stadium"
LEFT JOIN "concert" ON "stadium"."stadium id" = "concert"."stadium id"
GROUP BY "stadium"."stadium id", "stadium"."name"	concert_singer
SELECT "stadium"."name", "stadium"."capacity"
FROM "stadium"
JOIN "concert" ON "stadium"."stadium id" = "concert"."stadium id"
WHERE "concert"."year" >= 2014
GROUP BY "stadium"."stadium id", "stadium"."name", "stadium"."capacity"
ORDER BY COUNT(*) DESC
LIMIT 1	concert_singer
SELECT s."name", s."capacity"
FROM "stadium" s
JOIN (
    SELECT "stadium id", COUNT(*) AS cnt
    FROM "concert"
    WHERE "year" > 2013
    GROUP BY "stadium id"
    ORDER BY cnt DESC
    LIMIT 1
) c ON s."stadium id" = c."stadium id"	concert_singer
SELECT "year" FROM "concert" GROUP BY "year" ORDER BY COUNT(*) DESC LIMIT 1	concert_singer
SELECT "year", COUNT(*) AS concert_count
FROM "concert"
GROUP BY "year"
ORDER BY concert_count DESC
LIMIT 1	concert_singer
SELECT "name"
FROM "stadium"
LEFT JOIN "concert"
  ON "stadium"."stadium id" = "concert"."stadium id"
WHERE "concert"."stadium id" IS NULL	concert_singer
SELECT "stadium"."name"
FROM "stadium"
LEFT JOIN "concert" ON "stadium"."stadium id" = "concert"."stadium id"
WHERE "concert"."stadium id" IS NULL	concert_singer
SELECT "country"
FROM "singer"
GROUP BY "country"
HAVING SUM(CASE WHEN "age" > 40 THEN 1 ELSE 0 END) > 0
   AND SUM(CASE WHEN "age" < 30 THEN 1 ELSE 0 END) > 0	concert_singer
SELECT "name"
FROM "stadium"
WHERE NOT EXISTS (
  SELECT 1
  FROM "concert"
  WHERE "concert"."stadium id" = "stadium"."stadium id"
    AND "concert"."year" = 2014
)	concert_singer
SELECT "name"
FROM "stadium" s
WHERE NOT EXISTS (
    SELECT 1
    FROM "concert" c
    WHERE c."stadium id" = s."stadium id"
      AND c."year" = 2014
)	concert_singer
SELECT "concert"."concert name",
       "concert"."theme",
       COUNT("singer in concert"."singer id") AS "number of singers"
FROM "concert"
LEFT JOIN "singer in concert"
  ON "concert"."concert id" = "singer in concert"."concert id"
GROUP BY "concert"."concert id",
         "concert"."concert name",
         "concert"."theme"	concert_singer
SELECT "concert"."concert name", "concert"."theme", COUNT("singer in concert"."singer id") AS "number of singers"
FROM "concert"
LEFT JOIN "singer in concert" ON "concert"."concert id" = "singer in concert"."concert id"
GROUP BY "concert"."concert id", "concert"."concert name", "concert"."theme"	concert_singer
	concert_singer
SELECT "singer"."name",
       COUNT("singer in concert"."concert id") AS "concert_count"
FROM   "singer"
LEFT JOIN "singer in concert"
       ON "singer"."singer id" = "singer in concert"."singer id"
GROUP BY "singer"."singer id",
         "singer"."name"	concert_singer
SELECT DISTINCT "singer"."name"
FROM "singer"
JOIN "singer in concert" ON "singer"."singer id" = "singer in concert"."singer id"
JOIN "concert" ON "singer in concert"."concert id" = "concert"."concert id"
WHERE "concert"."year" = 2014	concert_singer
SELECT "singer"."name"
FROM "singer"
JOIN "singer in concert" ON "singer"."singer id" = "singer in concert"."singer id"
JOIN "concert" ON "singer in concert"."concert id" = "concert"."concert id"
WHERE "concert"."year" = 2014	concert_singer
SELECT "name", "country" FROM "singer" WHERE "song name" LIKE '%Hey%'	concert_singer
SELECT "name", "country" FROM "singer" WHERE "song name" LIKE '%Hey%'	concert_singer
SELECT s."name", s."location"
FROM "stadium" s
WHERE s."stadium id" IN (
  SELECT c."stadium id"
  FROM "concert" c
  WHERE c."year" IN (2014,2015)
  GROUP BY c."stadium id"
  HAVING COUNT(DISTINCT c."year") = 2
)	concert_singer
SELECT "name", "location"
FROM "stadium" AS s
JOIN "concert" AS c
  ON s."stadium id" = c."stadium id"
WHERE c."year" IN (2014, 2015)
GROUP BY s."stadium id", s."name", s."location"
HAVING COUNT(DISTINCT c."year") = 2	concert_singer
SELECT COUNT(*) AS concert_count
FROM "stadium" s
JOIN "concert" c ON s."stadium id" = c."stadium id"
WHERE s."capacity" = (SELECT MAX("capacity") FROM "stadium")	concert_singer
SELECT COUNT(*) AS "concert_count"
FROM "concert"
WHERE "stadium id" = (
    SELECT "stadium id"
    FROM "stadium"
    ORDER BY "capacity" DESC
    LIMIT 1
)	concert_singer
SELECT COUNT(*) AS "count_of_heavy_pets" FROM "pets" WHERE "weight" > 10	pets_1
SELECT COUNT(*) FROM "pets" WHERE "weight" > 10	pets_1
SELECT "weight"
FROM "pets"
WHERE "pet type" = 'dog'
  AND "pet age" = (
    SELECT MIN("pet age")
    FROM "pets"
    WHERE "pet type" = 'dog'
  )	pets_1
SELECT "weight"
FROM "pets"
WHERE "pet type" = 'dog'
ORDER BY "pet age" ASC
LIMIT 1	pets_1
SELECT "pet type", MAX("weight") AS "max weight"
FROM "pets"
GROUP BY "pet type"	pets_1
SELECT "pet type", MAX("weight") AS max_weight
FROM "pets"
GROUP BY "pet type"	pets_1
SELECT COUNT(*) 
FROM "student" s 
JOIN "has pet" hp ON s."student id" = hp."student id" 
WHERE s."age" > 20	pets_1
SELECT COUNT("pet id") FROM "student" JOIN "has pet" ON "student"."student id" = "has pet"."student id" WHERE "student"."age" > 20	pets_1
SELECT COUNT(*) AS "dog_pet_count"
FROM "student" s
JOIN "has pet" hp ON s."student id" = hp."student id"
JOIN "pets" p ON hp."pet id" = p."pet id"
WHERE s."sex" = 'F'
  AND p."pet type" = 'dog'	pets_1
SELECT COUNT(*) AS dog_pets_count
FROM "student" s
JOIN "has pet" hp ON s."student id" = hp."student id"
JOIN "pets" p ON hp."pet id" = p."pet id"
WHERE s."sex" = 'female'
  AND p."pet type" = 'dog'	pets_1
SELECT COUNT(DISTINCT "pet type") FROM "pets"	pets_1
SELECT COUNT(DISTINCT "pet type") AS "number_of_pet_types" FROM "pets"	pets_1
SELECT DISTINCT "student"."first name"
FROM "student"
JOIN "has pet" ON "student"."student id" = "has pet"."student id"
JOIN "pets" ON "has pet"."pet id" = "pets"."pet id"
WHERE "pets"."pet type" IN ('cat', 'dog')	pets_1
SELECT DISTINCT "first name"
FROM "student"
JOIN "has pet" ON "student"."student id" = "has pet"."student id"
JOIN "pets" ON "has pet"."pet id" = "pets"."pet id"
WHERE "pets"."pet type" IN ('cat','dog')	pets_1
SELECT "student"."first name", "student"."last name"
FROM "student"
JOIN "has pet" ON "has pet"."student id" = "student"."student id"
JOIN "pets" ON "has pet"."pet id" = "pets"."pet id"
GROUP BY "student"."student id", "student"."first name", "student"."last name"
HAVING SUM(CASE WHEN "pets"."pet type" = 'cat' THEN 1 ELSE 0 END) > 0
   AND SUM(CASE WHEN "pets"."pet type" = 'dog' THEN 1 ELSE 0 END) > 0	pets_1
SELECT s."first name"
FROM "student" s
JOIN "has pet" hp ON s."student id" = hp."student id"
JOIN "pets" p ON hp."pet id" = p."pet id"
GROUP BY s."student id", s."first name"
HAVING SUM(CASE WHEN p."pet type" = 'cat' THEN 1 ELSE 0 END) > 0
   AND SUM(CASE WHEN p."pet type" = 'dog' THEN 1 ELSE 0 END) > 0	pets_1
SELECT "student"."major", "student"."age"
FROM "student"
WHERE NOT EXISTS (
  SELECT 1
  FROM "has pet" AS hp
  JOIN "pets" AS p ON hp."pet id" = p."pet id"
  WHERE hp."student id" = "student"."student id" AND p."pet type" = 'cat'
)	pets_1
SELECT s."major", s."age"
FROM "student" s
WHERE NOT EXISTS (
    SELECT 1
    FROM "has pet" hp
    JOIN "pets" p ON hp."pet id" = p."pet id"
    WHERE hp."student id" = s."student id"
      AND p."pet type" = 'cat'
)	
