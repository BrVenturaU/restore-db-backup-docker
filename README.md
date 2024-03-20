# SQL Server Image Backup
This is a basic sample project to configure a backup for a SQL Server Database using docker containers.

This project uses the **AdventureWorksLT2022** backup database download from the Microsoft sources.

## About the restoration files

- **restore-backup.sql:** Contains the restoration scripts to restore the database on the docker image generation.
- **restore-backup-sanitized.sql:** Same as **restore-backup.sql** but with a sample sanitization script to secure sensitive production data.

## Image and Container generation

The project has a Dockerfile and a Compose file to generate the SQL Server Backup image the way you want.

- Run `docker build -t restored-db:1.0.0 .` followed by `docker run -p 11433:1433 --name my-restored-db -d --rm restored-db:1.0.0` to build the image and run a container using the generated image.
    - Remove `--rm` option if you want to preserve the container after shut it down.
- Run `docker compose up -d --build` to build the image and run a container using that image without command boilerplate. 
    - Remove `--build` option if you already have an image to use with. 
    - Use `start` instead of `up` to initialize the service if you already have a container.

## Have Fun

Now you'll have an instance of SQL Server running on a container with an already configured datadabase, you can test it out connecting to it using whatever client you want through  localhost and 11433 PORT.

