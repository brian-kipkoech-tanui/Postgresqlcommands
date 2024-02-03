-- Export database
mysqldump -u username -p dbname > backup.sql

-- import database
mysql -u username -p dbname < backup.sql
