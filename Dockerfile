FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /app

RUN apt-get update && \
    apt-get upgrade -y

COPY . /app

RUN dotnet build MSALInteractiveAuthConsole.csproj

FROM mcr.microsoft.com/dotnet/runtime:8.0

WORKDIR /app

RUN groupadd -r -g 10001 appGrp && \
    useradd -r -u 10000 -s /sbin/nologin -g appGrp appuser

COPY --from=build /app/bin/Release/net8.0 /app

RUN chown -R appuser:appGrp /app && \
    chmod -R 755 /app

USER appuser

ENTRYPOINT ["dotnet", "MSALInteractiveAuthConsole.dll"]