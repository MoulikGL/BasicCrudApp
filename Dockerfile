FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY BasicCrudApp.sln ./
COPY BasicCrudApp/*.csproj ./BasicCrudApp/
RUN dotnet restore

COPY . .
WORKDIR /src/BasicCrudApp
RUN dotnet publish -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "BasicCrudApp.dll"]