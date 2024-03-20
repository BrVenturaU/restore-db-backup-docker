RESTORE DATABASE [AdventureWorks] FROM DISK = '/tmp/AdventureWorksLT2022.bak'
WITH FILE = 1,
MOVE 'AdventureWorksLT2022_Data' TO '/var/opt/mssql/data/AdventureWorks.mdf',
MOVE 'AdventureWorksLT2022_Log' TO '/var/opt/mssql/data/AdventureWorks.ldf',
NOUNLOAD, REPLACE, STATS = 5
GO