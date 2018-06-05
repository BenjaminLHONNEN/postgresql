ALTER SYSTEM SET timezone = 'Europe/Paris';
ALTER SYSTEM SET listen_addresses = '*';

SELECT pg_reload_conf();
