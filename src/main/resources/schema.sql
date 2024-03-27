DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS category;

CREATE TABLE category
(
    id    SERIAL PRIMARY KEY,
    title VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE author
(
    id            SERIAL PRIMARY KEY,
    name          VARCHAR(100) UNIQUE NOT NULL,
    year_of_birth INT                 NOT NULL,
    biography     VARCHAR(1000)       NOT NULL
);

CREATE TABLE users
(
    id       SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100)        NOT NULL,
    email    VARCHAR(50) UNIQUE NOT NULL,
    role     varchar(5)         NOT NULL
);

CREATE TABLE book
(
    id              SERIAL PRIMARY KEY,
    title           VARCHAR(100) UNIQUE               NOT NULL,
    author_id       INT                               NOT NULL,
    description     VARCHAR(500)                      NOT NULL,
    year_of_writing INT CHECK ( year_of_writing > 0 ) NOT NULL,
    FOREIGN KEY (author_id) REFERENCES author (id)
);

CREATE TABLE wishlist
(
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (book_id) REFERENCES book (id)
);

INSERT INTO category(title)
VALUES ('Fiction'),
       ('Mystery'),
       ('Non-fiction'),
       ('Memoir'),
       ('Literary fiction'),
       ('Women''s fiction'),
       ('Self-help book'),
       ('Children''s literature'),
       ('True crime'),
       ('Humor'),
       ('Action fiction'),
       ('Social science'),
       ('New adult fiction'),
       ('Satire'),
       ('Bildungsroman'),
       ('Crime fiction'),
       ('Narrative'),
       ('Science fiction'),
       ('Historical fantasy'),
       ('Genre fiction'),
       ('Thriller'),
       ('Graphic novel'),
       ('Young adult literature'),
       ('Essay'),
       ('Adventure fiction'),
       ('Science'),
       ('Contemporary romance'),
       ('Magical Realism'),
       ('Speculative fiction'),
       ('Contemporary literature'),
       ('Romance'),
       ('Detective fiction'),
       ('Fan fiction'),
       ('Novel'),
       ('Historical fiction'),
       ('Romance novel'),
       ('Short Story'),
       ('History'),
       ('Biography'),
       ('Fantasy'),
       ('Fantasy fiction'),
       ('Poetry'),
       ('Horror fiction'),
       ('Autobiography'),
       ('Western fiction'),
       ('Historical romance'),
       ('Cookbook'),
       ('Fairy tale'),
       ('Travel literature'),
       ('Coming-of-age story');