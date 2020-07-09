BEGIN;
SELECT plan(2);

-- Run the tests.
SELECT hasnt_table('"user"');
SELECT throws_ok('INSERT INTO "user" (name, age) VALUES (''john'', ''doe'')');

-- Finish the tests and clean up.
SELECT * FROM finish();
ROLLBACK;
