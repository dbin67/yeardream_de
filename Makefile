
# All
all: build up

# Build all service images
build:
	docker build -t cluster ./cluster

# Start all services
up:
	docker-compose up -d

# Stop and remove all services
down:
	docker-compose down

# Restart all services
restart:
	docker-compose restart

.PHONY: build up down restart
