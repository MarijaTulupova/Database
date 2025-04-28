CREATE OR REPLACE FUNCTION set_created_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.created_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_set_created_at
BEFORE INSERT ON movies
FOR EACH ROW
EXECUTE FUNCTION set_created_at();



CREATE OR REPLACE FUNCTION prevent_future_release_date()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.release_date > CURRENT_DATE THEN
        RAISE EXCEPTION 'Cannot insert movie with release date in the future.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER prevent_future_movie_insert
BEFORE INSERT ON movies
FOR EACH ROW
EXECUTE FUNCTION prevent_future_release_date();

