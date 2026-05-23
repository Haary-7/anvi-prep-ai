#!/bin/bash

# Root level directories
mkdir -p .github/workflows .github/ISSUE_TEMPLATE

# Apps
mkdir -p apps/web/public/{images,fonts,favicons}
mkdir -p apps/web/src/{app/{auth,dashboard},components/{ui,layout,quiz,analytics,ai-tutor,common,forms},hooks,lib,types,store/{queries,mutations},context,config,middleware}
mkdir -p apps/web/__tests__/{unit/{hooks,lib,utils},integration/{auth,quiz},e2e}

mkdir -p apps/api/app/{api/v1/{endpoints},services,models,schemas,utils,middleware,db,ai}
mkdir -p apps/api/migrations/versions
mkdir -p apps/api/tests/{unit/{services,models,utils},integration/api,e2e}
mkdir -p apps/api/scripts

# Services
mkdir -p services/ai_engine/app/{services,models,api/endpoints,tests}

# Infrastructure
mkdir -p infrastructure/docker
mkdir -p infrastructure/nginx/conf.d/ssl
mkdir -p infrastructure/kubernetes/{frontend,backend,ai,postgres,redis,monitoring}
mkdir -p infrastructure/terraform
mkdir -p infrastructure/scripts

# Monitoring
mkdir -p monitoring/{prometheus,grafana/{dashboards,provisioning},loki,jaeger,alerting}

# Docs
mkdir -p docs/{architecture,api,deployment,development,operations,ai}

# Scripts
mkdir -p scripts

echo "Directory structure created successfully!"
