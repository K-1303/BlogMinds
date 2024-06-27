FROM node:18.19.0-alpine

# Create App Directory
WORKDIR /app

# Install Dependencies
COPY package*.json ./
COPY client/package*.json ./client/
RUN npm install

WORKDIR /app/client
RUN npm install

WORKDIR /app
COPY . .

WORKDIR /app/client
RUN npm run build

WORKDIR /app
RUN npm run build

# Exports
EXPOSE 8000

CMD ["npm", "start"]