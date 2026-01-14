# Docker Deployment Guide

This guide will help you set up your application with Docker and Docker Swarm.

## Project Structure

```
.
├── backend
│   ├── app.py
│   ├── Dockerfile
│   └── requirements.txt
├── frontend
│   ├── app.py
│   ├── Dockerfile
│   └── requirements.txt
└── docker-stack.yml
```

## Prerequisites

- Docker installed and running
- Docker Swarm initialized (for stack deployment)

## Setup Instructions

### 1. Place the Dockerfiles

Copy the Dockerfiles to their respective directories:
- Copy `backend-Dockerfile` to `backend/Dockerfile`
- Copy `frontend-Dockerfile` to `frontend/Dockerfile`

### 2. Create Requirements Files

Place the requirements.txt files in their directories:
- Copy `backend-requirements.txt` to `backend/requirements.txt`
- Copy `frontend-requirements.txt` to `frontend/requirements.txt`

Adjust the dependencies based on what your app.py files actually use.

### 3. Build Images (Optional - for local testing)

```bash
# Build backend
cd backend
docker build -t backend:latest .

# Build frontend
cd ../frontend
docker build -t frontend:latest .
```

### 4. Initialize Docker Swarm (if not already done)

```bash
docker swarm init
```

### 5. Deploy with Docker Stack

```bash
# Deploy the stack
docker stack deploy -c docker-stack.yml myapp

# Check service status
docker stack services myapp

# View logs
docker service logs myapp_backend
docker service logs myapp_frontend
```

### 6. Access Your Application

- Frontend: http://localhost:8501
- Backend: http://localhost:5000

## Useful Commands

### View running services
```bash
docker stack ps myapp
```

### Scale services
```bash
docker service scale myapp_backend=3
docker service scale myapp_frontend=3
```

### Update a service
```bash
docker service update --image backend:v2 myapp_backend
```

### Remove the stack
```bash
docker stack rm myapp
```

### View service logs
```bash
docker service logs -f myapp_backend
docker service logs -f myapp_frontend
```

## Configuration Notes

- **Backend**: Runs on port 5000 with 2 replicas
- **Frontend**: Runs on port 8501 with 2 replicas
- **Health checks**: Both services have health check endpoints configured
- **Resources**: CPU and memory limits are set for each service
- **Network**: Services communicate over an overlay network

## Customization

You can customize the deployment by:
- Adjusting replica counts in `docker-stack.yml`
- Modifying resource limits
- Adding environment variables
- Configuring additional services (database, cache, etc.)

## Troubleshooting

If services fail to start:
1. Check logs: `docker service logs myapp_backend`
2. Verify health check endpoints exist in your app.py files
3. Ensure requirements.txt includes all necessary dependencies
4. Check that ports 5000 and 8501 are not already in use
