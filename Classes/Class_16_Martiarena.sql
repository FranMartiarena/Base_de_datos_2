use sakila;

-- 1 Insert a new employee to , but with an null email. Explain what happens.

/*
UPDATE employees 
SET 
    email = Null
WHERE
    employeeNumber = 1056;*/

-- The column email doesnt update because when creating the table, it was declared a not null constraint


-- 2- Run  the query: "UPDATE employees SET employeeNumber = employeeNumber - 20", what happened?

-- UPDATE employees SET employeeNumber = employeeNumber - 20 Mysql workbench returns an error code cause i tried to update a table without a where clause

-- 3 Add a age column to the table employee where and it can only accept values from 16 up to 70 years old.


-- alter table employees add column age int not null ; 
alter table employees ADD CONSTRAINT check_age CHECK(age between 16 and 70);

-- 4 Describe the referential integrity between tables film, actor and film_actor in sakila db.
-- The referential integrity between those tables are the primary and foreign keys because without them there is no chance that the 3 tables have a succesfull conection

/* 5- Create a new column called lastUpdate to table employee and use trigger(s) to keep the date-time updated on inserts
 and updates operations. Bonus: add a column lastUpdateUser and the respective trigger(s) to specify who was the last MySQL
 user that changed the row (assume multiple users, other than root, can connect to MySQL and change this table). */

-- alter table employees add column lastUpdate datetime;
DROP TRIGGER employee_last_update;


DELIMITER $$
CREATE  TRIGGER employee_last_update 
    after insert ON employees
    FOR EACH ROW 
BEGIN
    INSERT INTO employees
    SET 
        lastUpdate = CURRENT_TIMESTAMP;
END$$
DELIMITER ;



