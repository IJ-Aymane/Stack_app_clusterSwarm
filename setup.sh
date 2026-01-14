#!/bin/bash

echo "Setting up Docker files..."

# Rename backend Dockerfile
if [ -f "backend/backend-Dockerfile" ]; then
    mv backend/backend-Dockerfile backend/Dockerfile
    echo "✓ Created backend/Dockerfile"
fi

# Rename frontend Dockerfile
if [ -f "frontend/frontend-Dockerfile" ]; then
    mv frontend/frontend-Dockerfile frontend/Dockerfile
    echo "✓ Created frontend/Dockerfile"
fi

# Rename requirements files
if [ -f "backend/backend-requirements.txt" ]; then
    mv backend/backend-requirements.txt backend/requirements.txt
    echo "✓ Created backend/requirements.txt"
fi

if [ -f "frontend/frontend-requirements.txt" ]; then
    mv frontend/frontend-requirements.txt frontend/requirements.txt
    echo "✓ Created frontend/requirements.txt"
fi

echo ""
echo "Setup complete! Your project structure:"
tree -L 2

echo ""
echo "Next steps:"
echo "1. Review and update requirements.txt files based on your app.py dependencies"
echo "2. Initialize Docker Swarm: docker swarm init"
echo "3. Deploy your stack: docker stack deploy -c docker-stack.yml myapp"
echo "4. Check status: docker stack services myapp"
