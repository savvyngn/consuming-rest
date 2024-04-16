# ConsumingRest

This program demonstrates how to consume a RESTful API using Java and Maven. It makes RESTful API calls to a service called Quoters and is packaged into a Docker container for deployment on Kubernetes.

## Build Instructions

To build and run the program, follow these steps:

1. Clone this repository:

   ```bash
   git clone https://github.com/savvyngn/consuming-rest.git
   cd consuming-rest
   ```

2. Ensure you have Maven and Docker installed on your system.

3. Build the Docker image for the program:

   ```bash
   docker build -t <docker_username>/consumingrest .
   ```

4. Push the Docker image to your Docker Hub repository (optional):

   ```bash
   docker push <docker_username>/consumingrest
   ```

5. Deploy the program on Kubernetes:

   ```bash
   kubectl run consumingrest --image=<docker_username>/consumingrest --env="quoters_base_url=http://quoters:8080"
   ```

## Usage

Once the program is deployed on Kubernetes, you can verify that it successfully connects to the Quoters service by inspecting the logs of the pod:

```bash
kubectl logs consumingrest
```

In the logs, you should see the output of the four RESTful API calls to the Quoters server, displaying four quotes.

## RESTful API Calls

The program makes the following RESTful API calls to the Quoters server:

- GET http://localhost:8080/api/random
- GET http://localhost:8080/api/1
- GET http://localhost:8080/api/2
- GET http://localhost:8080/api/3

## Repository Structure

This repository includes the following files:

- `src/main/java`: Contains the Java source code for the program.
- `Dockerfile`: Defines the Docker image configuration for the program.
- `README.md`: Provides instructions for building and deploying the program.
- `.gitignore`: Specifies intentionally untracked files to ignore.
- `pom.xml`: Maven project object model file specifying dependencies and build configuration.
- `application.properties`: Contains application properties, including the base URL for the Quoters service.
