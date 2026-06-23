# my-web-test

A Dockerized web server with Three.js molecular animation frontend and Nginx reverse proxy. Designed for deployment on Render or similar container platforms.

## Quick Start

```bash
docker build -t my-web-test .
docker run -p 10000:10000 my-web-test
```

## What's Inside

- **Frontend**: Three.js animated molecular structure labeled "MOLECULAR_CORE_ACTIVE"
- **Nginx**: reverse proxy with WebSocket support on `/assets/v1/physics/stream`
- **Xray core**: backend service (downloaded automatically in `start_node.sh`)

## Configuration

- Port is set via the `PORT` environment variable (defaults to 10000)
- `model_params.db` contains backend configuration in JSON format

## License

MIT
