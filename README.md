# Karate Project

Welcome to the Karate Project! This project is designed to facilitate API testing using the Karate DSL, featuring tests for RESTful and GraphQL APIs, along with performance testing capabilities.

## Getting Started

These instructions will help you set up the project on your local machine for development and testing purposes.

### Prerequisites

Before you begin, ensure you have met the following requirements:

- **Java JDK 8** or higher installed on your machine.
- **Maven 3.5.0** or higher installed for building and running tests.
- A code editor or IDE such as IntelliJ IDEA or Eclipse.

### Installation

1. **Clone the repository:**

   ```bash
   git clone <your-repository-url>
   ```
### Navigate to the project directory

```bash
cd karateproject
```

### Running the Tests
To run the tests using Maven, follow these steps:

* Open your terminal (or command prompt) in the project directory.

* Use the following Maven command to execute Karate tests:

``` bash
mvn clean test
```

This command will clean the target directory and execute all the tests specified in your Karate feature files.

### View the results:

Test reports are generated in the target/surefire-reports directory. You can view a detailed report in the target/cucumber-html-reports directory.

### Project Structure
src/test/java: Java test scripts and runners.
src/test/resources: Contains feature files written in Gherkin syntax.
pom.xml: Contains all the project configurations and dependencies.

# Using Docker
To run tests in a Docker container, follow these steps:

## Build the Docker image:
Make sure you have a Dockerfile set up in your project. An example Dockerfile might look like this:

dockerfile
FROM maven:3.8.1-openjdk-11
WORKDIR /app
COPY . /app
RUN mvn clean install
Build the Docker image by running:

``` bash
docker build -t karate-project .
```

## Run the Docker container:

Execute the following command to run the tests inside a Docker container:

``` bash
docker run --rm karate-project
```

## Check the results:
Ensure you have volume mounts or other options set up if you need to access test results outside the container.
