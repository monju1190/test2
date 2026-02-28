# Multi-stage Dockerfile for Flatris
# 1. Build stage
FROM node:10-alpine as builder

WORKDIR /app

# Copy package.json and yarn.lock (if exists)
COPY package.json yarn.lock* ./

# Install dependencies
# Note: Node 10 is quite old, but needed for this specific version of Flatris
RUN yarn install --frozen-lockfile || npm install

# Copy source
COPY . .

# Build the web app
RUN npm run build

# 2. Production stage
FROM node:10-alpine

WORKDIR /app

# Copy built assets and server code
COPY --from=builder /app/package.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/server ./server
COPY --from=builder /app/web ./web
COPY --from=builder /app/shared ./shared

# Expose the port the app runs on (usually 3000 for Next.js/Express)
EXPOSE 3000

# Start the production server
CMD ["npm", "start"]
