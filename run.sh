#!/bin/bash

# Run this if the file is not executable: chmod +x run.sh

# Navigate to the backend folder and start Laravel
echo "Starting Laravel backend..."
cd backend || { echo "Backend folder not found"; exit 1; }

# Run Laravel server in the background
php artisan serve &
LARAVEL_PID=$!
echo "Laravel backend running with PID $LARAVEL_PID at http://127.0.0.1:8000"

# Navigate to the frontend folder and start Vue
echo "Starting Vue frontend..."
cd ../frontend || { echo "Frontend folder not found"; exit 1; }

# Install dependencies
echo "Installing frontend dependencies..."
npm install

# Run Vue frontend (Vite)
npm run dev &
VUE_PID=$!
echo "Vue frontend running with PID $VUE_PID at http://localhost:5173"

# Wait for both servers
echo "Press Ctrl+C to stop both servers..."
wait $LARAVEL_PID $VUE_PID

