BEGIN;

	CREATE SCHEMA IF NOT EXISTS question_test;

	CREATE OR REPLACE FUNCTION question_test.setup_test_count()
	RETURNS SETOF TEXT AS $$
	BEGIN
		CREATE TABLE IF NOT EXISTS question_test.question (
			body text NOT NULL
		);
		RETURN NEXT has_table('question_test', 'question', 'should exist table question');
		INSERT INTO question_test.question (body) VALUES ('hello');
	END;
	$$ LANGUAGE plpgsql;

	CREATE OR REPLACE FUNCTION question_test.test_count()
	RETURNS SETOF TEXT AS $$
	BEGIN
		RETURN NEXT set_eq(
			'select count(*)::int as count from question_test.question',
			ARRAY[1],
			'should return count 1'
		);
		RETURN NEXT has_column('question_test', 'question', 'body', 'should have column body');
	END;
	$$ LANGUAGE plpgsql;

	CREATE OR REPLACE FUNCTION question_test.test_body()
	RETURNS SETOF TEXT AS $$
	BEGIN
		RETURN NEXT set_eq(
			'select * from question_test.question',
			ARRAY['hello'],
			'should return body'
		);
	END;
	$$ LANGUAGE plpgsql;

	SELECT * FROM runtests('question_test'::name);

ROLLBACK;
