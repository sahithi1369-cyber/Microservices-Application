#!/bin/sh
set -e
cd order-service && mvn clean package -DskipTests
cd ../inventory-service && mvn clean package -DskipTests
cd ../notification-service && mvn clean package -DskipTests
echo "Build completed."
