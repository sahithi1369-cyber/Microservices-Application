# Complete Microservices Application

A submission-ready Spring Boot microservices project containing:

- Order Service
- Inventory Service
- Notification Service
- Keycloak JWT security
- OpenAPI / Swagger documentation
- Docker support
- Kubernetes deployment manifests

## Technology Stack

- Java 17
- Spring Boot 3.4.5
- Spring Security OAuth2 Resource Server
- Keycloak
- Springdoc OpenAPI
- Maven
- Docker
- Kubernetes

## Project Structure

```text
microservices-complete-app/
├── order-service/
├── inventory-service/
├── notification-service/
├── k8s/
├── docker-compose.yml
└── README.md
```

## Run with Docker Compose

Requirements: Docker Desktop.

```bash
docker compose up --build
```

Services:

- Order Service: http://localhost:8081
- Inventory Service: http://localhost:8082
- Notification Service: http://localhost:8083
- Keycloak: http://localhost:8080

Swagger:

- Order: http://localhost:8081/swagger-ui.html
- Inventory: http://localhost:8082/swagger-ui.html
- Notification: http://localhost:8083/swagger-ui.html

## Keycloak

The Docker Compose file imports the development realm from:

`keycloak/realm-export.json`

Test user:

- username: `student`
- password: `student123`

Client:

- `microservices-client`

For a real deployment, change the development password and configure secrets securely.

## Kubernetes

Build images first:

```bash
docker build -t order-service:1.0 ./order-service
docker build -t inventory-service:1.0 ./inventory-service
docker build -t notification-service:1.0 ./notification-service
```

Then:

```bash
kubectl apply -f k8s/
```

Check:

```bash
kubectl get pods
kubectl get services
```

The Kubernetes files use a local development setup and are intended as a learning/submission deployment. For a cloud cluster, push images to a container registry and change the image names.

## API Examples

Create an order:

```http
POST /api/orders
Content-Type: application/json
Authorization: Bearer <KEYCLOAK_ACCESS_TOKEN>

{
  "productId": "P100",
  "quantity": 2,
  "customerEmail": "student@example.com"
}
```

Check inventory:

```http
GET /api/inventory/P100
Authorization: Bearer <KEYCLOAK_ACCESS_TOKEN>
```

Create/update inventory:

```http
POST /api/inventory
Content-Type: application/json
Authorization: Bearer <KEYCLOAK_ACCESS_TOKEN>

{
  "productId": "P100",
  "productName": "Laptop",
  "quantity": 25
}
```

Notifications:

```http
GET /api/notifications
Authorization: Bearer <KEYCLOAK_ACCESS_TOKEN>
```

## Notes

This project intentionally uses in-memory repositories so it can be run without an external database. It demonstrates the microservice architecture, REST APIs, security, API documentation, containerization, and Kubernetes deployment clearly.

For production, replace the in-memory repositories with PostgreSQL/MySQL and store Keycloak credentials/secrets outside source control.
