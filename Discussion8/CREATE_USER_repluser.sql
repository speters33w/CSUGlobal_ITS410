# Tables must have a primary key
# ALTER TABLE ap.invoice_archive ADD PRIMARY KEY(invoice_id);
DROP USER IF EXISTS 'repluser';
CREATE USER 'repluser'@'%' IDENTIFIED BY 'ReplicateReplicate';
GRANT REPLICATION CLIENT ON *.* TO 'repluser'@'%';
GRANT RELOAD ON *.* TO 'repluser'@'%';
GRANT SELECT ON *.* TO 'repluser'@'%';
GRANT EVENT ON *.* TO 'repluser'@'%';
GRANT TRIGGER ON *.* TO 'repluser'@'%';
GRANT PROCESS ON *.* TO 'repluser'@'%';
FLUSH PRIVILEGES;
