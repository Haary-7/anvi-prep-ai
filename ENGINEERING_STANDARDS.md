# Engineering Standards & Best Practices - Anvi Prep AI

> Production-Grade Engineering Guidelines for a Startup-Scale AI Platform

---

## Table of Contents

1. [Naming Conventions](#naming-conventions)
2. [Project Structure Standards](#project-structure-standards)
3. [Code Quality Standards](#code-quality-standards)
4. [API Design Standards](#api-design-standards)
5. [Database Standards](#database-standards)
6. [Error Handling Strategy](#error-handling-strategy)
7. [Logging Strategy](#logging-strategy)
8. [Testing Strategy](#testing-strategy)
9. [Git & Version Control](#git--version-control)
10. [Documentation Standards](#documentation-standards)
11. [Performance Standards](#performance-standards)
12. [Security Standards](#security-standards)

---

## Naming Conventions

### General Rules

**Golden Rule:** Use clear, descriptive names that require minimal explanation.

```
Good: user_quiz_attempt_count
Bad: uqac, attempts

Good: is_premium_user
Bad: prem, premium_flag

Good: calculate_average_score
Bad: calc_score, avg_calc
```

### TypeScript/Frontend Naming

#### Files & Directories

```
Directory naming: kebab-case
├── components/
│   ├── quiz-engine/
│   ├── analytics-dashboard/
│   └── ai-tutor-chat/

File naming:
├── components/
│   ├── QuizCard.tsx              # React components: PascalCase
│   ├── useFetchQuizzes.ts        # Custom hooks: camelCase with 'use' prefix
│   └── quiz-utils.ts            # Utilities: kebab-case
├── lib/
│   ├── api-client.ts            # Library files: kebab-case
│   └── format-helpers.ts
├── types/
│   ├── api.ts                   # Type definition files: descriptive
│   └── user.ts
```

#### Variables & Functions

```typescript
// Constants: UPPER_SNAKE_CASE
const MAX_RETRY_ATTEMPTS = 3;
const DEFAULT_QUIZ_DURATION = 30;
const API_ENDPOINT = 'https://api.example.com';

// Variables: camelCase
let quizAttempts = 0;
let isLoadingQuiz = false;
const userPreferences = {};

// Functions: camelCase, descriptive verbs
function calculateQuizScore(answers: Answer[]): number { }
async function fetchUserAnalytics(userId: string): Promise<Analytics> { }
function isValidEmail(email: string): boolean { }

// React Components: PascalCase
function QuizCard(props: QuizCardProps) { }
function AnalyticsDashboard() { }

// Event handlers: 'handle' prefix
function handleQuizSubmit() { }
function handleTimeExpired() { }

// Boolean variables: 'is' or 'has' prefix
const isAuthenticated = true;
const hasPermission = false;
const shouldShowNotification = true;
```

### Python/Backend Naming

#### Modules & Packages

```python
# Directories: lowercase with underscores
services/
├── auth_service.py
├── quiz_service.py
├── analytics_service.py
└── ai_service.py

# Modules: lowercase_with_underscores
utils/
├── jwt_handler.py
├── password_validator.py
├── email_formatter.py
```

#### Classes, Functions, Variables

```python
# Classes: PascalCase
class UserAuthenticationService:
    pass

class QuizAttemptAnalyzer:
    pass

# Functions & Methods: lowercase_with_underscores
def calculate_quiz_score(answers: List[Answer]) -> float:
    pass

async def fetch_user_analytics(user_id: str) -> UserAnalytics:
    pass

# Constants: UPPER_SNAKE_CASE
MAX_QUIZ_DURATION = 300
DEFAULT_RETRY_ATTEMPTS = 3
CACHE_EXPIRATION_MINUTES = 60

# Variables: lowercase_with_underscores
user_id = uuid.uuid4()
quiz_score = 85.5
is_authenticated = True

# Private methods/variables: _leading_underscore
def _validate_quiz_data(data: dict) -> bool:
    pass

_internal_cache = {}

# Protected methods: _single_leading_underscore
def _prepare_response(data: dict) -> dict:
    pass
```

#### Database & Models

```python
# Table names: lowercase_plural
users
quizzes
user_quiz_attempts
performance_analytics

# Column names: lowercase_with_underscores
user_id
full_name
created_at
is_active
updated_at
password_hash

# Indexes: idx_<table>_<column>
idx_users_email
idx_user_quiz_attempts_user_id
idx_quizzes_exam_type

# Foreign keys: fk_<table>_<column>
fk_user_quiz_attempts_user_id
fk_questions_quiz_id
```

### API Endpoint Naming

```
Naming style: lowercase, kebab-case, RESTful

Good endpoints:
GET    /api/v1/users/{user_id}
GET    /api/v1/quizzes
POST   /api/v1/quizzes/{quiz_id}/attempts
GET    /api/v1/quizzes/{quiz_id}/attempts/{attempt_id}/results
POST   /api/v1/ai-tutor/chat
POST   /api/v1/image-solver/solve
GET    /api/v1/analytics/strength-areas
GET    /api/v1/leaderboard/rankings

Bad endpoints:
GET    /api/GetUserQuizzes              # PascalCase
POST   /api/submit_quiz_attempt         # Inconsistent style
GET    /api/v1/user_profile             # snake_case
POST   /api/v1/AI_Tutor_Chat            # Mixed case

Versioning:
/api/v1/...    # Current version
/api/v2/...    # Future version (non-breaking parallel deployment)
```

---

## Project Structure Standards

### Monorepo Organization

```
anvi-prep-ai/                    # Root: Monorepo management
├── apps/                        # Application-level code
│   ├── web/                     # Frontend Next.js app
│   └── api/                     # Backend FastAPI app
├── services/                    # Microservices
│   └── ai_engine/              # AI service (separate)
├── infrastructure/              # DevOps & IaC
│   ├── docker/
│   ├── kubernetes/
│   ├── terraform/
│   └── scripts/
├── monitoring/                  # Observability stack
│   ├── prometheus/
│   ├── grafana/
│   └── loki/
├── docs/                        # Documentation
├── scripts/                     # Root-level automation
└── package.json                # Root monorepo config
```

### Frontend Structure

```
apps/web/
├── public/                      # Static assets
│   ├── images/
│   ├── fonts/
│   └── favicons/
├── src/
│   ├── app/                     # Next.js App Router
│   │   ├── (auth)/             # Route group
│   │   ├── (dashboard)/        # Protected routes
│   │   ├── layout.tsx
│   │   ├── page.tsx
│   │   └── globals.css
│   ├── components/             # Reusable UI components
│   │   ├── ui/                # shadcn/ui components
│   │   ├── layout/            # Layout components
│   │   ├── quiz/              # Feature-specific
│   │   └── common/            # Shared components
│   ├── hooks/                  # Custom React hooks
│   ├── lib/                    # Utilities & helpers
│   │   ├── api-client.ts      # API wrapper
│   │   ├── auth-service.ts
│   │   ├── validators.ts
│   │   └── utils.ts
│   ├── types/                  # TypeScript types
│   ├── store/                  # State management (TanStack Query)
│   │   ├── queryClient.ts
│   │   ├── queries/
│   │   └── mutations/
│   ├── context/                # React Context
│   ├── config/                 # Configuration
│   └── middleware/             # Next.js middleware
├── __tests__/                  # Test files
│   ├── unit/
│   ├── integration/
│   └── e2e/
├── .env.example
├── next.config.js
├── tsconfig.json
└── package.json
```

### Backend Structure

```
apps/api/
├── app/                        # Main application
│   ├── api/                    # API routes
│   │   ├── v1/                # API version 1
│   │   │   ├── endpoints/     # Route handlers
│   │   │   ├── router.py      # Route aggregator
│   │   │   └── dependencies.py
│   │   └── v2/                # Future version (if needed)
│   ├── services/              # Business logic
│   ├── models/                # SQLAlchemy ORM
│   ├── schemas/               # Pydantic validation
│   ├── utils/                 # Helper functions
│   ├── middleware/            # FastAPI middleware
│   ├── db/                    # Database connection
│   ├── ai/                    # AI/LLM integrations
│   ├── config.py
│   └── main.py                # Entry point
├── migrations/                # Alembic database migrations
├── tests/                     # Test files
│   ├── unit/
│   ├── integration/
│   └── e2e/
├── scripts/                   # Utility scripts
├── .env.example
├── requirements.txt
├── requirements-dev.txt
├── Dockerfile
├── pytest.ini
└── pyproject.toml
```

---

## Code Quality Standards

### TypeScript Best Practices

#### Type Safety

```typescript
// ✅ GOOD: Explicit types
interface QuizAttempt {
  attemptId: string;
  quizId: string;
  score: number;
  timestamp: Date;
}

function submitQuiz(attempt: QuizAttempt): Promise<Result> {
  // Implementation
}

// ❌ BAD: Using 'any'
function submitQuiz(attempt: any): any {
  // Loses type safety
}

// ✅ GOOD: Union types for specific cases
type AuthStatus = 'authenticated' | 'unauthenticated' | 'loading';

const status: AuthStatus = 'authenticated';

// ✅ GOOD: Enums for constants
enum ExamType {
  SSC_CGL = 'ssc_cgl',
  BANKING = 'banking',
  UPSC = 'upsc'
}

// ❌ BAD: String literals everywhere
const examType = 'ssc_cgl'; // Typo-prone
```

#### Component Structure

```typescript
// ✅ GOOD: Clear component structure
interface QuizCardProps {
  quiz: Quiz;
  onSelect: (quizId: string) => void;
  isLoading?: boolean;
}

export function QuizCard({ quiz, onSelect, isLoading }: QuizCardProps) {
  return (
    <div>
      {/* Component JSX */}
    </div>
  );
}

export default QuizCard;

// ❌ BAD: Prop drilling without interface
export function QuizCard(props: any) {
  return <div>{props.quiz}</div>;
}
```

### Python Best Practices

#### Type Hints & Documentation

```python
# ✅ GOOD: Full type hints and docstring
def calculate_quiz_score(
    answers: List[UserAnswer],
    quiz: Quiz
) -> QuizResult:
    """
    Calculate the total score for a quiz attempt.
    
    Args:
        answers: List of user answers
        quiz: The quiz object
        
    Returns:
        QuizResult containing score and analysis
        
    Raises:
        ValueError: If answers don't match quiz questions
    """
    # Implementation
    pass

# ❌ BAD: No type hints
def calculate_score(answers, quiz):
    # No indication of types or return value
    return score

# ✅ GOOD: Use Optional for nullable types
def get_user_by_email(email: str) -> Optional[User]:
    return db.query(User).filter(User.email == email).first()

# ❌ BAD: Unclear if None is possible
def get_user_by_email(email: str) -> User:
    return db.query(User).filter(User.email == email).first()
```

#### Error Handling

```python
# ✅ GOOD: Specific exceptions
try:
    user = get_user_by_id(user_id)
except UserNotFoundError:
    logger.warning(f"User {user_id} not found")
    raise HTTPException(status_code=404, detail="User not found")
except DatabaseError:
    logger.error("Database connection failed")
    raise HTTPException(status_code=500, detail="Internal server error")

# ❌ BAD: Catching everything
try:
    user = get_user_by_id(user_id)
except:
    pass  # Hides errors
except Exception as e:
    pass  # Too broad
```

#### Class Organization

```python
# ✅ GOOD: Clear class structure
class QuizService:
    """Service for quiz operations."""
    
    def __init__(self, db_session: Session, cache: Redis):
        self.db = db_session
        self.cache = cache
    
    # Public methods
    def get_quiz(self, quiz_id: str) -> Quiz:
        """Get quiz by ID."""
        cached = self.cache.get(f"quiz:{quiz_id}")
        if cached:
            return Quiz.from_json(cached)
        
        quiz = self._fetch_from_db(quiz_id)
        self._cache_quiz(quiz)
        return quiz
    
    def submit_attempt(self, attempt: UserAttempt) -> QuizResult:
        """Submit quiz attempt and calculate score."""
        self._validate_attempt(attempt)
        result = self._calculate_score(attempt)
        self._store_result(result)
        return result
    
    # Private methods
    def _fetch_from_db(self, quiz_id: str) -> Quiz:
        return self.db.query(Quiz).get(quiz_id)
    
    def _cache_quiz(self, quiz: Quiz) -> None:
        self.cache.setex(f"quiz:{quiz.id}", 3600, quiz.to_json())
    
    def _validate_attempt(self, attempt: UserAttempt) -> None:
        if not attempt.answers:
            raise ValueError("No answers provided")
```

### Linting & Formatting

#### Frontend (JavaScript/TypeScript)

```json
// .eslintrc.json
{
  "extends": [
    "next/core-web-vitals",
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended"
  ],
  "rules": {
    "no-console": ["warn", { "allow": ["warn", "error"] }],
    "no-var": "error",
    "prefer-const": "error",
    "@typescript-eslint/no-explicit-any": "error",
    "react/react-in-jsx-scope": "off"
  }
}
```

```javascript
// prettier.config.js
module.exports = {
  semi: true,
  singleQuote: true,
  tabWidth: 2,
  trailingComma: 'es5',
  arrowParens: 'always',
  printWidth: 100,
};
```

```bash
# Commands
npm run lint          # Run linter
npm run lint:fix     # Fix auto-fixable issues
npm run format       # Format code
```

#### Backend (Python)

```ini
; pyproject.toml (or setup.cfg)
[tool:pytest]
testpaths = tests
python_files = test_*.py
addopts = --strict-markers

[tool.black]
line-length = 100
target-version = ['py311']
include = '\.pyi?$'
exclude = '''
/(
    \.git
  | \.venv
  | migrations
)/
'''

[tool.isort]
profile = "black"
multi_line_mode = 3
include_trailing_comma = true
line_length = 100

[tool.flake8]
max-line-length = 100
extend-ignore = E203, W503
exclude = .git,.venv,migrations
```

```bash
# Commands
black app/                    # Format code
isort app/                    # Sort imports
flake8 app/                   # Lint
mypy app/                     # Type check
bandit -r app/               # Security scan
pylint app/                   # Additional linting
```

---

## API Design Standards

### RESTful Design

```
Resource-based endpoints:
GET    /api/v1/quizzes                    # List quizzes
GET    /api/v1/quizzes/{id}              # Get single quiz
POST   /api/v1/quizzes                    # Create quiz
PUT    /api/v1/quizzes/{id}              # Update quiz
DELETE /api/v1/quizzes/{id}              # Delete quiz

Sub-resources:
GET    /api/v1/quizzes/{id}/questions    # Quiz questions
GET    /api/v1/quizzes/{id}/attempts     # Quiz attempts
POST   /api/v1/quizzes/{id}/attempts     # Create attempt
```

### Request/Response Format

```typescript
// ✅ Standard Request
POST /api/v1/quizzes/{quiz_id}/submit
Content-Type: application/json
Authorization: Bearer <token>

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

// ✅ Standard Success Response (200/201)
{
  "success": true,
  "data": {
    "attempt_id": "uuid",
    "score": 75,
    "percentage": 75.0,
    "accuracy": 0.75,
    "timestamp": "2024-01-15T10:30:00Z"
  },
  "meta": {
    "request_id": "req_abc123",
    "timestamp": "2024-01-15T10:30:00Z"
  }
}

// ✅ Error Response (4xx/5xx)
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid input provided",
    "details": [
      {
        "field": "answers",
        "message": "Must be non-empty array"
      }
    ]
  },
  "meta": {
    "request_id": "req_def456",
    "timestamp": "2024-01-15T10:30:00Z"
  }
}

// ✅ Paginated Response
{
  "success": true,
  "data": [
    { "quiz_id": "1", "title": "Quiz 1" }
  ],
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 150,
    "pages": 8
  },
  "meta": {
    "request_id": "req_ghi789",
    "timestamp": "2024-01-15T10:30:00Z"
  }
}
```

### Error Response Standards

```python
# Define custom exceptions
class APIException(Exception):
    def __init__(
        self,
        code: str,
        message: str,
        status_code: int,
        details: Optional[List[dict]] = None
    ):
        self.code = code
        self.message = message
        self.status_code = status_code
        self.details = details or []

class ValidationError(APIException):
    def __init__(self, message: str, details: List[dict]):
        super().__init__(
            code="VALIDATION_ERROR",
            message=message,
            status_code=400,
            details=details
        )

class UserNotFoundError(APIException):
    def __init__(self, user_id: str):
        super().__init__(
            code="USER_NOT_FOUND",
            message=f"User {user_id} not found",
            status_code=404
        )

class RateLimitError(APIException):
    def __init__(self):
        super().__init__(
            code="RATE_LIMIT_EXCEEDED",
            message="Too many requests. Please try again later.",
            status_code=429
        )

# Exception handler
@app.exception_handler(APIException)
async def api_exception_handler(request: Request, exc: APIException):
    return JSONResponse(
        status_code=exc.status_code,
        content={
            "success": False,
            "error": {
                "code": exc.code,
                "message": exc.message,
                "details": exc.details
            },
            "meta": {
                "request_id": request.headers.get("x-request-id"),
                "timestamp": datetime.utcnow().isoformat()
            }
        }
    )
```

---

## Database Standards

### SQL Style Guide

```sql
-- ✅ Keywords uppercase
SELECT user_id, full_name
FROM users
WHERE created_at > CURRENT_TIMESTAMP - INTERVAL '30 days'
ORDER BY created_at DESC;

-- ❌ Keywords lowercase
select user_id, full_name
from users
where created_at > current_timestamp - interval '30 days'
order by created_at desc;

-- ✅ Proper indentation and formatting
SELECT 
    u.user_id,
    u.full_name,
    COUNT(qa.attempt_id) as total_attempts,
    AVG(qa.accuracy) as avg_accuracy
FROM users u
LEFT JOIN user_quiz_attempts qa ON u.user_id = qa.user_id
WHERE u.is_active = true
    AND qa.created_at > CURRENT_TIMESTAMP - INTERVAL '90 days'
GROUP BY u.user_id, u.full_name
HAVING COUNT(qa.attempt_id) > 0
ORDER BY avg_accuracy DESC;

-- ✅ Use aliases
SELECT 
    u.user_id,
    u.full_name
FROM users u
WHERE u.created_at > CURRENT_TIMESTAMP - INTERVAL '30 days';

-- ✅ Always use JOIN explicitly
SELECT *
FROM users u
INNER JOIN user_quiz_attempts qa ON u.user_id = qa.user_id;

-- ❌ Don't use implicit joins
SELECT * FROM users u, user_quiz_attempts qa WHERE u.user_id = qa.user_id;
```

### SQLAlchemy ORM Standards

```python
# ✅ Model definition with proper constraints
class User(Base):
    __tablename__ = "users"
    
    # Primary key
    user_id: Mapped[UUID] = mapped_column(primary_key=True, default=uuid4)
    
    # Columns with constraints
    email: Mapped[str] = mapped_column(String(255), unique=True, nullable=False, index=True)
    password_hash: Mapped[str] = mapped_column(String(255), nullable=False)
    full_name: Mapped[str] = mapped_column(String(255), nullable=False)
    
    # Optional columns
    profile_picture_url: Mapped[Optional[str]] = mapped_column(Text, nullable=True)
    
    # Boolean columns with default
    is_active: Mapped[bool] = mapped_column(default=True)
    
    # Timestamps
    created_at: Mapped[datetime] = mapped_column(DateTime, default=datetime.utcnow)
    updated_at: Mapped[datetime] = mapped_column(
        DateTime,
        default=datetime.utcnow,
        onupdate=datetime.utcnow
    )
    
    # Relationships
    quiz_attempts: Mapped[List["UserQuizAttempt"]] = relationship(
        back_populates="user",
        cascade="all, delete-orphan"
    )
    
    # Methods
    def is_premium(self) -> bool:
        return self.subscription_tier == "premium"

# ✅ Query patterns
def get_active_users_last_30_days(session: Session) -> List[User]:
    """Get users active in last 30 days."""
    thirty_days_ago = datetime.utcnow() - timedelta(days=30)
    return (
        session.query(User)
        .filter(
            User.is_active == true(),
            User.updated_at > thirty_days_ago
        )
        .order_by(User.created_at.desc())
        .all()
    )

# ✅ Async operations
async def get_user_by_id(session: AsyncSession, user_id: UUID) -> Optional[User]:
    result = await session.execute(
        select(User).filter(User.user_id == user_id)
    )
    return result.scalar_one_or_none()
```

### Migration Standards

```python
# Alembic migration example
"""Add AI tutor conversation table"""
from alembic import op
import sqlalchemy as sa
from datetime import datetime

# revision identifiers
revision = '002_add_ai_conversations'
down_revision = '001_initial_schema'
branch_labels = None
depends_on = None

def upgrade() -> None:
    """Create ai_conversations table."""
    op.create_table(
        'ai_conversations',
        sa.Column('conversation_id', sa.UUID(), nullable=False),
        sa.Column('user_id', sa.UUID(), nullable=False),
        sa.Column('session_id', sa.UUID(), nullable=True),
        sa.Column('message_text', sa.Text(), nullable=False),
        sa.Column('response_text', sa.Text(), nullable=False),
        sa.Column('helpful', sa.Boolean(), nullable=True),
        sa.Column('created_at', sa.DateTime(), default=datetime.utcnow),
        sa.Column('updated_at', sa.DateTime(), default=datetime.utcnow),
        sa.ForeignKeyConstraint(['user_id'], ['users.user_id']),
        sa.PrimaryKeyConstraint('conversation_id'),
        sa.Index('ix_ai_conversations_user_id', 'user_id'),
        sa.Index('ix_ai_conversations_created_at', 'created_at')
    )

def downgrade() -> None:
    """Drop ai_conversations table."""
    op.drop_table('ai_conversations')
```

---

## Error Handling Strategy

### Frontend Error Handling

```typescript
// ✅ Structured error handling
interface APIError {
  code: string;
  message: string;
  status: number;
  details?: Record<string, string>;
}

class APIErrorHandler {
  static handle(error: unknown): APIError {
    if (error instanceof AxiosError) {
      return {
        code: error.response?.data?.error?.code || 'UNKNOWN_ERROR',
        message: error.response?.data?.error?.message || error.message,
        status: error.response?.status || 500,
        details: error.response?.data?.error?.details
      };
    }
    
    return {
      code: 'CLIENT_ERROR',
      message: 'An unexpected error occurred',
      status: 0
    };
  }
  
  static isRetryable(error: APIError): boolean {
    return [408, 429, 500, 502, 503, 504].includes(error.status);
  }
}

// ✅ Error boundary
export class ErrorBoundary extends React.Component<Props, State> {
  componentDidCatch(error: Error, errorInfo: React.ErrorInfo) {
    logger.error('React error boundary caught:', {
      error: error.toString(),
      componentStack: errorInfo.componentStack
    });
    
    this.setState({ hasError: true });
  }
  
  render() {
    if (this.state.hasError) {
      return (
        <ErrorFallback
          error={this.state.error}
          retry={() => this.setState({ hasError: false })}
        />
      );
    }
    
    return this.props.children;
  }
}

// ✅ Hook for error handling
function useApiCall<T>(
  apiFunction: () => Promise<T>
): { data: T | null; error: APIError | null; loading: boolean } {
  const [state, setState] = useState({
    data: null,
    error: null,
    loading: true
  });
  
  useEffect(() => {
    apiFunction()
      .then(data => setState({ data, error: null, loading: false }))
      .catch(error => {
        const apiError = APIErrorHandler.handle(error);
        setState({ data: null, error: apiError, loading: false });
        
        // Retry logic
        if (APIErrorHandler.isRetryable(apiError)) {
          setTimeout(() => apiFunction(), 1000);
        }
      });
  }, []);
  
  return state;
}
```

### Backend Error Handling

```python
# ✅ Custom exception hierarchy
class AnviException(Exception):
    """Base exception for Anvi Prep AI."""
    code = "INTERNAL_ERROR"
    status_code = 500
    
    def __init__(self, message: str, details: Optional[dict] = None):
        self.message = message
        self.details = details or {}
        super().__init__(message)

class ValidationError(AnviException):
    code = "VALIDATION_ERROR"
    status_code = 400

class AuthenticationError(AnviException):
    code = "AUTHENTICATION_ERROR"
    status_code = 401

class PermissionError(AnviException):
    code = "PERMISSION_DENIED"
    status_code = 403

class NotFoundError(AnviException):
    code = "NOT_FOUND"
    status_code = 404

class RateLimitError(AnviException):
    code = "RATE_LIMIT_EXCEEDED"
    status_code = 429

# ✅ Global exception handler
@app.exception_handler(AnviException)
async def anvi_exception_handler(request: Request, exc: AnviException):
    return JSONResponse(
        status_code=exc.status_code,
        content={
            "success": False,
            "error": {
                "code": exc.code,
                "message": exc.message,
                "details": exc.details
            },
            "meta": {
                "request_id": request.state.request_id,
                "timestamp": datetime.utcnow().isoformat()
            }
        }
    )

# ✅ Middleware for unhandled exceptions
@app.middleware("http")
async def error_handling_middleware(request: Request, call_next):
    try:
        response = await call_next(request)
        return response
    except Exception as e:
        logger.error(f"Unhandled exception: {str(e)}", exc_info=True)
        return JSONResponse(
            status_code=500,
            content={
                "success": False,
                "error": {
                    "code": "INTERNAL_SERVER_ERROR",
                    "message": "An unexpected error occurred"
                }
            }
        )

# ✅ Usage in endpoints
@router.post("/api/v1/quizzes/{quiz_id}/submit")
async def submit_quiz(
    quiz_id: str,
    attempt_data: SubmitAttemptSchema,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
) -> SubmitAttemptResponse:
    try:
        quiz = db.query(Quiz).get(quiz_id)
        if not quiz:
            raise NotFoundError(f"Quiz {quiz_id} not found")
        
        result = quiz_service.submit_attempt(attempt_data, current_user)
        return result
    
    except ValidationError as e:
        logger.warning(f"Validation error: {e.message}")
        raise
    except Exception as e:
        logger.error(f"Unexpected error submitting quiz: {str(e)}", exc_info=True)
        raise AnviException("Failed to submit quiz")
```

---

## Logging Strategy

### Logging Format

```python
# ✅ Structured JSON logging
import json
import logging
from pythonjsonlogger import jsonlogger

# Configure JSON logger
logHandler = logging.StreamHandler()
formatter = jsonlogger.JsonFormatter(
    '%(timestamp)s %(level)s %(name)s %(message)s'
)
logHandler.setFormatter(formatter)
logger = logging.getLogger()
logger.addHandler(logHandler)
logger.setLevel(logging.INFO)

# ✅ Usage examples
def authenticate_user(email: str, password: str) -> User:
    logger.info(
        "User authentication attempt",
        extra={
            "timestamp": datetime.utcnow().isoformat(),
            "event_type": "authentication",
            "email": email,
            "ip_address": request.remote_addr
        }
    )
    
    user = find_user_by_email(email)
    if not user:
        logger.warning(
            "Authentication failed - user not found",
            extra={
                "email": email,
                "status": "user_not_found"
            }
        )
        raise AuthenticationError("Invalid credentials")
    
    if not verify_password(password, user.password_hash):
        logger.warning(
            "Authentication failed - invalid password",
            extra={
                "user_id": user.user_id,
                "status": "invalid_password"
            }
        )
        raise AuthenticationError("Invalid credentials")
    
    logger.info(
        "User authenticated successfully",
        extra={
            "user_id": user.user_id,
            "email": email,
            "status": "success"
        }
    )
    
    return user
```

### Log Levels

```
DEBUG:   Development information, detailed flow
INFO:    General application flow, important business events
WARNING: Potential issues, degraded functionality
ERROR:   Error conditions but system continues
CRITICAL: System failures, requires immediate action
```

### Log Aggregation

```yaml
# Send logs to Loki
# All services configured to send logs to centralized system
# Query format: {service="backend"} |= "error"

# Log fields to include
timestamp: ISO 8601 format
level: DEBUG, INFO, WARNING, ERROR, CRITICAL
service: backend, web, ai
module: auth, quiz, analytics
user_id: For tracking user-specific flows
request_id: For tracing requests
event_type: authentication, quiz_attempt, error
status: success, failure, pending
duration_ms: Processing time
```

---

## Testing Strategy

### Frontend Testing

```typescript
// ✅ Unit test example
import { render, screen } from '@testing-library/react';
import { QuizCard } from '@/components/quiz/QuizCard';

describe('QuizCard', () => {
  const mockQuiz = {
    quiz_id: 'uuid-1',
    title: 'Test Quiz',
    category: 'general_awareness',
    difficulty: 'medium',
    total_questions: 20,
    duration_minutes: 30
  };
  
  it('should render quiz title', () => {
    render(<QuizCard quiz={mockQuiz} onSelect={jest.fn()} />);
    expect(screen.getByText('Test Quiz')).toBeInTheDocument();
  });
  
  it('should call onSelect when clicked', () => {
    const onSelect = jest.fn();
    render(<QuizCard quiz={mockQuiz} onSelect={onSelect} />);
    screen.getByRole('button').click();
    expect(onSelect).toHaveBeenCalledWith('uuid-1');
  });
  
  it('should show loading state', () => {
    render(
      <QuizCard quiz={mockQuiz} onSelect={jest.fn()} isLoading={true} />
    );
    expect(screen.getByTestId('loading-spinner')).toBeInTheDocument();
  });
});

// ✅ Integration test example
import { setupServer } from 'msw/node';
import { rest } from 'msw';

const server = setupServer(
  rest.get('/api/v1/quizzes/:id', (req, res, ctx) => {
    return res(
      ctx.json({
        success: true,
        data: mockQuiz
      })
    );
  })
);

describe('Quiz page integration', () => {
  beforeAll(() => server.listen());
  afterEach(() => server.resetHandlers());
  afterAll(() => server.close());
  
  it('should fetch and display quiz', async () => {
    render(<QuizPage quizId="uuid-1" />);
    
    await waitFor(() => {
      expect(screen.getByText('Test Quiz')).toBeInTheDocument();
    });
  });
});

// ✅ E2E test example
import { test, expect } from '@playwright/test';

test.describe('Quiz workflow', () => {
  test('should complete quiz and see results', async ({ page }) => {
    // Navigate to quiz
    await page.goto('/dashboard/quiz/uuid-1/take');
    
    // Answer questions
    for (let i = 0; i < 5; i++) {
      await page.click(`[data-option="${i}"]`);
      await page.click('button:has-text("Next")');
    }
    
    // Submit quiz
    await page.click('button:has-text("Submit")');
    
    // Verify results page
    await expect(page).toHaveURL(/\/results/);
    await expect(page.locator('text=Your Score')).toBeVisible();
  });
});
```

### Backend Testing

```python
# ✅ Unit test example
import pytest
from unittest.mock import Mock, patch
from app.services.quiz_service import QuizService

@pytest.fixture
def quiz_service():
    mock_db = Mock()
    mock_cache = Mock()
    return QuizService(mock_db, mock_cache)

def test_calculate_quiz_score(quiz_service):
    """Test quiz score calculation."""
    answers = [
        UserAnswer(question_id='q1', is_correct=True),
        UserAnswer(question_id='q2', is_correct=False),
        UserAnswer(question_id='q3', is_correct=True),
    ]
    
    score = quiz_service.calculate_score(answers, total_questions=3)
    
    assert score == 66.67
    assert score > 0

# ✅ Integration test example
@pytest.mark.asyncio
async def test_submit_quiz_attempt(db_session, test_user, test_quiz):
    """Test quiz submission workflow."""
    # Create quiz attempt
    attempt = await QuizService.submit_attempt(
        db_session,
        quiz_id=test_quiz.id,
        user_id=test_user.id,
        answers=test_answers
    )
    
    # Verify attempt saved
    saved_attempt = db_session.query(UserQuizAttempt).get(attempt.id)
    assert saved_attempt is not None
    assert saved_attempt.score == 75.0
    
    # Verify analytics updated
    analytics = db_session.query(PerformanceAnalytics).filter(
        PerformanceAnalytics.user_id == test_user.id,
        PerformanceAnalytics.category == test_quiz.category
    ).first()
    assert analytics is not None

# ✅ API endpoint test example
@pytest.mark.asyncio
async def test_submit_quiz_api(client: AsyncClient, auth_token: str, test_quiz):
    """Test quiz submission API."""
    response = await client.post(
        f"/api/v1/quizzes/{test_quiz.id}/submit",
        json={
            "answers": [
                {"question_id": "q1", "selected_option": 0},
                {"question_id": "q2", "selected_option": 1},
            ],
            "total_time_seconds": 600
        },
        headers={"Authorization": f"Bearer {auth_token}"}
    )
    
    assert response.status_code == 200
    data = response.json()
    assert data["success"] is True
    assert "score" in data["data"]

# Test coverage targets
# Unit tests: 80%+ coverage
# Integration tests: 70%+ coverage
# E2E tests: Critical user flows
```

### Test Organization

```
__tests__/ or tests/
├── unit/                    # Isolated unit tests
│   ├── services/           # Service tests
│   ├── models/             # Model tests
│   ├── utils/              # Utility tests
│   └── components/         # Component tests
├── integration/            # Integration tests
│   ├── api/               # API endpoint tests
│   ├── workflows/         # Multi-step workflows
│   └── services/          # Service collaboration tests
└── e2e/                   # End-to-end tests
    ├── auth.spec.ts
    ├── quiz.spec.ts
    ├── analytics.spec.ts
    └── ai-tutor.spec.ts
```

---

## Git & Version Control

### Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>

Types:
  feat:     New feature
  fix:      Bug fix
  docs:     Documentation
  style:    Code style (formatting)
  refactor: Code refactoring (no feature change)
  test:     Adding/updating tests
  chore:    Build, dependencies, tooling
  perf:     Performance improvements

Scope:
  auth, quiz, analytics, ai, api, ui, db, etc.

Subject:
  - Use imperative mood ("add" not "added")
  - Don't capitalize first letter
  - No period at end
  - Max 50 characters

Body:
  - Explain what and why, not how
  - Wrap at 72 characters
  - Optional

Footer:
  - Reference issues: Fixes #123, Closes #456
  - BREAKING CHANGE: description
```

### Commit Examples

```bash
# Good commits
git commit -m "feat(quiz): add timer functionality to quiz taker"
git commit -m "fix(auth): resolve JWT token refresh race condition"
git commit -m "docs(api): update authentication endpoints documentation"

# Bad commits
git commit -m "fixed stuff"
git commit -m "WIP: work in progress"
git commit -m "Update"
```

### Branch Strategy

```
main (production)
  ↑
  └─ release/* (staging)
       ↑
       └─ develop (development)
            ↑
            ├─ feature/user-auth
            ├─ feature/quiz-engine
            ├─ bugfix/fix-timer-bug
            └─ hotfix/critical-security-issue
```

### Branch Naming

```
feature/descriptive-name       # New features
bugfix/descriptive-name        # Bug fixes
hotfix/critical-issue          # Critical production fixes
refactor/component-name        # Code refactoring
docs/what-you-documented       # Documentation
test/what-you-tested           # Test additions

Examples:
feature/user-authentication
bugfix/quiz-timer-off-by-one
hotfix/sql-injection-vulnerability
refactor/api-error-handling
```

---

## Documentation Standards

### Code Comments

```typescript
// ✅ Meaningful comments
// Exponential backoff: start at 1s, max 30s
const backoffMs = Math.min(1000 * Math.pow(2, retryCount), 30000);

// ✅ Explain why, not what
// We cache quizzes for 1 hour because they're frequently accessed
// and changes are published through a separate workflow
const QUIZ_CACHE_DURATION = 3600;

// ❌ Obvious comments
const x = x + 1; // Increment x
const name = "John"; // Set name to John

// ✅ Document complex algorithms
/**
 * Calculates percentile rank using linear interpolation
 * between sorted values. Used for leaderboard positioning.
 *
 * Example: rank([10, 20, 30, 40], 25) returns 62.5
 */
function calculatePercentile(values: number[], score: number): number {
  // Implementation
}
```

### JSDoc/DocStrings

```typescript
// ✅ TypeScript/JSDoc
/**
 * Calculates the total score and accuracy for a quiz attempt.
 *
 * @param answers - Array of user answers
 * @param quiz - Quiz metadata containing correct answers
 * @returns Result object with score, accuracy, and breakdown
 * @throws ValidationError if answers don't match quiz questions
 *
 * @example
 * const result = calculateQuizScore(answers, quiz);
 * console.log(result.percentage); // 85.0
 */
function calculateQuizScore(
  answers: UserAnswer[],
  quiz: Quiz
): QuizResult { }

// ✅ Python docstring
def calculate_quiz_score(
    answers: List[UserAnswer],
    quiz: Quiz
) -> QuizResult:
    """
    Calculate the total score and accuracy for a quiz attempt.
    
    Args:
        answers: Array of user answers with question_id and selected_option
        quiz: Quiz metadata containing correct answers
    
    Returns:
        QuizResult object containing:
        - score: Total score out of quiz.total_questions
        - accuracy: Percentage accuracy (0-100)
        - breakdown: Score breakdown by category
    
    Raises:
        ValueError: If answers don't match quiz questions
        ValidationError: If any answer is invalid
    
    Example:
        >>> answers = [UserAnswer(question_id='q1', selected_option=0)]
        >>> result = calculate_quiz_score(answers, quiz)
        >>> print(result.accuracy)
        100.0
    """
```

### README Documentation

- Project overview and vision
- Setup instructions
- Architecture diagrams
- API documentation
- Deployment guides
- Contributing guidelines
- Roadmap

### API Documentation

```markdown
## Quiz Endpoints

### Get All Quizzes
Retrieve list of available quizzes with pagination.

**Endpoint:** `GET /api/v1/quizzes`

**Query Parameters:**
- `page` (int, optional): Page number, default 1
- `limit` (int, optional): Items per page, default 20
- `category` (string, optional): Filter by category
- `difficulty` (string, optional): easy, medium, hard
- `search` (string, optional): Search quiz title

**Response:**
```json
{
  "success": true,
  "data": [...],
  "pagination": {...}
}
```

**Example:**
```bash
curl -H "Authorization: Bearer <token>" \
  'https://api.anvi-prep-ai.com/api/v1/quizzes?category=math&limit=10'
```
```

---

## Performance Standards

### Frontend Performance

```
Lighthouse Targets:
- Performance: > 90
- Accessibility: > 95
- Best Practices: > 90
- SEO: > 90

Core Web Vitals:
- LCP (Largest Contentful Paint): < 2.5s
- FID (First Input Delay): < 100ms
- CLS (Cumulative Layout Shift): < 0.1

Bundle Size:
- JavaScript: < 200KB (gzipped)
- CSS: < 50KB (gzipped)
- Total assets: < 500KB initial load
```

### Backend Performance

```
Response Time Targets:
- API endpoints: p95 < 200ms
- Database queries: p95 < 50ms
- AI inference: p95 < 3s
- Cache hits: < 10ms

Throughput:
- Requests per second: 1000+
- Concurrent connections: 10000+
- Database connections: 100-200 pool size
```

### Database Performance

```sql
-- Query performance targets
-- p95 execution time < 50ms for standard queries

-- Use EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT u.user_id, COUNT(*)
FROM users u
LEFT JOIN user_quiz_attempts qa ON u.user_id = qa.user_id
WHERE u.created_at > NOW() - INTERVAL '30 days'
GROUP BY u.user_id;

-- Indexing strategy
CREATE INDEX CONCURRENTLY idx_users_created_at ON users(created_at);
CREATE INDEX CONCURRENTLY idx_user_quiz_attempts_user_id_created_at 
  ON user_quiz_attempts(user_id, created_at DESC);
```

---

## Security Standards

### Input Validation

```python
# ✅ Always validate input
from pydantic import BaseModel, validator, EmailStr

class CreateQuizSchema(BaseModel):
    title: str
    description: Optional[str] = None
    category: str
    
    @validator('title')
    def title_not_empty(cls, v):
        if not v.strip():
            raise ValueError('Title cannot be empty')
        if len(v) > 255:
            raise ValueError('Title too long (max 255 chars)')
        return v.strip()
    
    @validator('category')
    def valid_category(cls, v):
        valid_categories = ['math', 'reasoning', 'english', 'ga']
        if v not in valid_categories:
            raise ValueError(f'Invalid category: {v}')
        return v
```

### Authentication

```python
# ✅ Secure JWT implementation
from datetime import datetime, timedelta
from jose import jwt
from passlib.context import CryptContext

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

def create_access_token(user_id: str, expires_delta: timedelta = None):
    if expires_delta:
        expire = datetime.utcnow() + expires_delta
    else:
        expire = datetime.utcnow() + timedelta(hours=24)
    
    to_encode = {"sub": str(user_id), "exp": expire}
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt

def verify_token(token: str) -> str:
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        user_id = payload.get("sub")
        if user_id is None:
            raise JWTError()
        return user_id
    except JWTError:
        raise HTTPException(status_code=401, detail="Invalid token")
```

### SQL Injection Prevention

```python
# ✅ Use ORM or parameterized queries
# SQLAlchemy ORM
user = session.query(User).filter(User.email == email).first()

# ❌ Never do this
query = f"SELECT * FROM users WHERE email = '{email}'"  # SQL Injection!

# ✅ If using raw SQL
query = "SELECT * FROM users WHERE email = :email"
result = session.execute(query, {"email": email})
```

### Rate Limiting

```python
from slowapi import Limiter
from slowapi.util import get_remote_address

limiter = Limiter(key_func=get_remote_address)

# Rate limit endpoints
@app.post("/api/v1/auth/login")
@limiter.limit("5/minute")  # 5 attempts per minute
async def login(credentials: LoginSchema):
    pass

@app.get("/api/v1/quiz")
@limiter.limit("100/minute")
async def get_quizzes():
    pass
```

### Environment Variables

```bash
# ✅ Never commit secrets
echo ".env" >> .gitignore
echo ".env.local" >> .gitignore
echo "secrets.yaml" >> .gitignore

# ✅ Use environment variables in production
# AWS Secrets Manager, GitHub Secrets, etc.

# ✅ Validate required secrets on startup
import os

required_secrets = [
    'SECRET_KEY',
    'DATABASE_URL',
    'REDIS_URL'
]

for secret in required_secrets:
    if not os.getenv(secret):
        raise RuntimeError(f"Missing required secret: {secret}")
```

---

## Deployment Standards

### Pre-Deployment Checklist

```yaml
Code Quality:
  ✓ All tests passing
  ✓ No linting errors
  ✓ No TypeScript/Python errors
  ✓ Code review approved
  ✓ No hardcoded secrets

Performance:
  ✓ Bundle size acceptable
  ✓ No performance regressions
  ✓ Database queries optimized
  ✓ Caching configured

Security:
  ✓ Security scan passed
  ✓ Dependencies updated and checked
  ✓ No known vulnerabilities
  ✓ Input validation complete

Operations:
  ✓ Monitoring alerts configured
  ✓ Logs aggregation active
  ✓ Backups configured
  ✓ Rollback plan ready
  ✓ Health checks working

Documentation:
  ✓ API docs updated
  ✓ Architecture docs updated
  ✓ Deployment notes documented
```

---

**This document should be reviewed and updated quarterly as standards evolve.**

Last Updated: Q1 2024
Next Review: Q2 2024
