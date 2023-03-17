# Stage 1: Build the React app
FROM node:lts-alpine as build

LABEL AUTHOR="de-marauder"

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React app
RUN npm run build

# Stage 2: Host the built app in an Alpine image
FROM nginx:alpine

# Copy the built app to the nginx container
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 for incoming traffic
EXPOSE 80

# Start nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]