# Single-stage Dockerfile for stability with Node 10
FROM node:10-alpine

WORKDIR /app

# Install system dependencies for native modules and build tools
RUN apk add --no-cache python make g++ git

# Copy dependency files first
COPY package.json yarn.lock* ./

# Install ALL dependencies (including devDependencies for babel-node)
RUN yarn install --frozen-lockfile || npm install

# Copy the rest of the source code
COPY . .

# Build the Next.js web app
RUN npm run build

# Set environment
ENV NODE_ENV=production

# Expose the port
EXPOSE 3000

# Start the production server using babel-node as specified in package.json
CMD ["npm", "start"]
