# Additional Jar Files
 This folder contisn additinal jar files to prevernt some attacks. 
 After downloading, `copy and paset these jar files` to the follwoing directry (if you do not change defult setting of Tomcat)
```sh
C:\xampp\tomcat\lib
```
After pasting them, you need to `restart Tomcat`. 
### functions 
- commons-lang3-3.5.jar 
       - this is used to escape XML sequence to prevent XSS.
- the mysql-connector-java-5.1.38-bin.jar file 
       - this is used for connecting jsp with mysql or Maria DB
