# Karate PoC

This repository is a Proof of Concept (PoC) project showcasing the use of [Karate](https://github.com/karatelabs/karate), a framework for API testing, performance testing, and mocking.

## Features

- **API Testing:** Demonstrates how to test RESTful APIs with Karate.
- **Performance Testing:** Includes examples of performance tests using Karate's built-in capabilities.
- **Mocking Services:** Provides examples of creating and using mock services for testing purposes.

## Requirements

- Java 8 or later
- Maven or Gradle build tool (optional but recommended)

## Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/MarcelaBustamante/karateproj.git
   cd karateproj
   ```

2. **Set up the environment:**
   Ensure that you have Java installed and properly configured. Install Maven or Gradle if needed.

3. **Run tests:**
   To execute the tests, use the following Maven command:
   ```bash
   mvn test
   ```
   Alternatively, you can use Gradle:
   ```bash
   gradle test
   ```

## Project Structure

- `src/test/java`: Contains the Karate test scripts.
- `src/test/resources`: Holds the feature files defining test scenarios.
- `mock/`: Includes mock services for simulating API responses during testing.

## How to Contribute

We welcome contributions to enhance this PoC. Feel free to submit issues or pull requests. 

### Steps to Contribute:

1. Fork this repository.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request with a clear description of your changes.

