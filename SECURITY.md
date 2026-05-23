# Security Policy

## Reporting Security Vulnerabilities

**Do not open public GitHub issues for security vulnerabilities.**

If you discover a security vulnerability, please email us at **security@anvi-prep-ai.com** with:

1. Description of the vulnerability
2. Steps to reproduce (if applicable)
3. Potential impact
4. Your name and affiliation (optional)

We will:
- Acknowledge receipt within 24 hours
- Provide a security advisory within 72 hours
- Work with you to resolve the issue
- Credit you in the security advisory (if desired)

## Security Best Practices

### For Contributors

- Never commit secrets, API keys, or credentials
- Use environment variables for sensitive data
- Review code for security implications
- Keep dependencies updated
- Follow OWASP guidelines

### For Deployment

- Use HTTPS/TLS for all communications
- Implement strong authentication (JWT)
- Apply rate limiting to APIs
- Use SQL prepared statements (ORM)
- Validate all user input
- Implement proper logging without sensitive data

### For Users

- Use strong passwords (12+ chars, mixed case, numbers, symbols)
- Enable two-factor authentication (when available)
- Keep your browser and extensions updated
- Don't share your authentication tokens
- Report suspicious activity immediately

## Supported Versions

| Version | Supported          |
|---------|-------------------|
| 1.0.x   | ✅ Yes            |
| < 1.0   | ❌ No             |

## Known Issues

None currently. Please report security issues responsibly.

## Security Headers

We implement:
- Content-Security-Policy
- X-Frame-Options
- X-Content-Type-Options
- Strict-Transport-Security
- X-XSS-Protection

## Data Protection

- User data is encrypted in transit (TLS)
- Passwords are hashed using bcrypt
- Tokens expire after 24 hours
- Refresh tokens expire after 30 days
- API keys are rotated regularly

## Incident Response

If a security incident occurs, we will:
1. Assess the impact
2. Notify affected users
3. Implement fixes
4. Perform post-incident analysis
5. Implement preventive measures

## Contact

- Security Issues: security@anvi-prep-ai.com
- General Questions: support@anvi-prep-ai.com
