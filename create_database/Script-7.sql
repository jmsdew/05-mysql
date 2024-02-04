SHOW DATABASEs;

create user guro@'%' identified by 'guro';

create database employee;

grant all privileges on employee.* to guro@'%';

show grants for guro@'%';