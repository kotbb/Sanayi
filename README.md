# Sanayi

Sanayi is a service marketplace app that connects clients with craftsmen.

This repository includes:

- `Backend` (Node.js/Express API)
- `mobile_app` (Flutter app)
- `Sanayi-Dashboard` (React admin dashboard)

## Features We Built

### Backend (API)

- OTP registration flow
- Login/logout with JWT access + refresh token rotation
- Role-based users (`client`, `craftsman`, `admin`)
- Modules for users, craftsmen, profiles, categories, bookings, reviews, companies, and reports
- Security stack: helmet, rate limit, NoSQL sanitize, XSS clean, HPP protection
- Global error handling, with the API deployed on Vercel at [https://sanayi-api.vercel.app/api](https://sanayi-api.vercel.app/api)

### Admin Dashboard

- Protected admin login with persisted session
- User management flow (list/create/update/manage users)
- Booking monitoring page
- Reports page for submitted issues/reports
- Dashboard layout with sidebar navigation and notifications

### Flutter App

- OTP auth flow (register, verify OTP, login, logout)
- Arabic/English localization and responsive UI
- Categories and craftsmen browsing
- Booking flow (create booking, my bookings, booking updates)
- Profile/settings screens (edit profile, contact us, language, policies)
- Token persistence and refresh integration with backend API

## Run Locally

Backend:

```bash
cd Backend
npm install
npm run start:dev
```

Mobile app:

```bash
cd mobile_app
flutter pub get
flutter run
```

Dashboard:

```bash
cd Sanayi-Dashboard
npm install
npm start
```

## Quick Notes

- I worked on the `Backend` part of this project, while the rest of the team worked on `Flutter` and `Admin-Dashboard`.
- Make sure the config vars is included here `Backend/config.env`.
- You can import dev data from backend with `npm run data:import`.
- You can remove data with `npm run data:delete`.
- imported users password is `test1234`.
