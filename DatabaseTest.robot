*** Settings ***
Documentation     Database Testing in Robot Framework
Library           DatabaseLibrary

*** Variables ***
${DBName}         robotframework_db
${DBUser}         root
${DBPassword}     root
${DBHost}         localhost
${DBPort}         3306

*** Test Cases ***
Connect DB
    Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPassword}    ${DBHost}    ${DBPort}
    Execute SQL String    CREATE TABLE If Not Exists User (Id int, Name varchar(20), Age int);
    Execute SQL String    INSERT INTO User VALUES (1, "Alice", 30);
    Check If Exists In Database    SELECT Id from User where Name = 'Halisia'
    Disconnect From Database
