# Use the official Python image as the parent image
FROM python:3.9-slim-buster

# Set the working directory to /app
WORKDIR /app

# Install git and clone the Eddie-Bot repository
RUN apt-get update && apt-get install -y git vim && \
    git clone https://gist.githubusercontent.com/floork/cbe7ffe264c1d8da2731f0e0253a8c8d .

# Copy the .env.local file to the working directory
COPY .env.local .

# Install the required Python packages
RUN pip3 install --no-cache-dir discord.py python-dotenv beautifulsoup4 requests

# Run the bot
CMD [ "python3", "bot.py" ]