<div align="center">
  <a href="https://github.com/FachschaftMathPhysInfo/cards">
    <img src="frontend/public/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">Stapel</h3>

  <p align="center">
    A simple platform to share and authorize Anki Decks.
    <br />
    <a href="https://stapel.mathphys.info"><strong>Explore a live version »</strong></a>
    <br />
    <br />
    <a href="https://github.com/FachschaftMathPhysInfo/cards/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    &middot;
    <a href="https://github.com/FachschaftMathPhysInfo/cards/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>

## Getting started
### Deployment via docker-compose
```bash
services:
  stapel:
    image: ghcr.io/fachschaftmathphysinfo/cards:latest
    ports:
      - 8080:8080
    env_file: .env
    volumes:
      - ./data:/app/storage
```

## Environment Variables

### Required for Production environment
| Key | Description | Example |
| - | - | - |
| `PUBLIC_URL` | Domain under which pepp is deployed | `https://stapel.example.com` |
| `SMTP_HOST` | E-Mail provider | `smtp.example.com` |
| `SMTP_USER` | The user to log into the SMTP Server | `alice@example.com` |
| `SMTP_PASSWORD` | The password to log into the SMTP Server | - |
| `SMTP_PORT` | The port of your SMTP Server | `465` |
| `NOTIFICATION_FROM_ADDRESS` | Address from which mails are send | `stapel@example.com` |
| `NOTIFICATION_TO_ADDRESS` | Address which gets notified about new decks | `alice@example.com` |

## Development
### Build
```bash
cp .env .env.local
docker compose build
docker compose up -d && docker compose logs -f
```

- Frontend: [localhost:8080](http://localhost:8080)
- API: [localhost:8080/graphql](http://localhost:8080/graphql)
- GraphQL Playground: [localhost:8080/playground](http://localhost:8080/playground)

#### Frontend
```bash
cd frontend
npm i
npm run dev
```

#### Backend
```bash
cd server
go generate ./...
go run server.go
```

## Contributions
1. [create an issue](https://github.com/FachschaftMathPhysInfo/cards/issues/new)
2. from this issue create a branch and work on it
3. create a pull request and tag one of the main contributors for a short review
4. sanfter Schulterklopfer ♡
