FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY ["Example.WebApi/Example.WebApi.csproj", "Example.WebApi/"]
RUN dotnet restore "Example.WebApi/Example.WebApi.csproj"
COPY . .
WORKDIR "/src/Example.WebApi"
RUN dotnet build "Example.WebApi.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "Example.WebApi.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Example.WebApi.dll"]