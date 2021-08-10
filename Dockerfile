#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.
 FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443
 
FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /src
COPY /WebApi/*.csproj /WebApi/
COPY /Application/*.csproj /Application/
COPY /Domain/*.csproj /Domain/
COPY /Persistence/*.csproj /Persistence/
 
RUN dotnet restore "/WebApi/WebApi.csproj"
COPY . .
WORKDIR "/src/WebApi"
RUN dotnet build "WebApi.csproj" -c Release -o /app/build
 
FROM build AS publish
RUN dotnet publish "WebApi.csproj" -c Release -o /app/publish
 
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebApi.dll"]

#docker build -f .\WebApi\Dockerfile -t test-onion .
#docker run -d -p 8080:80 --name test-onion-app-3 test-onion
