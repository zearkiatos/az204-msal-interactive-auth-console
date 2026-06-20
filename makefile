run:
	dotnet run --project MSALInteractiveAuthConsole.csproj

build:
	dotnet build MSALInteractiveAuthConsole.csproj

docker-up:
	docker-compose up --build

docker-down:
	docker-compose down

podman-up:
	podman-compose up --build

podman-down:
	podman-compose down