@echo off
REM Console application runner script for Windows
REM This script provides commands to build and run the MSAL Interactive Auth Console

setlocal enabledelayedexpansion

if "%1"=="run" (
    dotnet run --project MSALInteractiveAuthConsole.csproj
    goto end
)

if "%1"=="build" (
    dotnet build MSALInteractiveAuthConsole.csproj
    goto end
)

if "%1"=="docker-up" (
    docker-compose up -d
    goto end
)

if "%1"=="docker-down" (
    docker-compose down
    goto end
)

if "%1"=="podman-up" (
    podman-compose up -d
    goto end
)

if "%1"=="podman-down" (
    podman-compose down
    goto end
)

if "%1"=="" (
    echo Usage: run.bat [command]
    echo.
    echo Commands:
    echo   run       - Build and run the console application
    echo   build     - Build the console application only
    echo   docker-up - Start the application using Docker
    echo   docker-down - Stop the application using Docker
    echo   podman-up - Start the application using Podman
    echo   podman-down - Stop the application using Podman
    goto end
)

echo Unknown command: %1
echo Use 'run.bat' with no arguments to see available commands.

:end
endlocal
