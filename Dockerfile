FROM mcr.microsoft.com/mssql/server:2022-latest AS build
ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD=myStrongPass!
WORKDIR /tmp
COPY AdventureWorksLT2022.bak .
COPY restore-backup-sanitized.sql .
RUN /opt/mssql/bin/sqlservr --accept-eula & sleep 20 \ 
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "myStrongPass!" -i /tmp/restore-backup-sanitized.sql \
    && pkill sqlservr
FROM mcr.microsoft.com/mssql/server:2022-latest AS release
ENV ACCEPT_EULA=Y
COPY --from=build /var/opt/mssql/data /var/opt/mssql/data