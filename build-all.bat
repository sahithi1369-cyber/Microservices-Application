@echo off
cd order-service
call mvn clean package -DskipTests
cd ..\inventory-service
call mvn clean package -DskipTests
cd ..\notification-service
call mvn clean package -DskipTests
cd ..
echo Build completed.
