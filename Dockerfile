# Build stage
FROM node:20-slim AS builder
WORKDIR /app

# Pass the Google Maps API key in at build time so the client bundle can access it.
ARG VITE_GOOGLE_MAPS_API_KEY
ENV VITE_GOOGLE_MAPS_API_KEY=${VITE_GOOGLE_MAPS_API_KEY}

COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Production runner
FROM node:20-slim AS runner
ARG VITE_GOOGLE_MAPS_API_KEY
ENV NODE_ENV=production
ENV VITE_GOOGLE_MAPS_API_KEY=${VITE_GOOGLE_MAPS_API_KEY}
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY --from=builder /app/build ./build
EXPOSE 3000
CMD ["node", "build"]
