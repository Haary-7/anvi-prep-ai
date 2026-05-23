# Anvi Prep AI - Production-Grade README

> An AI-powered competitive exam preparation platform designed for next-generation learning

[![Frontend CI](https://github.com/anvi-prep-ai/anvi-prep-ai/workflows/frontend-ci/badge.svg)](https://github.com/anvi-prep-ai/anvi-prep-ai/actions)
[![Backend CI](https://github.com/anvi-prep-ai/anvi-prep-ai/workflows/backend-ci/badge.svg)](https://github.com/anvi-prep-ai/anvi-prep-ai/actions)
[![Docker Build](https://github.com/anvi-prep-ai/anvi-prep-ai/workflows/docker-build/badge.svg)](https://github.com/anvi-prep-ai/anvi-prep-ai/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)

---

## Table of Contents

1. [Project Overview](#project-overview)
2. [Core Features](#core-features)
3. [Tech Stack](#tech-stack)
4. [System Architecture](#system-architecture)
5. [Local Development Setup](#local-development-setup)
6. [Docker & Containerization](#docker--containerization)
7. [API Documentation](#api-documentation)
8. [Database Schema](#database-schema)
9. [AI Pipeline](#ai-pipeline)
10. [Deployment Guide](#deployment-guide)
11. [Monitoring & Observability](#monitoring--observability)
12. [CI/CD Pipeline](#cicd-pipeline)
13. [Security Best Practices](#security-best-practices)
14. [Scaling Strategy](#scaling-strategy)
15. [Contributing](#contributing)
16. [Future Roadmap](#future-roadmap)

---

## Project Overview

### What is Anvi Prep AI?

Anvi Prep AI is a **production-grade AI-powered platform** for competitive exam preparation. We combine adaptive learning, AI-driven tutoring, and comprehensive analytics to transform how students prepare for exams.

**Initial Focus:** SSC CGL (Staff Selection Commission Combined Graduate Level)

**Vision:** Create a scalable learning platform supporting multiple competitive exams including Banking, UPSC, CAT, and GATE.

### Why Anvi Prep AI?

- **Personalized Learning:** AI adapts difficulty and content to individual learner patterns
- **Comprehensive Analytics:** Deep insights into strengths, weaknesses, and performance trends
- **Real-time AI Tutor:** 24/7 AI assistance powered by Llama 3 via Ollama
- **Image-based Problem Solving:** Solve problems by uploading question images (OCR + AI)
- **Mock Test Engine:** Full-length mock tests with detailed analysis
- **Leaderboards & Gamification:** Community engagement and healthy competition
- **Scalable Architecture:** Built to handle millions of users globally

---

## Core Features

### 1. Authentication & Authorization
- **Multi-factor Authentication (MFA):** Email OTP verification
- **JWT-based Sessions:** Stateless, scalable authentication
- **Role-based Access Control (RBAC):** Admin, instructor, student roles
- **Social Login (Phase 2):** Google, GitHub integration

### 2. Quiz Engine
- **Dynamic Quiz Generation:** Pull from AI-curated question bank
- **Real-time Evaluation:** Instant feedback and scoring
- **Detailed Explanations:** AI-generated explanations for every answer
- **Question Analytics:** Track performance per question and category
- **Bookmarking:** Save questions for later review

### 3. Mock Tests
- **Full-length Simulations:** Mimic actual exam conditions
- **Timed Sessions:** Configurable duration with timer
- **Question Randomization:** Unique test instances per user
- **Detailed Result Analysis:** Question-wise, section-wise breakdown
- **Performance Comparison:** Compare with your previous attempts

### 4. Performance Analytics
- **Strength/Weakness Heatmap:** Visual representation of topic mastery
- **Progress Timeline:** Performance trends over time
- **Comparative Analytics:** Percentile ranking vs. all users
- **Predictive Analytics:** Estimated exam score based on performance
- **Category-wise Breakdown:** Subject-wise performance metrics

### 5. AI Tutor (24/7 Assistance)
- **Conversational Learning:** Chat-based AI assistance
- **Context-aware Responses:** Understands exam context
- **Question Solving:** Step-by-step problem solutions
- **Concept Explanations:** Deep dives into difficult topics
- **Study Recommendations:** AI suggests next steps based on weakness

### 6. Image-based Question Solver
- **OCR Integration:** Extract text from question images
- **AI Problem Solving:** Analyze and solve uploaded questions
- **Step-by-step Solutions:** Detailed working and reasoning
- **Solution History:** Track previously solved questions

### 7. Daily Schedule & Study Plans
- **Adaptive Scheduling:** AI creates personalized study plans
- **Task Management:** Daily tasks aligned with exam goals
- **Time Optimization:** Recommended study time per topic
- **Progress Tracking:** Daily achievement metrics

### 8. Leaderboards & Community
- **Global Leaderboards:** Rank against all users
- **Subject-wise Rankings:** Category-specific rankings
- **Achievements & Badges:** Gamification elements
- **Study Streaks:** Consistency tracking

### 9. Subscription & Monetization (Phase 2)
- **Freemium Model:** Free tier with limited quizzes
- **Premium Tier:** Unlimited access to all features
- **Stripe Integration:** Secure payment processing
- **Usage Analytics:** Track revenue per feature

---

## Tech Stack

### **Frontend**
| Technology | Purpose | Version |
|-------------|---------|---------|
| **Next.js** | React framework with App Router | 14+ |
| **TypeScript** | Type-safe development | 5.x |
| **Tailwind CSS** | Utility-first styling | 3.x |
| **shadcn/ui** | Accessible component library | Latest |
| **Framer Motion** | Smooth animations | 10.x |
| **TanStack Query** | Server state management | 5.x |
| **Zustand** | Client state (optional) | 4.x |
| **Zod** | Schema validation | 3.x |

### **Backend**
| Technology | Purpose | Version |
|-------------|---------|---------|
| **FastAPI** | Async web framework | 0.104+ |
| **Python** | Backend language | 3.11+ |
| **SQLAlchemy** | ORM for database | 2.0+ |
| **Alembic** | Database migrations | 1.12+ |
| **Pydantic** | Data validation | 2.x |
| **JWT (PyJWT)** | Token management | 2.x |
| **Bcrypt** | Password hashing | 4.x |

### **Database**
| Technology | Purpose |
|-------------|---------|
| **PostgreSQL** | Primary OLTP database (15+) |
| **Redis** | Caching & session store (7.0+) |

### **AI/ML Stack**
| Technology | Purpose |
|-------------|---------|
| **Ollama** | Local LLM runtime |
| **Llama 3** | Open-source language model (70B) |
| **ChromaDB** | Vector database for embeddings |
| **LangChain** | LLM orchestration framework (v0.1+) |
| **Tesseract OCR** | Image text extraction |

### **DevOps & Infrastructure**
| Technology | Purpose |
|-------------|---------|
| **Docker** | Containerization |
| **Docker Compose** | Local orchestration |
| **Nginx** | Reverse proxy & load balancing |
| **GitHub Actions** | CI/CD automation |
| **Prometheus** | Metrics collection |
| **Grafana** | Metrics visualization |
| **Loki** | Centralized logging |
| **Jaeger** | Distributed tracing |

### **Deployment Targets**
| Platform | Stage | Purpose |
|----------|-------|---------|
| **Vercel** | Production | Frontend hosting |
| **Render/Railway** | Production | Backend API |
| **AWS** | Future | Scalable infrastructure |
| **Kubernetes** | Future | Orchestration |

---

## System Architecture

### High-Level Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                         CDN (Vercel)                            │
├─────────────────────────────────────────────────────────────────┤
│
│  ┌──────────────────────────────────────────────────────────┐
│  │            Next.js Frontend (Web Browser)                │
│  │  ├─ Authentication Pages                                 │
│  │  ├─ Quiz Engine UI                                       │
│  │  ├─ Analytics Dashboards                                 │
│  │  ├─ AI Tutor Chat Interface                              │
│  │  └─ Mock Test Interface                                  │
│  └──────────────────────────────────────────────────────────┘
│                            │
│                            │ HTTPS / REST / WebSocket
│                            ▼
│  ┌──────────────────────────────────────────────────────────┐
│  │              Nginx Reverse Proxy (Port 80/443)           │
│  │  ├─ SSL/TLS Termination                                  │
│  │  ├─ Rate Limiting                                        │
│  │  └─ Load Balancing                                       │
│  └──────────────────────────────────────────────────────────┘
│                            │
│        ┌───────────────────┼───────────────────┐
│        │                   │                   │
│        ▼                   ▼                   ▼
│   ┌─────────────┐  ┌──────────────┐  ┌──────────────┐
│   │  FastAPI    │  │  FastAPI     │  │  FastAPI     │
│   │  Backend    │  │  Backend     │  │  Backend     │
│   │  Instance 1 │  │  Instance 2  │  │  Instance N  │
│   └─────────────┘  └──────────────┘  └──────────────┘
│        │                   │                   │
│        └───────────────────┼───────────────────┘
│                            │
│            ┌───────────────┼───────────────┐
│            │               │               │
│            ▼               ▼               ▼
│      ┌──────────┐   ┌──────────┐   ┌──────────────┐
│      │PostgreSQL│   │  Redis   │   │  AI Engine   │
│      │ Database │   │  Cache   │   │  (Ollama)    │
│      │ (15+)    │   │  (7.0+)  │   │  Llama 3     │
│      └──────────┘   └──────────┘   └──────────────┘
│
│  ┌─────────────────────────────────────────────────────┐
│  │          Monitoring & Observability Stack           │
│  │  ├─ Prometheus (Metrics)                            │
│  │  ├─ Grafana (Dashboards)                            │
│  │  ├─ Loki (Logs)                                     │
│  │  └─ Jaeger (Traces)                                 │
│  └─────────────────────────────────────────────────────┘
└─────────────────────────────────────────────────────────────────┘
```

### Request Flow

```
User Request
    ↓
Vercel (Next.js)
    ↓
TanStack Query (Client Cache)
    ↓
Nginx (Rate Limit, SSL)
    ↓
FastAPI (Authentication → Route → Service)
    ↓
    ├─→ Database (PostgreSQL)
    ├─→ Cache (Redis) - Check first, then DB
    ├─→ AI Service (Ollama for LLM)
    └─→ Vector DB (ChromaDB for embeddings)
    ↓
Response → Client → UI Update
```

### Data Flow for AI Tutor

```
User Question (Chat)
    ↓
API → /api/v1/ai_tutor/chat
    ↓
AuthMiddleware (Verify JWT)
    ↓
AIService.generate_response()
    ├─ Check Cache (Redis) for similar queries
    ├─ Vector Search (ChromaDB) for context
    ├─ Prompt Engineering
    ├─ LLM Inference (Ollama → Llama 3)
    └─ Response Formatting
    ↓
Stream Response → WebSocket → Client
    ↓
Cache Response (Redis)
    ↓
Log Interaction (Analytics)
```

---

## Local Development Setup

### Prerequisites

- **Node.js:** 18.17+ (includes npm)
- **Python:** 3.11+
- **PostgreSQL:** 15+
- **Redis:** 7.0+
- **Ollama:** Latest (with Llama 3 model)
- **Docker & Docker Compose:** Latest stable
- **Git:** 2.40+

### Step 1: Clone Repository

```bash
# Clone the repository
git clone https://github.com/yourusername/anvi-prep-ai.git
cd anvi-prep-ai

# Create working branches
git checkout -b develop
git checkout -b feature/your-feature-name
```

### Step 2: Frontend Setup

```bash
cd apps/web

# Install dependencies
npm install

# Create environment files
cp .env.example .env.local
cp .env.example .env.development

# Update .env.local with your values
NEXT_PUBLIC_API_URL=http://localhost:8000
NEXT_PUBLIC_APP_URL=http://localhost:3000
NEXT_PUBLIC_ENV=development

# Install Playwright for e2e tests (optional)
npx playwright install

# Run frontend development server
npm run dev
# Frontend available at http://localhost:3000
```

### Step 3: Backend Setup

```bash
cd apps/api

# Create Python virtual environment
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements-dev.txt

# Create environment file
cp .env.example .env.local

# Update .env.local
DATABASE_URL=postgresql://user:password@localhost:5432/anvi_prep_ai
REDIS_URL=redis://localhost:6379/0
SECRET_KEY=your-secret-key-here-min-32-chars
ALGORITHM=HS256
JWT_EXPIRATION_HOURS=24

# Initialize database
python -m alembic upgrade head

# Create admin user
python scripts/create_admin.py

# Seed sample data (optional)
python scripts/seed_data.py

# Run backend server
python -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
# Backend available at http://localhost:8000
# Docs available at http://localhost:8000/docs
```

### Step 4: AI Services Setup

```bash
cd services/ai_engine

# Create Python virtual environment
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Ensure Ollama is running
# In another terminal: ollama run llama3

# Create environment file
cp .env.example .env.local

OLLAMA_BASE_URL=http://localhost:11434
CHROMA_DB_PATH=./chroma_data

# Run AI services
python -m uvicorn main:app --reload --host 0.0.0.0 --port 8001
# Available at http://localhost:8001
```

### Step 5: Database Setup

```bash
# Ensure PostgreSQL is running
# Option 1: Local PostgreSQL instance
psql -U postgres -h localhost

# Create database and user
CREATE DATABASE anvi_prep_ai;
CREATE USER anvi_user WITH PASSWORD 'secure_password';
ALTER ROLE anvi_user SET client_encoding TO 'utf8';
ALTER ROLE anvi_user SET default_transaction_isolation TO 'read committed';
ALTER ROLE anvi_user SET default_transaction_deferrable TO on;
ALTER ROLE anvi_user SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE anvi_prep_ai TO anvi_user;

# Run migrations
cd apps/api
alembic upgrade head
```

### Step 6: Redis Setup

```bash
# Ensure Redis is running
redis-server

# Verify Redis connection
redis-cli ping
# Response: PONG

# Optional: Use Redis client UI
npm install -g redis-commander
redis-commander
# Available at http://localhost:8081
```

### Step 7: Ollama Setup

```bash
# Install Ollama (https://ollama.ai)
# Or use Docker
docker run -d -p 11434:11434 -v ollama:/root/.ollama --name ollama ollama/ollama

# Pull Llama 3 model (8B version for development, 70B for production)
ollama pull llama3:8b

# Verify Ollama is working
curl http://localhost:11434/api/tags

# Test generation
curl -X POST http://localhost:11434/api/generate -d '{
  "model": "llama3:8b",
  "prompt": "Hello, how are you?",
  "stream": false
}'
```

### Step 8: Verify All Services

```bash
# Terminal 1: Frontend
cd apps/web && npm run dev

# Terminal 2: Backend
cd apps/api && source venv/bin/activate && python -m uvicorn app.main:app --reload

# Terminal 3: AI Services
cd services/ai_engine && source venv/bin/activate && python -m uvicorn main:app --reload --port 8001

# Terminal 4: Ollama
ollama run llama3:8b

# Terminal 5: Redis
redis-server

# Test Health Endpoints
curl http://localhost:3000/                    # Frontend
curl http://localhost:8000/api/health/         # Backend
curl http://localhost:8001/health/             # AI Services
```

---

## Docker & Containerization

### Docker Compose - Local Development

```bash
# Start all services
docker-compose up -d

# View logs
docker-compose logs -f

# Specific service logs
docker-compose logs -f backend

# Stop all services
docker-compose down

# Remove volumes (careful!)
docker-compose down -v

# Rebuild services
docker-compose build --no-cache
docker-compose up -d
```

### Docker Compose - Production

```bash
# Use production compose
docker-compose -f docker-compose.prod.yml up -d

# Update containers
docker-compose -f docker-compose.prod.yml pull
docker-compose -f docker-compose.prod.yml up -d

# Monitor production
docker-compose -f docker-compose.prod.yml logs -f
```

### Individual Container Builds

```bash
# Build Frontend Docker image
docker build -f infrastructure/docker/Dockerfile.frontend -t anvi-prep-ai/web:latest .
docker run -p 3000:3000 anvi-prep-ai/web:latest

# Build Backend Docker image
docker build -f infrastructure/docker/Dockerfile.backend -t anvi-prep-ai/api:latest apps/api
docker run -p 8000:8000 --env-file .env anvi-prep-ai/api:latest

# Build AI Services
docker build -f infrastructure/docker/Dockerfile.ai -t anvi-prep-ai/ai:latest services/ai_engine
docker run -p 8001:8001 --env-file .env anvi-prep-ai/ai:latest

# Build Nginx
docker build -f infrastructure/docker/Dockerfile.nginx -t anvi-prep-ai/nginx:latest infrastructure/nginx
docker run -p 80:80 -p 443:443 anvi-prep-ai/nginx:latest
```

### Docker Network & Communication

```bash
# Services communicate via Docker network
# Frontend: http://backend:8000
# AI Services: http://ai:8001
# PostgreSQL: postgres:5432
# Redis: redis:6379

# Example: Backend to PostgreSQL
DATABASE_URL=postgresql://user:password@postgres:5432/anvi_prep_ai

# Example: Backend to Redis
REDIS_URL=redis://redis:6379/0

# Example: Backend to AI Services
AI_SERVICE_URL=http://ai:8001
```

### Dockerfile Best Practices

```dockerfile
# Multi-stage build for smaller images
FROM python:3.11-slim as builder
WORKDIR /build
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

FROM python:3.11-slim
WORKDIR /app
COPY --from=builder /root/.local /root/.local
COPY . .
ENV PATH=/root/.local/bin:$PATH
EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0"]
```

---

## API Documentation

### Authentication API

#### Register User
```http
POST /api/v1/auth/register
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "SecurePassword123!",
  "full_name": "John Doe",
  "exam_type": "ssc_cgl"
}

Response (201):
{
  "user_id": "uuid",
  "email": "user@example.com",
  "full_name": "John Doe",
  "created_at": "2024-01-15T10:30:00Z"
}
```

#### Login
```http
POST /api/v1/auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "SecurePassword123!"
}

Response (200):
{
  "access_token": "eyJhbGc...",
  "refresh_token": "eyJhbGc...",
  "token_type": "bearer",
  "expires_in": 86400,
  "user": {
    "user_id": "uuid",
    "email": "user@example.com",
    "full_name": "John Doe"
  }
}
```

#### Refresh Token
```http
POST /api/v1/auth/refresh
Authorization: Bearer <refresh_token>

Response (200):
{
  "access_token": "eyJhbGc...",
  "token_type": "bearer",
  "expires_in": 86400
}
```

### Quiz API

#### Get All Quizzes
```http
GET /api/v1/quiz?page=1&limit=20&category=general_awareness&difficulty=medium
Authorization: Bearer <access_token>

Response (200):
{
  "total": 150,
  "page": 1,
  "limit": 20,
  "items": [
    {
      "quiz_id": "uuid",
      "title": "General Awareness - Current Affairs",
      "description": "Test your knowledge...",
      "category": "general_awareness",
      "difficulty": "medium",
      "total_questions": 20,
      "duration_minutes": 30,
      "avg_rating": 4.5,
      "your_score": 15
    }
  ]
}
```

#### Get Quiz Details
```http
GET /api/v1/quiz/{quiz_id}
Authorization: Bearer <access_token>

Response (200):
{
  "quiz_id": "uuid",
  "title": "General Awareness - Current Affairs",
  "description": "...",
  "category": "general_awareness",
  "difficulty": "medium",
  "total_questions": 20,
  "duration_minutes": 30,
  "questions": [
    {
      "question_id": "uuid",
      "question_text": "What is the capital of India?",
      "question_type": "multiple_choice",
      "options": ["Delhi", "Mumbai", "Bangalore", "Hyderabad"],
      "media_url": null
    }
  ]
}
```

#### Submit Quiz Attempt
```http
POST /api/v1/quiz/{quiz_id}/submit
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "answers": [
    {
      "question_id": "uuid",
      "selected_option": 0,
      "time_spent_seconds": 45
    }
  ],
  "total_time_seconds": 1800
}

Response (200):
{
  "attempt_id": "uuid",
  "quiz_id": "uuid",
  "user_id": "uuid",
  "total_questions": 20,
  "correct_answers": 15,
  "score": 75,
  "percentage": 75.0,
  "accuracy": 0.75,
  "category_breakdown": {
    "general_awareness": {
      "correct": 5,
      "total": 8,
      "percentage": 62.5
    }
  },
  "time_analysis": {
    "avg_time_per_question": 90,
    "total_time_seconds": 1800
  }
}
```

### Analytics API

#### Get User Analytics
```http
GET /api/v1/analytics/summary
Authorization: Bearer <access_token>

Response (200):
{
  "total_quizzes_attempted": 45,
  "total_mocks_attempted": 5,
  "overall_accuracy": 0.72,
  "current_rank": 1205,
  "percentile": 85.3,
  "strength_areas": ["General Awareness", "Reasoning"],
  "weak_areas": ["Quantitative Aptitude"],
  "recent_performance": [
    {
      "date": "2024-01-15",
      "accuracy": 0.78,
      "quizzes_attempted": 3
    }
  ],
  "target_score": 260,
  "estimated_score": 245,
  "estimated_score_percentile": 82.0
}
```

### AI Tutor API

#### Start AI Chat
```http
POST /api/v1/ai_tutor/chat
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "message": "Explain photosynthesis in simple terms",
  "context": "general_awareness",  # optional
  "previous_messages": []  # optional
}

Response (200):
{
  "session_id": "uuid",
  "message_id": "uuid",
  "response": "Photosynthesis is a process...",
  "sources": ["https://..."],
  "follow_up_questions": [
    "What are the stages of photosynthesis?",
    "How does this relate to SSC exams?"
  ]
}
```

### Image Solver API

#### Upload Question Image
```http
POST /api/v1/image_solver/solve
Authorization: Bearer <access_token>
Content-Type: multipart/form-data

{
  "file": <image_file>,
  "exam_type": "ssc_cgl"
}

Response (200):
{
  "solve_request_id": "uuid",
  "extracted_text": "A man travels 50km...",
  "solution": "Step 1: ...",
  "answer": "B",
  "confidence": 0.92,
  "explanation": "This is a distance-time problem...",
  "processing_time_ms": 2345
}
```

### Error Response Format

```http
Response (400/500):
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid email format",
    "details": [
      {
        "field": "email",
        "message": "Must be a valid email"
      }
    ]
  },
  "timestamp": "2024-01-15T10:30:00Z",
  "request_id": "req_abc123xyz"
}
```

---

## Environment Variables

### Frontend (.env.local)

```bash
# API Configuration
NEXT_PUBLIC_API_URL=http://localhost:8000
NEXT_PUBLIC_AI_API_URL=http://localhost:8001
NEXT_PUBLIC_APP_URL=http://localhost:3000

# Environment
NEXT_PUBLIC_ENV=development

# Third-party Services
NEXT_PUBLIC_GOOGLE_CLIENT_ID=your-google-client-id
NEXT_PUBLIC_STRIPE_PUBLIC_KEY=pk_test_...

# Analytics (optional)
NEXT_PUBLIC_GA_ID=G-XXXXXXXXXX

# Feature Flags
NEXT_PUBLIC_ENABLE_IMAGE_SOLVER=true
NEXT_PUBLIC_ENABLE_LEADERBOARD=true
NEXT_PUBLIC_ENABLE_PREMIUM=false
```

### Backend (.env.local)

```bash
# Database
DATABASE_URL=postgresql://anvi_user:password@localhost:5432/anvi_prep_ai
REDIS_URL=redis://localhost:6379/0

# JWT & Security
SECRET_KEY=your-super-secret-key-min-32-characters
ALGORITHM=HS256
JWT_EXPIRATION_HOURS=24
REFRESH_TOKEN_EXPIRATION_DAYS=30

# CORS
CORS_ORIGINS=http://localhost:3000,http://localhost:3001

# Email Configuration
SMTP_SERVER=smtp.gmail.com
SMTP_PORT=587
SMTP_USERNAME=your-email@gmail.com
SMTP_PASSWORD=your-app-password
SENDER_EMAIL=noreply@anvi-prep-ai.com

# AI Services
AI_SERVICE_URL=http://localhost:8001
OLLAMA_BASE_URL=http://localhost:11434

# Stripe (Payment)
STRIPE_SECRET_KEY=sk_test_...
STRIPE_WEBHOOK_SECRET=whsec_...

# Logging
LOG_LEVEL=INFO
LOG_FORMAT=json

# Rate Limiting
RATE_LIMIT_ENABLED=true
RATE_LIMIT_REQUESTS_PER_MINUTE=60

# Environment
ENVIRONMENT=development
DEBUG=true
```

### AI Services (.env.local)

```bash
# LLM Configuration
OLLAMA_BASE_URL=http://localhost:11434
MODEL_NAME=llama3:8b
MODEL_CONTEXT_SIZE=8096

# Vector Database
CHROMA_DB_PATH=./chroma_data
CHROMA_PERSISTENCE_ENABLED=true

# Embeddings
EMBEDDING_MODEL=all-MiniLM-L6-v2

# Performance
MAX_TOKENS=2000
TEMPERATURE=0.7
TOP_P=0.9

# Logging
LOG_LEVEL=INFO

# Security
API_KEY_BACKEND=your-internal-api-key
API_KEY_REQUIRED=true
```

---

## Database Schema

### Core Tables

```sql
-- Users Table
CREATE TABLE users (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    profile_picture_url TEXT,
    bio TEXT,
    exam_type VARCHAR(50) NOT NULL, -- ssc_cgl, banking, upsc, etc.
    subscription_tier VARCHAR(50) DEFAULT 'free', -- free, premium, pro
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- Quiz Table
CREATE TABLE quizzes (
    quiz_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(100) NOT NULL, -- general_awareness, math, reasoning
    subcategory VARCHAR(100),
    difficulty VARCHAR(50) DEFAULT 'medium', -- easy, medium, hard
    exam_type VARCHAR(50) NOT NULL,
    total_questions INTEGER NOT NULL,
    duration_minutes INTEGER,
    passing_score INTEGER,
    avg_rating DECIMAL(3, 2),
    created_by UUID NOT NULL REFERENCES users(user_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Questions Table
CREATE TABLE questions (
    question_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    quiz_id UUID NOT NULL REFERENCES quizzes(quiz_id) ON DELETE CASCADE,
    question_text TEXT NOT NULL,
    question_type VARCHAR(50) DEFAULT 'multiple_choice', -- multiple_choice, true_false, fill_blank
    options JSONB, -- ["Option A", "Option B", "Option C", "Option D"]
    correct_option INTEGER, -- 0-indexed
    explanation TEXT,
    difficulty VARCHAR(50) DEFAULT 'medium',
    topic VARCHAR(100),
    image_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- User Quiz Attempts
CREATE TABLE user_quiz_attempts (
    attempt_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(user_id),
    quiz_id UUID NOT NULL REFERENCES quizzes(quiz_id),
    total_questions INTEGER NOT NULL,
    correct_answers INTEGER NOT NULL,
    score DECIMAL(5, 2),
    percentage DECIMAL(5, 2),
    accuracy DECIMAL(5, 4),
    time_spent_seconds INTEGER,
    started_at TIMESTAMP,
    completed_at TIMESTAMP,
    status VARCHAR(50) DEFAULT 'completed', -- in_progress, completed, abandoned
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- User Answers
CREATE TABLE user_answers (
    answer_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    attempt_id UUID NOT NULL REFERENCES user_quiz_attempts(attempt_id),
    question_id UUID NOT NULL REFERENCES questions(question_id),
    selected_option INTEGER, -- 0-indexed or null for skip
    is_correct BOOLEAN,
    time_spent_seconds INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Performance Analytics
CREATE TABLE performance_analytics (
    analytics_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(user_id),
    category VARCHAR(100) NOT NULL,
    topic VARCHAR(100),
    total_questions_attempted INTEGER,
    correct_answers INTEGER,
    accuracy DECIMAL(5, 4),
    average_time_per_question INTEGER,
    difficulty_level VARCHAR(50),
    last_attempted TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, category, topic)
);

-- AI Chat History
CREATE TABLE ai_conversations (
    conversation_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(user_id),
    session_id UUID,
    message_text TEXT NOT NULL,
    response_text TEXT NOT NULL,
    context_type VARCHAR(100), -- quiz_question, general, topic_explanation
    context_id UUID, -- quiz_id or question_id
    helpful BOOLEAN, -- User feedback
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Daily Schedule
CREATE TABLE daily_schedules (
    schedule_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(user_id),
    scheduled_date DATE NOT NULL,
    recommended_topics JSONB, -- ["Topic1", "Topic2"]
    recommended_duration_minutes INTEGER,
    completed_tasks INTEGER,
    total_tasks INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, scheduled_date)
);

-- Leaderboard (Materialized View)
CREATE MATERIALIZED VIEW leaderboard AS
SELECT 
    u.user_id,
    u.full_name,
    COUNT(DISTINCT uqa.attempt_id) as total_attempts,
    AVG(uqa.accuracy) as avg_accuracy,
    SUM(uqa.score) as total_score,
    RANK() OVER (ORDER BY AVG(uqa.accuracy) DESC) as rank
FROM users u
LEFT JOIN user_quiz_attempts uqa ON u.user_id = uqa.user_id
WHERE u.is_active = true
GROUP BY u.user_id, u.full_name;

-- Indexes for Performance
CREATE INDEX idx_user_quiz_attempts_user_id ON user_quiz_attempts(user_id);
CREATE INDEX idx_user_quiz_attempts_quiz_id ON user_quiz_attempts(quiz_id);
CREATE INDEX idx_user_quiz_attempts_created_at ON user_quiz_attempts(created_at);
CREATE INDEX idx_user_answers_attempt_id ON user_answers(attempt_id);
CREATE INDEX idx_performance_analytics_user_id ON performance_analytics(user_id);
CREATE INDEX idx_questions_quiz_id ON questions(quiz_id);
CREATE INDEX idx_quizzes_category ON quizzes(category);
CREATE INDEX idx_quizzes_exam_type ON quizzes(exam_type);
```

---

## AI Pipeline

### Architecture

```
Question Input
    ↓
Text Preprocessing (Tokenization, Cleaning)
    ↓
Embedding Generation (ChromaDB)
    ↓
Vector Search (Similar Questions/Context)
    ↓
Prompt Construction (Few-shot examples)
    ↓
LLM Inference (Ollama → Llama 3)
    ↓
Output Parsing & Formatting
    ↓
Response Streaming (WebSocket)
    ↓
Cache & Store (Redis + PostgreSQL)
```

### Prompt Engineering

```python
# System Prompt
system_prompt = """You are an expert SSC CGL exam tutor with 10 years of experience.
Your role is to:
1. Explain concepts clearly in simple terms
2. Provide step-by-step solutions
3. Relate answers to exam context
4. Suggest similar practice problems
Always be encouraging and maintain student's confidence."""

# Few-Shot Example
few_shot_examples = [
    {
        "question": "What is the speed of light?",
        "answer": "The speed of light is approximately 3 × 10^8 m/s..."
    }
]

# User Query
user_message = "Explain how to solve: A man travels 50km at 40 km/h..."

# Final Prompt
final_prompt = f"""
{system_prompt}

Examples:
{format_examples(few_shot_examples)}

User: {user_message}
Assistant:"""
```

### RAG (Retrieval Augmented Generation)

```python
# 1. Index existing Q&A and resources
for question in all_questions:
    embedding = embedder.encode(question.text)
    vector_db.add(
        question_id=question.id,
        embedding=embedding,
        metadata={"category": question.category, "difficulty": question.difficulty}
    )

# 2. Retrieve relevant context
user_query = "Explain photosynthesis"
query_embedding = embedder.encode(user_query)
similar_items = vector_db.search(query_embedding, top_k=5)

# 3. Augment prompt with retrieval
context = "\n".join([item["text"] for item in similar_items])
augmented_prompt = f"""
Context from knowledge base:
{context}

User question: {user_query}
"""

# 4. Generate response
response = llm.generate(augmented_prompt)
```

### Fine-tuning Strategy

```python
# Phase 1: Supervised Fine-tuning (SFT)
# Collect high-quality Q&A pairs specific to SSC CGL

training_data = [
    {
        "instruction": "Solve this math problem",
        "input": "A man travels 50km at 40 km/h...",
        "output": "Solution: Step 1... Answer: 1.25 hours"
    }
]

# Phase 2: Preference Learning (RLHF)
# Use user feedback to improve responses

preference_data = [
    {
        "prompt": "Explain this problem",
        "chosen": "Better explanation with steps",
        "rejected": "Vague explanation"
    }
]

# Fine-tune on larger model (70B) before production
```

---

## Deployment Guide

### Frontend Deployment (Vercel)

```bash
# 1. Connect GitHub repository
# Go to https://vercel.com/new and connect your GitHub repo

# 2. Configure build settings
Build Command: npm run build
Output Directory: .next
Install Command: npm install

# 3. Set environment variables
NEXT_PUBLIC_API_URL=https://api.anvi-prep-ai.com
NEXT_PUBLIC_AI_API_URL=https://ai.anvi-prep-ai.com

# 4. Deploy
vercel deploy

# 5. Custom domain
# anvi-prep-ai.com → Vercel nameservers

# Continuous deployment: Automatic on push to main
```

### Backend Deployment (Render)

```bash
# 1. Connect GitHub repository
# Go to https://render.com and create new Web Service

# 2. Build & Start Commands
Build Command: pip install -r requirements.txt
Start Command: uvicorn app.main:app --host 0.0.0.0 --port $PORT

# 3. Environment variables
DATABASE_URL=postgresql://user:pass@host:5432/db
REDIS_URL=redis://user:pass@host:6379
SECRET_KEY=your-secret-key

# 4. Deploy
# Automatic on push to main branch

# 5. Custom domain
api.anvi-prep-ai.com → Render service URL
```

### Database Deployment (Supabase/RDS)

```bash
# Using Supabase (Managed PostgreSQL)
# 1. Create project on supabase.com
# 2. Get connection string
DATABASE_URL=postgresql://user:password@db.supabase.co:5432/postgres

# 3. Run migrations
alembic upgrade head

# Using AWS RDS
# 1. Create RDS PostgreSQL instance
# 2. Get endpoint
# 3. Create database and user
# 4. Update DATABASE_URL
# 5. Run migrations

# Backup strategy
# - Automated daily backups (30-day retention)
# - Manual backup before major changes
# - Test restore weekly
```

### AI Services Deployment

```bash
# Option 1: Deploy alongside backend
# Package in same container with FastAPI

# Option 2: Separate container on GPU instance
# AWS EC2 GPU instance (p3.2xlarge)
# Run Ollama + AI service FastAPI

# Environment
AI_SERVICE_URL=https://ai.anvi-prep-ai.com
OLLAMA_BASE_URL=http://localhost:11434 (local to container)
MODEL_NAME=llama3:70b (production model)
```

### Production Checklist

```yaml
Before deploying to production:

Frontend:
  ✓ All tests passing (npm run test)
  ✓ No TypeScript errors (npm run type-check)
  ✓ Build successful (npm run build)
  ✓ Lighthouse score > 80
  ✓ No console errors
  ✓ Environment variables set
  ✓ Sentry error tracking configured

Backend:
  ✓ All tests passing (pytest)
  ✓ No linting errors (black, flake8)
  ✓ Database migrations tested
  ✓ Load testing completed
  ✓ Security scan passed (bandit)
  ✓ API documentation updated
  ✓ Environment variables set
  ✓ Rate limiting configured
  ✓ Monitoring alerts configured

Infrastructure:
  ✓ SSL certificates valid
  ✓ Backups automated
  ✓ Monitoring alerts active
  ✓ Logging centralized
  ✓ CDN configured
  ✓ DNS records verified
  ✓ DDoS protection enabled

Deployment Process:
  1. Run full test suite
  2. Build Docker images
  3. Push to container registry
  4. Update production compose file
  5. Deploy to staging first
  6. Smoke test staging
  7. Deploy to production (blue-green)
  8. Verify all services
  9. Monitor error logs
  10. Rollback plan ready
```

---

## Monitoring & Observability

### Prometheus Metrics

```yaml
# Frontend Metrics
next_js_page_load_duration_seconds
next_js_api_request_duration_seconds
next_js_error_count
tanstack_query_cache_hits
tanstack_query_cache_misses

# Backend Metrics
fastapi_request_duration_seconds
fastapi_request_count
fastapi_error_count
database_query_duration_seconds
database_connection_pool_size
redis_operation_duration_seconds
redis_cache_hits
redis_cache_misses

# AI Service Metrics
ollama_inference_duration_seconds
embedding_generation_duration_seconds
vector_search_duration_seconds
model_inference_tokens_per_second
model_cache_hit_ratio

# Business Metrics
active_users_total
quiz_attempts_per_hour
average_quiz_score
ai_tutor_conversations_total
user_retention_rate
```

### Grafana Dashboards

```
Dashboards:
├─ Frontend Performance
│  ├─ Page load times
│  ├─ API response times
│  └─ Error rates
├─ Backend Performance
│  ├─ Request latency
│  ├─ Database performance
│  ├─ Redis cache hit ratio
│  └─ API error rates
├─ AI Service Performance
│  ├─ Model inference time
│  ├─ Embedding generation time
│  ├─ Vector search latency
│  └─ Model throughput
├─ Database Health
│  ├─ Connection pool
│  ├─ Query performance
│  ├─ Replication lag
│  └─ Backup status
└─ Business Metrics
   ├─ Active users
   ├─ Quiz attempts
   ├─ User retention
   ├─ Revenue (Phase 2)
   └─ Feature usage
```

### Logging Strategy

```python
# Structured Logging
import logging
from pythonjsonlogger import jsonlogger

logger = logging.getLogger(__name__)
handler = logging.StreamHandler()
formatter = jsonlogger.JsonFormatter()
handler.setFormatter(formatter)
logger.addHandler(handler)

# Usage
logger.info("User login", extra={
    "user_id": user.id,
    "ip_address": request.ip,
    "timestamp": datetime.utcnow().isoformat(),
    "event_type": "authentication",
    "status": "success"
})

# Log Levels
# DEBUG: Development details
# INFO: General application events
# WARNING: Potential issues
# ERROR: Error conditions
# CRITICAL: System failures

# Log Aggregation: Loki
# All logs shipped to Loki for centralized querying
# Query: {service="backend"} |= "error" | json
```

### Alerting Rules

```yaml
alerts:
  - name: HighErrorRate
    condition: rate(fastapi_error_count[5m]) > 0.05
    severity: critical
    action: notify_slack, page_on_call

  - name: HighLatency
    condition: histogram_quantile(0.95, fastapi_request_duration_seconds) > 1
    severity: warning
    action: notify_slack

  - name: DatabaseConnectionPoolExhausted
    condition: database_connection_pool_size == max_connections
    severity: critical
    action: page_on_call

  - name: RedisMemoryHigh
    condition: redis_memory_used / redis_memory_max > 0.9
    severity: warning
    action: notify_slack

  - name: DiskSpaceRunningOut
    condition: node_filesystem_avail_bytes / node_filesystem_size_bytes < 0.1
    severity: warning
    action: notify_slack
```

---

## CI/CD Pipeline

### GitHub Actions Workflow

```yaml
# .github/workflows/backend-ci.yml
name: Backend CI/CD

on:
  push:
    branches: [ main, develop ]
    paths:
      - 'apps/api/**'
  pull_request:
    branches: [ main, develop ]
    paths:
      - 'apps/api/**'

jobs:
  test:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:15
        env:
          POSTGRES_PASSWORD: postgres
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
      redis:
        image: redis:7
        options: >-
          --health-cmd "redis-cli ping"
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5

    steps:
      - uses: actions/checkout@v3
      
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'
          cache: 'pip'
      
      - name: Install dependencies
        run: |
          cd apps/api
          pip install -r requirements-dev.txt
      
      - name: Lint with flake8
        run: |
          cd apps/api
          flake8 app --count --select=E9,F63,F7,F82 --show-source --statistics
      
      - name: Format check with black
        run: |
          cd apps/api
          black --check app
      
      - name: Security check with bandit
        run: |
          cd apps/api
          bandit -r app -f json -o bandit-report.json
      
      - name: Run pytest
        env:
          DATABASE_URL: postgresql://postgres:postgres@localhost:5432/test_db
          REDIS_URL: redis://localhost:6379/0
        run: |
          cd apps/api
          pytest --cov=app --cov-report=xml
      
      - name: Upload coverage
        uses: codecov/codecov-action@v3
        with:
          files: ./apps/api/coverage.xml

  build:
    needs: test
    runs-on: ubuntu-latest
    if: github.event_name == 'push'
    
    steps:
      - uses: actions/checkout@v3
      
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2
      
      - name: Login to DockerHub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}
      
      - name: Build and push
        uses: docker/build-push-action@v4
        with:
          context: ./apps/api
          file: ./infrastructure/docker/Dockerfile.backend
          push: true
          tags: |
            yourusername/anvi-prep-ai-api:latest
            yourusername/anvi-prep-ai-api:${{ github.sha }}
          cache-from: type=registry,ref=yourusername/anvi-prep-ai-api:buildcache
          cache-to: type=registry,ref=yourusername/anvi-prep-ai-api:buildcache,mode=max

  deploy:
    needs: build
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    
    steps:
      - uses: actions/checkout@v3
      
      - name: Deploy to Render
        env:
          RENDER_API_KEY: ${{ secrets.RENDER_API_KEY }}
          RENDER_SERVICE_ID: ${{ secrets.RENDER_SERVICE_ID }}
        run: |
          curl -X POST https://api.render.com/deploy/srv/$RENDER_SERVICE_ID \
            -H "Authorization: Bearer $RENDER_API_KEY"
      
      - name: Smoke test
        run: |
          curl -f https://api.anvi-prep-ai.com/api/health/ || exit 1
```

### Frontend CI/CD

```yaml
# .github/workflows/frontend-ci.yml
name: Frontend CI/CD

on:
  push:
    branches: [ main, develop ]
    paths:
      - 'apps/web/**'
  pull_request:
    branches: [ main, develop ]
    paths:
      - 'apps/web/**'

jobs:
  test:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          cache: 'npm'
          cache-dependency-path: 'apps/web/package-lock.json'
      
      - name: Install dependencies
        run: |
          cd apps/web
          npm ci
      
      - name: Lint
        run: |
          cd apps/web
          npm run lint
      
      - name: Type check
        run: |
          cd apps/web
          npm run type-check
      
      - name: Run tests
        run: |
          cd apps/web
          npm run test -- --coverage
      
      - name: Build
        run: |
          cd apps/web
          npm run build

  e2e:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          cache: 'npm'
      
      - name: Install dependencies
        run: |
          cd apps/web
          npm ci
      
      - name: Install Playwright
        run: npx playwright install --with-deps
      
      - name: Run e2e tests
        run: |
          cd apps/web
          npm run test:e2e
      
      - name: Upload Playwright report
        if: always()
        uses: actions/upload-artifact@v3
        with:
          name: playwright-report
          path: apps/web/playwright-report/

  deploy:
    needs: [test, e2e]
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    
    steps:
      - uses: actions/checkout@v3
      
      - name: Deploy to Vercel
        uses: vercel/actions/deploy-production@main
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.VERCEL_ORG_ID }}
          vercel-project-id: ${{ secrets.VERCEL_PROJECT_ID }}
          working-directory: apps/web
```

---

## Security Best Practices

### Authentication & Authorization

```python
# JWT Token Implementation
from datetime import datetime, timedelta
from jose import JWTError, jwt
from passlib.context import CryptContext

# Password hashing
pwd_context = CryptContext(
    schemes=["bcrypt"],
    deprecated="auto"
)

def hash_password(password: str) -> str:
    return pwd_context.hash(password)

def verify_password(plain_password: str, hashed_password: str) -> bool:
    return pwd_context.verify(plain_password, hashed_password)

# JWT Token
def create_access_token(data: dict, expires_delta: timedelta = None):
    to_encode = data.copy()
    if expires_delta:
        expire = datetime.utcnow() + expires_delta
    else:
        expire = datetime.utcnow() + timedelta(hours=24)
    
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(
        to_encode,
        SECRET_KEY,
        algorithm=ALGORITHM
    )
    return encoded_jwt

# Verify token
def verify_token(token: str):
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        user_id: str = payload.get("sub")
        if user_id is None:
            raise JWTError()
        return user_id
    except JWTError:
        raise HTTPException(status_code=401, detail="Invalid token")
```

### Input Validation & Sanitization

```python
from pydantic import BaseModel, EmailStr, validator
from html import escape

class UserRegister(BaseModel):
    email: EmailStr  # Validates email format
    password: str
    full_name: str
    
    @validator('password')
    def password_strong(cls, v):
        if len(v) < 12:
            raise ValueError('Password must be at least 12 characters')
        if not any(char.isupper() for char in v):
            raise ValueError('Password must contain uppercase letter')
        if not any(char.isdigit() for char in v):
            raise ValueError('Password must contain digit')
        if not any(char in '!@#$%^&*' for char in v):
            raise ValueError('Password must contain special character')
        return v
    
    @validator('full_name')
    def sanitize_name(cls, v):
        # Remove potential XSS
        return escape(v.strip())[:100]  # Max 100 chars
```

### Rate Limiting

```python
from slowapi import Limiter
from slowapi.util import get_remote_address

limiter = Limiter(key_func=get_remote_address)

@app.post("/api/v1/auth/login")
@limiter.limit("5/minute")  # 5 attempts per minute
async def login(credentials: LoginSchema):
    # Login logic
    pass

@app.get("/api/v1/quiz")
@limiter.limit("100/minute")  # 100 requests per minute
async def get_quizzes():
    # Get quizzes logic
    pass
```

### CORS Configuration

```python
from fastapi.middleware.cors import CORSMiddleware

app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "https://anvi-prep-ai.com",
        "https://www.anvi-prep-ai.com"
    ],
    allow_credentials=True,
    allow_methods=["GET", "POST", "PUT", "DELETE"],
    allow_headers=["*"],
    max_age=3600,
)
```

### Database Security

```sql
-- Use parameterized queries (handled by SQLAlchemy)
-- Don't concatenate SQL strings!

-- Correct: SQLAlchemy ORM
user = session.query(User).filter(User.email == email).first()

-- Wrong: String concatenation (SQL Injection risk)
query = f"SELECT * FROM users WHERE email = '{email}'"
```

### Secrets Management

```bash
# Use environment variables, NOT hardcoded secrets
# Use .env files for local development only

# Production: Use cloud secret managers
# AWS Secrets Manager
# Render/Railway environment variables
# GitHub Secrets for CI/CD

# Never commit .env to git
echo ".env*" >> .gitignore
echo "secrets.yaml" >> .gitignore

# Access secrets securely
import os
SECRET_KEY = os.getenv("SECRET_KEY")
if not SECRET_KEY:
    raise ValueError("SECRET_KEY not found in environment")
```

### HTTPS & SSL/TLS

```nginx
# Nginx configuration for HTTPS
server {
    listen 443 ssl http2;
    server_name api.anvi-prep-ai.com;
    
    ssl_certificate /etc/letsencrypt/live/api.anvi-prep-ai.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/api.anvi-prep-ai.com/privkey.pem;
    
    # Strong SSL configuration
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;
    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 10m;
    
    # HSTS header
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    
    # Security headers
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;
    add_header Referrer-Policy "strict-origin-when-cross-origin" always;
    
    location / {
        proxy_pass http://backend:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

# Redirect HTTP to HTTPS
server {
    listen 80;
    server_name api.anvi-prep-ai.com;
    return 301 https://$server_name$request_uri;
}
```

---

## Scaling Strategy

### Horizontal Scaling

```yaml
# Load balancing configuration
Load Balancer (Nginx/ALB)
    ├─ Backend Instance 1 (8000)
    ├─ Backend Instance 2 (8000)
    ├─ Backend Instance 3 (8000)
    └─ Backend Instance N (8000)

# Auto-scaling rules
# Scale up: CPU > 70% for 5 minutes
# Scale down: CPU < 30% for 10 minutes
# Min instances: 2
# Max instances: 10
```

### Database Scaling

```sql
-- Read replicas for analytics queries
Primary (Write) PostgreSQL
    ├─ Replica 1 (Read) - Analytics
    ├─ Replica 2 (Read) - Reports
    └─ Replica 3 (Read) - Leaderboard

-- Sharding strategy for extreme scale
User ID % 10 -> Shard mapping
-- Shard 0: Users 0-999...
-- Shard 1: Users 1000-1999...
-- Etc.

-- Connection pooling
PgBouncer (50 connections → 500 connections)
```

### Caching Strategy

```
Request Flow:
    ↓
CDN (Vercel Edge) - Static assets
    ↓
Redis - Session, user, hot data
    ↓
Application Memory Cache
    ↓
Database
```

### Microservices Architecture (Phase 2+)

```
API Gateway
    ├─ Auth Service
    ├─ Quiz Service
    ├─ Analytics Service
    ├─ AI Service
    ├─ Payment Service (Phase 2)
    └─ Notification Service (Phase 2)

Each service:
- Separate database
- Independent scaling
- Message queue (RabbitMQ/Kafka)
- Service-to-service communication (gRPC)
```

### Kubernetes Deployment

```yaml
# Horizontal Pod Autoscaler
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: backend-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: backend
  minReplicas: 2
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70
  - type: Resource
    resource:
      name: memory
      target:
        type: Utilization
        averageUtilization: 80
```

---

## Contributing

### Git Workflow

```bash
# 1. Feature branch from develop
git checkout -b feature/user-authentication

# 2. Commit with conventional format
git commit -m "feat: add JWT-based authentication"

# Commit types:
# feat: New feature
# fix: Bug fix
# docs: Documentation
# style: Code style changes
# refactor: Code refactoring
# test: Adding tests
# chore: Build, dependencies, etc.

# 3. Push and create PR
git push origin feature/user-authentication

# 4. PR review and CI checks
# Wait for approval + tests passing

# 5. Merge to develop
# After develop tests pass, create PR to main

# 6. Deploy from main
# Automatic deployment to production
```

### Branching Strategy

```
main (production)
  ↑
  └─ PR from develop (weekly)

develop (staging)
  ↑
  ├─ feature/xxx (your work)
  ├─ feature/yyy
  ├─ bugfix/xxx
  └─ hotfix/critical-issue
```

### Code Review Checklist

- [ ] Code follows style guide
- [ ] Includes tests
- [ ] Documentation updated
- [ ] No secrets in code
- [ ] Performance considered
- [ ] Error handling implemented
- [ ] Accessibility checked
- [ ] Works on Chrome, Firefox, Safari

---

## Future Roadmap

### Phase 1 (MVP) - Current
- ✅ Quiz engine
- ✅ AI tutor
- ✅ Basic analytics
- ✅ Mock tests
- ✅ User authentication

### Phase 2 (Q2 2024)
- 🚀 Stripe payment integration
- 🚀 Premium subscription tier
- 🚀 Email notifications
- 🚀 Leaderboard system
- 🚀 Advanced analytics

### Phase 3 (Q3 2024)
- 🚀 Mobile app (React Native)
- 🚀 Image-based question solver (OCR)
- 🚀 Adaptive learning algorithm
- 🚀 Offline mode
- 🚀 Push notifications

### Phase 4 (Q4 2024)
- 🚀 Multi-exam support (Banking, UPSC, CAT)
- 🚀 Live instructor sessions
- 🚀 Social features (study groups)
- 🚀 AI-generated practice papers
- 🚀 Voice-based problem solving

### Phase 5 (2025)
- 🚀 Kubernetes deployment
- 🚀 Multi-language support
- 🚀 Advanced AI fine-tuning
- 🚀 B2B institutional plans
- 🚀 Integration with educational platforms

---

## Support & Feedback

Need help? 
- Check [docs](./docs)
- Open an [issue](https://github.com/yourusername/anvi-prep-ai/issues)
- Email: support@anvi-prep-ai.com

Feedback?
- Report at: https://github.com/yourusername/anvi-prep-ai/discussions

---

## License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.

---

**Anvi Prep AI** - Empowering students with AI-driven competitive exam preparation.

*Built with ❤️ for future champions*

---

### Quick Reference Commands

```bash
# Development
npm run dev              # Start frontend
python -m uvicorn ...   # Start backend
docker-compose up       # All services

# Testing
npm run test            # Frontend tests
pytest                  # Backend tests
npm run test:e2e        # E2E tests

# Linting & Formatting
npm run lint            # Frontend lint
black app               # Format backend
npm run format          # Format frontend

# Database
alembic upgrade head    # Run migrations
alembic revision -m "description"  # Create migration

# Deployment
docker-compose -f docker-compose.prod.yml up -d
vercel deploy
```
