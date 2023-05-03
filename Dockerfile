# Use a Node.js version that is compatible with your project
FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project files to the working directory
COPY . .

# Set environment variables for Stripe keys
ENV PORT=3000
ENV STATIC_DIR="./client"
ENV PUBLISHABLE_KEY="pk_test_51N0g8sSBFxvYxNZ3YQGHWZF8b8R4akXhmyVXYLpEh9ybBfV2CSgabAIkyaYtEs3XlyDhS5VWX6ZQKubacviQ8M8Z0027OWi8Rr"
ENV SECRET_KEY="sk_test_51N0g8sSBFxvYxNZ3qqSgFzN2KpvToazskHszWBZaeb9b1WTXO81uYN0gNONg9OB56GiO6fY3yS9uKjvaSeT6j7yV007ttxJ4sa"


# Expose the port that the Node.js application will listen on
EXPOSE 3000

# Start the Node.js application
CMD [ "node", "server.js" ]
