# PulseNow Backend API

> Backend API server for the Flutter assessment application

---

## 📋 Table of Contents

- [Overview](#overview)
- [Setup](#setup)
- [API Endpoints](#api-endpoints)
- [Health Check](#health-check)
- [Development](#development)

---

## 🎯 Overview

This backend API provides mock data endpoints for market data, analytics, and
portfolio management. Built with Node.js and Express.

**Tech Stack:**
- Node.js
- Express.js
- RESTful API
- WebSocket support

---

## ⚙️ Setup

### Prerequisites

- Node.js 14+ installed
- npm or yarn package manager

### Installation

1. **Install dependencies:**

```bash
npm install
```

2. **Start the server:**

```bash
npm start
```

**Server runs on:** `http://localhost:3000`

### Development Mode

For development with auto-reload:

```bash
npm run dev
```

---

## 🔌 API Endpoints

### Market Data

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/api/market-data` | Get all market symbols |
| `GET` | `/api/market-data/:symbol` | Get data for a specific symbol
  (e.g., BTC/USD) |
| `GET` | `/api/market-data/:symbol/history` | Get historical data |

**Query Parameters (History):**
- `timeframe` - Time frame (e.g., `1h`, `24h`, `7d`)
- `limit` - Number of records (default: 100)

**Example:**
```bash
GET /api/market-data/BTC/USD/history?timeframe=1h&limit=100
```

---

### Analytics

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/api/analytics/overview` | Get analytics overview |
| `GET` | `/api/analytics/trends` | Get market trends |
| `GET` | `/api/analytics/sentiment` | Get market sentiment |

**Query Parameters (Trends):**
- `timeframe` - Time frame (e.g., `24h`, `7d`, `30d`)

**Example:**
```bash
GET /api/analytics/trends?timeframe=24h
```

---

### Portfolio

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/api/portfolio` | Get portfolio summary |
| `GET` | `/api/portfolio/holdings` | Get portfolio holdings |
| `GET` | `/api/portfolio/performance` | Get performance metrics |
| `POST` | `/api/portfolio/transactions` | Add a transaction |

**Query Parameters (Performance):**
- `timeframe` - Time frame (e.g., `7d`, `30d`, `1y`)

**Example:**
```bash
GET /api/portfolio/performance?timeframe=7d
```

---

### WebSocket

**Connection:** `ws://localhost:3000`

Real-time market updates via WebSocket connection.

---

## 💚 Health Check

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/health` | Server health status |

**Response:**
```json
{
  "status": "ok",
  "timestamp": "2024-01-01T00:00:00.000Z"
}
```

---

## 🛠️ Development

### Project Structure

```
backend/
├── controllers/        # Route controllers
│   ├── analyticsController.js
│   ├── marketDataController.js
│   └── portfolioController.js
├── data/              # Mock data
│   ├── mockAnalytics.js
│   ├── mockMarketData.js
│   └── mockPortfolio.js
├── middlewares/       # Express middlewares
│   ├── errorHandler.js
│   ├── rateLimiter.js
│   └── requestLogger.js
├── server.js          # Entry point
└── package.json       # Dependencies
```

### Available Scripts

```bash
# Start server (production)
npm start

# Start server (development with auto-reload)
npm run dev
```

---

## 📝 Notes

- All endpoints return mock data for assessment purposes
- CORS is enabled for local development
- Rate limiting is configured for API protection
- Request logging is enabled for debugging

