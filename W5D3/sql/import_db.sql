DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;

PRAGMA foreign_keys = ON;

CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    f_name VARCHAR(255) NOT NULL,
    l_name VARCHAR(255) NOT NULL,
);

INSERT INTO
    users(f_name, l_name)

VALUES
    ('Austin', 'Wong'),
    ('Peter', 'Kupchick');

CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    users_id INTEGER NOT NULL,

    FOREIGN KEY (users_id) REFERENCES users(id)
);

INSERT INTO
    questions(title, body, users_id)

VALUES
    ('a/A Tuition', 'How much is it?', (SELECT id FROM users WHERE f_name = 'Austin'))
    ('Graduation Rate', 'What percentage of students graduate?', (SELECT id FROM users WHERE l_name = 'Kupchick'))

CREATE TABLE question_follows(
    id INTEGER PRIMARY KEY,
    users_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,

    FOREIGN KEY (users_id) REFERENCES users(id)
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);
INSERT INTO
    question_follows (users_id, questions_id)

VALUES
    ((SELECT id FROM users WHERE f_name = 'Austin'),(SELECT id FROM questions WHERE users_id = 1))
    ((SELECT id FROM users WHERE l_name = 'Kupchick'),(SELECT id FROM questions WHERE users_id = 2))


CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER, 
    users_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

INSERT INTO
    replies(question_id, parent_reply_id, users_id, body)

VALUES
    ((SELECT id FROM questions WHERE title = "a/A Tuition"),
    NULL,
    1,"A lot don't worry about it")
    (2,NULL,2,"100%")

CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    users_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,

    FOREIGN KEY (users_id) REFERENCES users(id)
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);

INSERT INTO
    question_likes (users_id, questions_id)
VALUES
    (
    (SELECT id FROM users WHERE f_name = 'Austin'),
    (SELECT id, FROM questions WHERE title = 'a/A Tuition')
    );