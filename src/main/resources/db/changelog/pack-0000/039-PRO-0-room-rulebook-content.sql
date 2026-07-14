-- Точечный выбор элементов набора правил в комнате: помимо включения бандла целиком
-- (rules.room_rulebook_bundle) можно включать отдельные расы/классы/предыстории по их id.
CREATE TABLE rules.room_rulebook_content
(
    room_id    uuid      NOT NULL,
    content_id uuid      NOT NULL, -- id строки rules.race / rules.clazz / rules.background
    created_at timestamp NOT NULL DEFAULT now(),
    PRIMARY KEY (room_id, content_id)
);
CREATE INDEX room_rulebook_content_room_idx ON rules.room_rulebook_content (room_id);
