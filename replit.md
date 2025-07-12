# Video Downloader Application

## Overview

This is a modern video downloader web application built with a full-stack TypeScript architecture. The application allows users to download videos from various platforms (YouTube, Instagram, Facebook, TikTok, WhatsApp) with support for multiple formats and quality options. It features a mobile-first design with a comprehensive user interface for managing downloads, playing videos, and organizing content in a secure vault.

## User Preferences

Preferred communication style: Simple, everyday language.

## Recent Changes

### December 15, 2024
- Enhanced video preview with working video player and controls
- Improved backend with platform-specific video information generation
- Added consistent data generation based on video URLs
- Fixed type safety issues in storage layer
- Added demo mode indicators for clarity
- Prepared comprehensive deployment package with Docker, Vercel, Railway support

## System Architecture

The application follows a modern full-stack architecture with clear separation between client and server code:

### Frontend Architecture
- **Framework**: React 18 with TypeScript
- **Styling**: Tailwind CSS with shadcn/ui component library
- **State Management**: React Context API for theme and download state, TanStack Query for server state
- **Routing**: Wouter for lightweight client-side routing
- **Build Tool**: Vite for fast development and optimized builds
- **UI Components**: Extensive use of Radix UI primitives for accessibility

### Backend Architecture
- **Runtime**: Node.js with TypeScript
- **Framework**: Express.js for REST API
- **Database**: PostgreSQL with Drizzle ORM
- **Database Provider**: Neon Database (serverless PostgreSQL)
- **Development**: In-memory storage fallback for development

### Mobile-First Design
- Responsive design optimized for mobile devices
- Custom mobile container component simulating phone interface
- Bottom navigation pattern for mobile UX
- Touch-friendly interactions and components

## Key Components

### Client-Side Components
1. **Pages**: Home (main download interface), Files (download manager), Player (video player), Vault (secure storage), Settings
2. **UI Components**: Comprehensive shadcn/ui component library including buttons, forms, modals, progress bars
3. **Context Providers**: Theme management (light/dark mode), Download state management
4. **Custom Components**: Mobile container, bottom navigation, download items, video player, platform badges

### Server-Side Components
1. **API Routes**: RESTful endpoints for downloads and video info
2. **Storage Layer**: Abstracted storage interface with in-memory implementation
3. **Database Schema**: Users, downloads, and video info tables
4. **Middleware**: Request logging, error handling, CORS

### Shared Components
1. **Database Schema**: Drizzle ORM schema definitions shared between client and server
2. **TypeScript Types**: Type-safe API contracts and data models

## Data Flow

### Download Process
1. User enters video URL on home page
2. Client fetches video info from `/api/video-info` endpoint
3. Server returns video metadata (title, thumbnail, available formats)
4. User selects desired format/quality through download modal
5. Client creates download via `/api/downloads` endpoint
6. Download progress tracked through context state
7. Completed downloads shown in Files page

### State Management
- **Server State**: TanStack Query handles API requests, caching, and synchronization
- **Client State**: React Context for theme preferences and active download tracking
- **Local Storage**: Theme preference persistence

### Database Layer
- **Development**: In-memory storage for rapid development
- **Production**: PostgreSQL via Drizzle ORM with type-safe queries
- **Migrations**: Drizzle Kit for database schema management

## External Dependencies

### Core Frontend Dependencies
- React ecosystem (React, React DOM, React Query)
- Wouter for routing
- Tailwind CSS for styling
- Radix UI for accessible components
- Lucide React for icons

### Core Backend Dependencies
- Express.js for server framework
- Drizzle ORM for database interactions
- Neon Database serverless driver
- Zod for schema validation

### Development Tools
- Vite for build tooling and development server
- TypeScript for type safety
- ESBuild for server bundling
- PostCSS and Autoprefixer for CSS processing

### UI Component Library
- shadcn/ui components built on Radix UI
- Class Variance Authority for component variants
- CLSX and Tailwind Merge for conditional styling

## Deployment Strategy

### Development Environment
- Vite dev server with HMR for frontend
- Express server with TypeScript compilation via tsx
- In-memory storage for rapid prototyping
- Replit-specific integrations (cartographer, error overlay)

### Production Build
- Frontend: Vite build with static asset optimization
- Backend: ESBuild bundling for Node.js deployment
- Database: PostgreSQL connection via environment variables
- Static file serving through Express

### Environment Configuration
- Database URL configuration via environment variables
- Development/production mode switching
- Replit-specific development features when in Replit environment

### Build Scripts
- `dev`: Development mode with TypeScript compilation
- `build`: Production build for both frontend and backend
- `start`: Production server startup
- `db:push`: Database schema deployment via Drizzle Kit

The application is designed to be easily deployable on various platforms while maintaining a consistent development experience across different environments.