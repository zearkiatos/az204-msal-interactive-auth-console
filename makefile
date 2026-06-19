run:
	dotnet run --project MSALInteractiveAuthConsole.csproj

build:
	dotnet build MSALInteractiveAuthConsole.csproj

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down

podman-up:
	podman-compose up -d

podman-down:
	podman-compose down