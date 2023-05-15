# Use the base image with Debian 11
FROM debian:11

# Install necessary dependencies
RUN apt-get update && apt-get install -y wget

# Download and install the Microsoft package repository
RUN wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
  && dpkg -i packages-microsoft-prod.deb \
  && rm packages-microsoft-prod.deb

# Set the working directory to /app
WORKDIR /app

# Install necessary packages
RUN apt-get update && apt-get install -y \
  apt-transport-https \
  dotnet-sdk-7.0

# Install git and vim
RUN apt-get update && apt-get install -y git vim

RUN git clone https://github.com/just-ero/MensaPlus.Discord

# Change the directory to MensaPlus.Discord
WORKDIR /app/MensaPlus.Discord

RUN dotnet restore

RUN dotnet build -c Release

# Set the CMD instruction to start a Bash shell
CMD ["./src/MensaPlus.Discord/bin/Release/net7.0/MensaPlus.Discord"]
