# Build stage
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app

COPY . . 
RUN dotnet publish "Technovyn Innovation.csproj" -c Release -o /app/out

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app/out ./

ENTRYPOINT ["dotnet", "Technovyn Innovation.dll"]
