# Use the official .NET SDK image as the parent image
FROM mcr.microsoft.com/dotnet/sdk:7.0

# Set the working directory to /app
WORKDIR /app

# Install git
RUN apt-get update && apt-get install -y git

# Clone the Eddie-Bot repository
RUN git clone https://github.com/just-ero/MensaPlus.Discord.git .

# Restore dependencies and build the application
RUN dotnet restore
RUN dotnet build -c Release

# Run the bot
CMD [ "dotnet", "run"]
