# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy solution and restore dependencies
COPY BasicCrudApp.sln ./
COPY BasicCrudApp/*.csproj ./BasicCrudApp/
RUN dotnet restore

# Copy all source and build
COPY . .
WORKDIR /src/BasicCrudApp
RUN dotnet publish -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "BasicCrudApp.dll"]