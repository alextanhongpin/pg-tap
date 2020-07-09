-- Load the TAP functions.
BEGIN;

-- Plan the tests.
SELECT plan(1);

-- Run the tests.
SELECT ok( 9 < 10, 'simple comparison');

-- Finish the tests and clean up.
SELECT * FROM finish();
ROLLBACK;
