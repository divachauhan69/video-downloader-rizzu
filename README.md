# All-in-One Video Downloader

A comprehensive video downloader web application with mobile-responsive design and multi-platform support.

## Features

- **Multi-Platform Support**: YouTube, Instagram, Facebook, TikTok, WhatsApp, and more
- **Video Preview**: Review video details before downloading
- **Multiple Formats**: Support for various resolutions (144p to 4K) and MP4/MP3 formats
- **Built-in Video Player**: With PiP support and gesture controls
- **File Manager**: Rename, delete, view, and organize downloads
- **Private Vault**: PIN-protected secure storage for private videos
- **Dark/Light Theme**: Automatic theme switching with user preference
- **Mobile-First Design**: Optimized for mobile devices with responsive UI
- **Download Progress**: Real-time progress tracking and notifications

## Tech Stack

### Frontend
- **React 18** with TypeScript
- **Tailwind CSS** with shadcn/ui components
- **Wouter** for client-side routing
- **TanStack Query** for server state management
- **Vite** for fast development and optimized builds

### Backend
- **Node.js** with Express.js
- **TypeScript** for type safety
- **Drizzle ORM** with PostgreSQL support
- **Zod** for schema validation
- **In-memory storage** for development

## Quick Start

### Prerequisites
- Node.js 20+ 
- npm or yarn

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd video-downloader
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm run dev
```

The application will be available at `http://localhost:5000`

## Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm start` - Start production server
- `npm run db:push` - Deploy database schema

## Environment Variables

For production deployment, set the following environment variables:

```env
DATABASE_URL=postgresql://username:password@host:port/database
NODE_ENV=production
PORT=5000
```

## Production Deployment

### Option 1: Traditional Hosting (VPS/Cloud)

1. Build the application:
```bash
npm run build
```

2. Set environment variables
3. Start the production server:
```bash
npm start
```

### Option 2: Docker Deployment

1. Create `Dockerfile`:
```dockerfile
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
RUN npm run build
EXPOSE 5000
CMD ["npm", "start"]
```

2. Build and run:
```bash
docker build -t video-downloader .
docker run -p 5000:5000 video-downloader
```

### Option 3: Vercel/Netlify

The application is configured for easy deployment on modern hosting platforms:

- **Vercel**: Connect your GitHub repository and deploy automatically
- **Netlify**: Use the build command `npm run build` and publish directory `dist`
- **Railway**: Connect repository and set start command to `npm start`

## Database Setup

### Development
The application uses in-memory storage by default for development.

### Production
Configure PostgreSQL:

1. Create a PostgreSQL database
2. Set the `DATABASE_URL` environment variable
3. Run migrations: `npm run db:push`

## API Endpoints

- `GET /api/downloads` - Get all downloads
- `POST /api/downloads` - Create new download
- `PATCH /api/downloads/:id` - Update download status
- `DELETE /api/downloads/:id` - Delete download
- `POST /api/video-info` - Get video information from URL

## Architecture

The application follows a modern full-stack architecture:

- **Client**: React SPA with mobile-first responsive design
- **Server**: REST API with Express.js
- **Database**: PostgreSQL with Drizzle ORM
- **State Management**: React Context + TanStack Query
- **Styling**: Tailwind CSS with custom design system

## Security Features

- PIN-protected private vault
- Input validation with Zod schemas
- CORS protection
- Rate limiting (recommended for production)

## Browser Support

- Chrome/Chromium 90+
- Firefox 88+
- Safari 14+
- Edge 90+

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

MIT License - see LICENSE file for details

## Support

For issues and questions:
1. Check the documentation
2. Search existing issues
3. Create a new issue with detailed information

---

Built with ❤️ using modern web technologies