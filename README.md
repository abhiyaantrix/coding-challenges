# Coding Challenges

A repository of coding challenges solved using Ruby and TypeScript.

I have created this repository to keep backup of coding challenges I am solving with Ruby and TypeScript
and to have a reference for future interviews.

## How to run

Prerequisite, [Docker](https://docs.docker.com/get-docker/)

```bash
docker build . -t coding-challenges/ruby:latest -f Dockerfile.ruby
docker build . -t coding-challenges/typescript:latest -f Dockerfile.nodejs
docker run --rm coding-challenges/ruby:latest
docker run --rm coding-challenges/typescript:latest
```

Execute in watch mode with [Guard gem](https://github.com/guard/guard), [Jest](https://jestjs.io/)
and `docker compose`

```bash
docker compose up

# or with rebuilding the Docker image
docker compose up --build

# or to force recreation
docker compose up --build --force-recreate --remove-orphans

# Run one off specs
docker compose run ruby-test rspec
docker compose run typescript-test npm test
```

## Challenges

### [Ruby](docs/challenges.md#ruby)

### [TypeScript](docs/challenges.md#typescript)
