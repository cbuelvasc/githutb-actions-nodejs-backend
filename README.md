# Node.js Backend Example

## Overview
This project is a simple Node.js backend application using Express and MongoDB. It provides a RESTful API for managing events, with endpoints to create and retrieve events. The project is containerized with Docker and includes automated testing and deployment workflows using GitHub Actions.

## Features
- RESTful API for event management
- MongoDB integration for data persistence
- Automated tests using Playwright
- Docker support for containerized deployment
- CI/CD pipeline with GitHub Actions

## Getting Started

### Prerequisites
- Node.js 16 or later
- npm
- MongoDB Atlas account (or a running MongoDB instance)
- Docker (optional, for containerized runs)

### Installation
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd githutb-actions-nodejs-backend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Set up environment variables (see below).
4. Start the server:
   ```bash
   npm start
   ```

## Environment Variables
The application requires the following environment variables:
- `MONGODB_CONNECTION_PROTOCOL` (e.g., `mongodb+srv`)
- `MONGODB_CLUSTER_ADDRESS` (e.g., `cluster0.ntrwp.mongodb.net`)
- `MONGODB_USERNAME` (your MongoDB Atlas username)
- `MONGODB_PASSWORD` (your MongoDB Atlas password)
- `MONGODB_DB_NAME` (database name, e.g., `gha-demo`)
- `PORT` (port for the server, e.g., `8080`)

You can set these in your shell or in a `.env` file (if you add dotenv support).

## Running with Docker
To build and run the application using Docker:
```bash
docker build -t node-backend .
docker run -p 8080:8080 \
  -e MONGODB_CONNECTION_PROTOCOL=<protocol> \
  -e MONGODB_CLUSTER_ADDRESS=<cluster-address> \
  -e MONGODB_USERNAME=<username> \
  -e MONGODB_PASSWORD=<password> \
  -e MONGODB_DB_NAME=<db-name> \
  -e PORT=8080 \
  node-backend
```

## Testing
Tests are written using [Playwright](https://playwright.dev/). To run tests:
```bash
npm test
```
Test configuration is in `playwright.config.js`. Tests are located in the `tests/` directory and cover API endpoints for creating and retrieving events.

## CI/CD
This project uses GitHub Actions for continuous integration and deployment. The workflow is defined in `.github/workflows/deployment.yml` and includes:
- Installing dependencies
- Running tests
- Deploying on successful test completion (for `master` and `develop` branches)

## API Endpoints
### `GET /`
- Retrieves all events from the database.
- **Response:** `{ events: [ ... ] }`

### `POST /`
- Creates a new event.
- **Request Body:** JSON object with event data (e.g., `{ "title": "Event Title" }`)
- **Response:** `{ message: 'Event created.', event: { ... } }`

## License
This project is licensed under the ISC License. 