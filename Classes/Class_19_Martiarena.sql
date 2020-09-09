use sakila;

-- 1. Create a user data_analyst

CREATE USER data_analyst@localhost IDENTIFIED BY 'admin';

-- Grant permissions only to SELECT, UPDATE and DELETE to all sakila tables to it.

grant select, update, delete  on sakila.* to data_analyst@localhost;

-- Login with this user and try to create a table. Show the result of that operation.



-- Try to update a title of a film. Write the update script.
-- With root or any admin user revoke the UPDATE permission. Write the command
-- Login again with data_analyst and try again the update done in step 4. Show the result.