#!/bin/bash

# Deploy script for video downloader application

echo "🚀 Starting deployment process..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 20+"
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "❌ Node.js version 18+ is required. Current version: $(node --version)"
    exit 1
fi

echo "✅ Node.js version: $(node --version)"

# Install dependencies
echo "📦 Installing dependencies..."
npm ci

# Build the application
echo "🔨 Building application..."
npm run build

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✅ Build completed successfully!"
else
    echo "❌ Build failed!"
    exit 1
fi

# Check for environment variables
if [ -z "$NODE_ENV" ]; then
    export NODE_ENV=production
fi

echo "🌍 Environment: $NODE_ENV"

# Database setup (if DATABASE_URL is provided)
if [ ! -z "$DATABASE_URL" ]; then
    echo "🗄️ Setting up database..."
    npm run db:push
    if [ $? -eq 0 ]; then
        echo "✅ Database setup completed!"
    else
        echo "⚠️ Database setup failed, continuing with in-memory storage"
    fi
else
    echo "ℹ️ No DATABASE_URL provided, using in-memory storage"
fi

# Start the application
echo "🎉 Starting application..."
npm start