CREATE TABLE breeds(id INTEGER PRIMARY KEY AUTOINCREMENT, breed VARCHAR(30) DEFAULT 'no_breed' UNIQUE)


INSERT INTO breeds(breed)
SELECT DISTINCT breed FROM animals



CREATE TABLE types(id INTEGER PRIMARY KEY AUTOINCREMENT, "type" VARCHAR(30) UNIQUE)


INSERT INTO types("type")
SELECT DISTINCT animal_type FROM animals


CREATE TABLE colors(id INTEGER PRIMARY KEY AUTOINCREMENT, color VARCHAR(30) UNIQUE)



INSERT INTO colors(color)
SELECT DISTINCT * FROM(SELECT TRIM(color1) FROM animals UNION SELECT TRIM(color2) FROM animals)



CREATE TABLE outcomes("index" INTEGER, age_upon_outcome VARCHAR(30),
					  subtype VARCHAR(30), 'type' VARCHAR(30), month INTEGER(2), year INTEGER(4))

					  
					  
INSERT INTO outcomes("index", age_upon_outcome, subtype, 'type', month, year)
SELECT "index", age_upon_outcome, outcome_subtype, outcome_type, outcome_month, outcome_year FROM animals 


					  
CREATE TABLE fin_table("index" INTEGER,
name VARCHAR(30), animal_id VARCHAR(30), date_of_birth DATETIME, breed_id INTEGER, outcome_id INTEGER, type_id INTEGER, color1 INTEGER, color2 INTEGER)


INSERT INTO fin_table("index", name, animal_id, date_of_birth, breed_id, outcome_id, type_id, color1, color2)
SELECT animals."index", name, animal_id, date_of_birth , breeds.id, outcomes."index", types.id, a.id, b.id FROM animals 
LEFT JOIN breeds ON animals.breed = breeds.breed
LEFT JOIN types ON animals.animal_type = types."type"
LEFT JOIN outcomes ON animals."index" = outcomes."index" 
LEFT JOIN colors as a ON trim(animals.color1) = a.color
LEFT JOIN colors as b ON trim(animals.color2) = b.color 
 
