# CS166 Security Blog 

## Security Blog 
This is the entire source code for security information blog for cs166.
These codes are running at

http://ec2-34-208-99-244.us-west-2.compute.amazonaws.com:8080/CS166_Final_Project/Project_Code/prevented/register_form.jsp 

## File Explnation 
- `notes` contains db syntax that is used to create this site.  
- `Project_Code` contains all source code for this blog site.  
     |-- `attackable` contains vlunable source code.  
     |-- `prevented ` contains more secure source code.
- `Privacy Statement` is a privacy statement for this blog site.
- `Final_Project.pdf` is the documentation fot this project. 
## Tech 
this blog is used the following techs.
* [XAMPP] - XAMPP
* [AWS] - with windows server 
* [java]
* [tomcat]
* [maria DB

## Installation
```sh

```
## Reference 
- https://mariadb.com/kb/en/mariadb/varchar/
- https://books.google.com/books?id=3k9ucms335AC&pg=PA136&lpg=PA136&dq=stringescapeutils+jsp+import&source=bl&ots=2gHL6ic_DR&sig=kGZhC_FojhVt9tIjtFsswSjYyv8&hl=en&sa=X&sqi=2&ved=0ahUKEwjzmsHnh4PUAhWnsFQKHVAFBO4Q6AEIWzAJ#v=onepage&q=stringescapeutils%20jsp%20import&f=false

## Database Setup
Even though this blog is powered by XAMPP, it is `not recommended to set up DB from PHP Admin  
### check installation for mysql (mariaDB)
```sh
#Go to the directory, where there is mysql.exe
#by defult under the bin, there should be mysql.exe.
cd C:\xampp\mysql\bin
#call mysql.exe from command prompt as:
C:\xampp\mysql\bin> mysql
>Welcome to the MariaDB monitor.  Commands end with ; or \g.
>Your MariaDB connection id is 323
?Server version: 10.1.21-MariaDB mariadb.org binary distribution
?Copyright (c) 2000, 2016, Oracle, MariaDB Corporation Ab and others.
>Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
MariaDB [(none)]>
```
you will see this, then installation was fine. 
### add user for database 
```sh
# login as root user  
mysql --user=root 
# create user 
#syntax: CREATE USER 'user_name'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'cs166db'@'localhost' IDENTIFIED BY 'Spring2017!';
> Query OK, 0 rows affected (0.04 sec)
# create user for database server 
# but not able to use any database yet, so give privileges 
GRANT ALL PRIVILEGES ON *.* TO 'cs166db'@'localhost' WITH GRANT OPTION;
> Query OK, 0 rows affected (0.00 sec)
#now cs166db is able to use by user cs166db
```
### create database 
```sh
#login as the user cs166db
>mysql --user=cs166db --password=Spring2017! 
# create database named cs166db
MariaDB [(none)]> create database cs166db
Query OK, 1 row affected (0.01 sec)
MariaDB [cs166db]> exit
```
### create table -- login-- 
```sh
#fullname as varchar()
#user as varchar 
#pass as BINARY(64) because shar256 returnes 64 byte
MariaDB [cs166db]> create table login ( fullname varchar(255), user varchar(255), pass BINARY(64));
Query OK, 0 rows affected (0.12 sec)
MariaDB [cs166db]> show tables;
+-------------------+
| Tables_in_cs166db |
+-------------------+
| login             |
+-------------------+
1 row in set (0.00 sec)
```
### create table -- blog -- 





