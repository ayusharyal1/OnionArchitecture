# Onion Architecture In ASP.NET Core With CQRS

The onion architecture, introduced by Jeffrey Palermo, overcomes the issues of the layered architecture with great ease. With Onion Architecture, the game changer is that the Domain Layer (Entities and Validation Rules that are common to the business case ) is at the Core of the Entire Application. This means higher flexbility and lesser coupling. In this approach, we can see that all the Layers are dependent only on the Core Layers.

# Disclaimer:
Forked From: https://github.com/iammukeshm/OnionArchitecture


# Prerequisites
Build and Run the application on Visual Studio.
Install Docker Desktop to test and run docker images locally.

# Docker commands for building and running the image.
cmd> cd <path\to\project\folder>
cmd> docker build -f .\WebApi\Dockerfile -t test-onion .
cmd> docker run -d -p 8080:80 --name test-onion-app-3 test-onion




