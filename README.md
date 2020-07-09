# PgTap

Unit testing for postgres. Full documentation [here](https://pgtap.org/documentation.html).

```bash
$ make tests
```

## Why unit testing in Postgres?

- write SQL to test SQL!
- testing roles/functions is easier
- your playground to verify if things works, and serve as a documentation too

## Faster postgres testing

Set the following in `postgresql.conf`:
```
fsync = off
full_page_writes = off
```

To understand the implications, read [here](https://www.postgresql.org/docs/8.1/runtime-config-wal.html#:~:text=If%20you%20trust%20your%20operating,also%20consider%20turning%20off%20full_page_writes.).
