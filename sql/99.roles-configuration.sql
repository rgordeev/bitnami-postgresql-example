\c test

CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

SET ROLE test;

-- ADD pg_stat_statements FUNCTIONS
create function pg_current_xlog_location() returns pg_lsn
    stable
    language sql
as $$
SELECT pg_current_wal_lsn();
$$;

create function pg_last_xlog_receive_location() returns pg_lsn
    stable
    language sql
as $$
SELECT pg_last_wal_receive_lsn();
$$;

create function pg_last_xlog_replay_location() returns pg_lsn
    stable
    language sql
as $$
SELECT pg_last_wal_replay_lsn();
$$;

create function pg_xlog_location_diff(pg_lsn, pg_lsn) returns numeric
    stable
    language sql
as $$
SELECT pg_wal_lsn_diff($1, $2);
$$;
