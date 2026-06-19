run() {
    dotnet run --project ApplicationInsightsSimpleApi.csproj
}

build() {
    dotnet build ApplicationInsightsSimpleApi.csproj
}

docker-up() {
    docker-compose up -d
}

docker-down() {
    docker-compose down
}

podman-up() {
    podman-compose up -d
}

podman-down() {
    podman-compose down
}