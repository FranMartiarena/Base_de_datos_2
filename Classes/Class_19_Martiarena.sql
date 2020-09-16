use sakila;

-- 1. Create a user data_analyst

CREATE USER data_analyst@localhost IDENTIFIED BY 'admin';

-- Grant permissions only to SELECT, UPDATE and DELETE to all sakila tables to it.

grant select, update, delete  on sakila.* to data_analyst@localhost;

-- Login with this user and try to create a table. Show the result of that operation.

-- I couldnt login with the user due to some errors that i have, But i suppose that the user data_analyst, wont be able to create a table, only select, update and delete.

-- Try to update a title of a film. Write the update script.

-- With root or any admin user revoke the UPDATE permission. Write the command

revoke update on sakila.* from data_analyst@localhost;

-- Login again with data_analyst and try again the update done in step 4. Show the result.

-- Now the data analyst cant update a table.
