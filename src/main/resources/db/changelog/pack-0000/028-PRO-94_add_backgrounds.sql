CREATE TABLE rules.background
(
    id                  uuid    NOT NULL,
    roomId              uuid    NOT NULL,
    name                text    NOT NULL,
    description         text    NULL,
    code                text    NOT NULL,
    img_url             varchar NULL,
    background_stats_id uuid    NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON TABLE rules.background IS 'Предыстории';