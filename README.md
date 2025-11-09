# Sanayi (صنايعي) - Service Marketplace Platform

## Executive Summary

**Sanayi** is a comprehensive multi-platform service marketplace application designed to connect clients with skilled craftsmen and service providers. The platform facilitates seamless booking, communication, and service delivery through a robust ecosystem consisting of a RESTful API backend, cross-platform mobile applications, and an administrative web dashboard.

---

## System Architecture

The Sanayi platform is built on a **three-tier architecture**:

### 1. **Backend API** (`/Backend`)

- **Technology**: Node.js with Express.js framework
- **Database**: MongoDB (NoSQL) with Mongoose ODM
- **Caching**: Redis for session management and performance optimization
- **Authentication**: JWT-based authentication with refresh token mechanism
- **Communication**: Twilio integration for SMS-based OTP verification
- **Security**: Helmet.js, XSS protection, rate limiting, MongoDB injection prevention
- **Production URL**: [https://sanayi-api.vercel.app/api](https://sanayi-api.vercel.app/api)

### 2. **Mobile Application** (`/mobile_app`)

- **Framework**: Flutter (Dart)
- **Platform Support**: iOS, Android, Web, Windows, macOS, Linux
- **Architecture**: BLoC (Business Logic Component) pattern for state management
- **Internationalization**: Bilingual support (English/Arabic) with RTL layout support
- **Dependency Injection**: GetIt for service locator pattern
- **Networking**: Dio with Retrofit for type-safe API communication
- **Local Storage**: SharedPreferences for persistent data
- **UI/UX**: Custom animations (Lottie), responsive design with ScreenUtil

### 3. **Admin Dashboard** (`/Sanayi-Dashboard`)

- **Framework**: React.js with React Router v7
- **UI Components**: Custom components with FontAwesome icons
- **Statistics Dashboard**: Comprehensive statistics about users, bookings, reviews, and system overall
- **State Management**: React Context API
- **Authentication**: Protected routes with persistent login
- **Styling**: Custom CSS with responsive design

---

## Core Features

### User Management

- **Multi-role System**: Supports three distinct user roles:
  - **Clients**: Service seekers who can browse, book, and review craftsmen
  - **Craftsmen**: Service providers with detailed profiles, portfolios, and work schedules
  - **Administrators**: Platform managers with full system access
- **Phone Number Authentication**: Secure OTP-based verification via Twilio SMS
- **Profile Management**: Comprehensive user profiles with location, contact information, and profile pictures
- **Account Verification**: Phone verification system with OTP expiration
- **User Status**: Active/inactive user management with soft deletion
- **Location Services**: Country, city, and address management

### Craftsman Features

- **Specialization Management**: Multiple service categories per craftsman
- **Portfolio System**: Image galleries showcasing previous work with titles and descriptions
- **Work Schedule**: Flexible availability management with day-specific time slots (Saturday-Friday)
- **Pricing**: Hourly rate configuration with minimum validation
- **Rating System**: Aggregate ratings and reviews from clients with automatic calculation
- **Profile Customization**: Biography, contact information, and service descriptions
- **Performance Metrics**: Ratings quantity and average tracking

### Booking System

- **Service Booking**: Clients can book craftsmen for specific dates and times
- **Booking Status Management**:
  - `Pending` → `Confirmed` → `Completed`/`Cancelled` workflow
- **Price Calculation**: Dynamic pricing based on craftsman rates
- **Booking History**: Complete transaction history for both clients and craftsmen
- **Time Management**: Date and time slot booking with validation
- **Status Tracking**: Real-time booking status updates

### Review & Rating System

- **Post-Service Reviews**: Clients can rate and review completed bookings
- **Aggregate Ratings**: Automatic calculation of average ratings per craftsman
- **Rating Validation**: 1-5 star rating system with comment support
- **Review Association**: Reviews linked to specific bookings and craftsmen
- **Rating Statistics**: Quantity and average rating tracking

### Category Management

- **Service Categories**: Hierarchical category system for service classification
- **Category Icons**: Visual representation with custom icon URLs
- **Active/Inactive Status**: Category visibility management
- **Category Filtering**: Search and filter craftsmen by specialization

### Admin Dashboard Features

- **User Management**: Create, read, update, and delete user accounts
- **Booking Management**: View and manage all platform bookings
- **Analytics Dashboard**: Comprehensive statistics about users, bookings, reviews and overall system performance
- **Report Management**: Review and handle user-submitted reports
- **System Monitoring**: Platform health and activity tracking

---

## Technology Stack

### Backend Dependencies

```json
{
  "express": "^4.21.2",
  "mongoose": "^8.17.1",
  "mongodb": "^6.18.0",
  "redis": "^5.8.2",
  "ioredis": "^5.7.0",
  "jsonwebtoken": "^9.0.2",
  "bcrypt": "^6.0.0",
  "twilio": "^5.8.0",
  "nodemailer": "^7.0.5",
  "multer": "^2.0.2",
  "sharp": "^0.34.4",
  "helmet": "^8.1.0",
  "express-rate-limit": "^8.0.1",
  "xss-clean": "^0.1.4",
  "express-mongo-sanitize": "^2.2.0"
}
```

### Mobile App Dependencies

```yaml
dependencies:
  flutter_bloc: ^9.1.1
  dio: ^5.9.0
  retrofit: ^4.7.2
  easy_localization: ^3.0.8
  get_it: ^8.2.0
  shared_preferences: ^2.5.3
  flutter_screenutil: ^5.9.3
  lottie: ^3.3.1
  image_picker: ^1.2.0
  flutter_rating_bar: ^4.0.1
```

### Dashboard Dependencies

```json
{
  "react": "^19.1.0",
  "react-router-dom": "^7.8.2",
  "axios": "^1.12.1",
  "recharts": "^3.3.0",
  "react-toastify": "^11.0.5"
```

---

## Installation & Setup

### Prerequisites

- **Node.js** (v14 or higher)
- **MongoDB** (v4.4 or higher) or MongoDB Atlas account
- **Redis** (v6 or higher) or Redis Cloud account
- **Flutter SDK** (v3.8 or higher)
- **npm** or **yarn** package manager

### Backend Setup

1. **Navigate to Backend directory:**

   ```bash
   cd Backend
   ```

2. **Install dependencies:**

   ```bash
   npm install
   ```

3. **Configure environment variables:**
   Create/update `config.env` with the following:

   ```env
   NODE_ENV=development
   PORT=4000
   DATABASE=mongodb+srv://username:password@cluster.mongodb.net/
   DATABASE_PASSWORD=your_password

   JWT_ACCESS_SECRET=your_access_secret
   JWT_REFRESH_SECRET=your_refresh_secret
   JWT_ACCESS_EXPIRES_IN=15m
   JWT_REFRESH_EXPIRES_IN=30d

   TWILIO_SID=your_twilio_sid
   TWILIO_AUTH_TOKEN=your_twilio_token
   TWILIO_PHONE_NUMBER=+1234567890

   OTP_SECRET=your_otp_secret
   OTP_EXPIRES_IN=10m

   REDIS_URL=redis://default:password@host:port
   REDIS_PASSWORD=your_redis_password
   ```

4. **Run the server:**

   ```bash
   # Development mode
   npm run start:dev
   ```

### Mobile App Setup

1. **Navigate to mobile_app directory:**

   ```bash
   cd mobile_app
   ```

2. **Install Flutter dependencies:**

   ```bash
   flutter pub get
   ```

3. **Configure API endpoint:**
   Update the base URL in `lib/core/` API configuration files

4. **Run the application:**

   ```bash
   # iOS
   flutter run -d ios

   # Android
   flutter run -d android

   # Web
   flutter run -d chrome
   ```

### Dashboard Setup

1. **Navigate to Sanayi-Dashboard directory:**

   ```bash
   cd Sanayi-Dashboard
   ```

2. **Install dependencies:**

   ```bash
   npm install
   ```

3. **Configure API endpoint:**
   Update API base URL in `src/Api/` configuration

4. **Run the development server:**
   ```bash
   npm start
   ```

---

## API Endpoints

**Base URL**: `https://sanayi-api.vercel.app/api`


### Authentication

- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `POST /api/auth/verify-otp` - OTP verification
- `POST /api/auth/refresh-token` - Refresh access token
- `POST /api/auth/logout` - User logout

### Users

- `GET /api/users` - Get all users (Admin)
- `GET /api/users/:id` - Get user by ID
- `PATCH /api/users/:id` - Update user
- `DELETE /api/users/:id` - Delete user

### Craftsmen

- `GET /api/craftsmen` - Get all craftsmen with filters
- `GET /api/craftsmen/:id` - Get craftsman details
- `POST /api/craftsmen` - Create craftsman profile
- `PATCH /api/craftsmen/:id` - Update craftsman profile

### Bookings

- `GET /api/bookings` - Get all bookings (with filters)
- `GET /api/bookings/:id` - Get booking details
- `POST /api/bookings` - Create new booking
- `PATCH /api/bookings/:id` - Update booking status
- `DELETE /api/bookings/:id` - Cancel booking

### Reviews

- `GET /api/reviews` - Get all reviews
- `GET /api/reviews/:id` - Get review details
- `POST /api/reviews` - Create review
- `PATCH /api/reviews/:id` - Update review

### Categories

- `GET /api/categories` - Get all categories
- `POST /api/categories` - Create category (Admin)
- `PATCH /api/categories/:id` - Update category (Admin)

---

## Security Features

### Backend Security

- **Helmet.js**: HTTP header security
- **Rate Limiting**: 100 requests per hour per IP
- **XSS Protection**: Input sanitization
- **MongoDB Injection Prevention**: Query sanitization
- **JWT Authentication**: Secure token-based auth
- **Password Hashing**: BCrypt with salt rounds
- **CORS**: Cross-origin resource sharing configuration
- **HPP Protection**: HTTP parameter pollution prevention

---

## Database Schema

### User Model

- Phone number (unique, indexed)
- Name, role (client/craftsman/admin)
- Profile picture
- Location (country, city, address)
- Account status (active, verified)
- Password (hashed)
- Refresh token (hashed)

### Craftsman Model

- User reference
- Specializations (category references)
- Work schedule (day-based availability)
- Portfolio (images with descriptions)
- Hourly rate
- Ratings (average, quantity)

### Booking Model

- Client reference
- Craftsman reference
- Date and time
- Price
- Status (pending/confirmed/completed/cancelled)
- Timestamps

### Review Model

- Client reference
- Craftsman reference
- Booking reference
- Rating (1-5)
- Comment
- Timestamps

### Category Model

- Name (unique)
- Icon URL
- Active status

---

## Performance Optimizations

### Backend

- **Database Indexing**: Strategic indexes on frequently queried fields
- **Redis Caching**: Session and data caching
- **Image Optimization**: Sharp library for image processing
- **Query Optimization**: Mongoose query optimization with select and populate

### Mobile App

- **State Management**: Efficient BLoC pattern implementation
- **Image Caching**: Optimized image loading
- **Lazy Loading**: On-demand data loading
- **Screen Adaptation**: Responsive design with ScreenUtil

---

## Version History

- **v1.0.0** - Initial release
  - Core functionality implementation
  - Multi-platform support
  - Admin dashboard
  - Complete booking system
  - Review and rating system

---

## Future Enhancements

- Company Management System
- Payment gateway integration
- Push notifications
- Real-time chat functionality
- Advanced search and filtering
- Recommendation engine
- Analytics dashboard enhancements
- Video portfolio support
- Service subscription plans

---

_Last Updated: 2025_
