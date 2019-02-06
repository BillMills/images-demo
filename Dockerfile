FROM microsoft/dotnet:2.2-sdk AS build
COPY dotnetapp/*.csproj /app/dotnetapp/
COPY utils/*.csproj /app/utils/
WORKDIR /app/dotnetapp
RUN dotnet restore    

COPY dotnetapp/. /app/dotnetapp/
COPY utils/. /app/utils/
WORKDIR /app/dotnetapp
RUN dotnet publish -c Release -o out

FROM build AS testrunner
WORKDIR /app/tests
COPY tests/. .
ENTRYPOINT ["dotnet", "test", "--logger:trx"]    

FROM microsoft/dotnet:2.2-runtime
WORKDIR /app
COPY --from=build /app/dotnetapp/out ./
ENTRYPOINT ["dotnet", "dotnetapp.dll"]
