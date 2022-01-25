USE codeup_test_db;

INSERT INTO quotes (author_first_name, author_last_name, content)
VALUES('Douglas', 'Adams', 'Don''t Panic.'),
       ('Steve', 'Maraboli', 'Happiness no the absence of problems.'),
       ('Ernest', 'Hemingway', 'the world breaks everyone, and afterward, some are strong at the broken places.'),
       ('Lou', 'Holtz', 'Virtually nothing is impossible in this world if you just a put your mind to it and maintain a positive attitude.');

SELECT id, author_first_name, content FROM quotes;
