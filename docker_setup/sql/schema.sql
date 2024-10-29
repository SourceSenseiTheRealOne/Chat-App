CREATE TABLE "user"
(
    id          SERIAL PRIMARY KEY,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP NOT NULL,
    name        VARCHAR(500)                           NOT NULL,
    email       VARCHAR(200)                           NOT NULL,
    password    VARCHAR(500)                           NOT NULL
);

CREATE UNIQUE INDEX "user_email_key"
    ON "user" (email);

CREATE TABLE "chat"
(
    id          SERIAL PRIMARY KEY,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "ownerId"   INT                                    NOT NULL REFERENCES "user"
        ON UPDATE CASCADE ON DELETE CASCADE,
    name        VARCHAR(1000)                          NOT NULL
);

CREATE TABLE "message"
(
    id          SERIAL PRIMARY KEY,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "chatId"    INT                                    NOT NULL REFERENCES "chat"
        ON UPDATE CASCADE ON DELETE CASCADE,
    type        VARCHAR(100)                           NOT NULL,
    message     TEXT                                   NOT NULL
);


-- BASICS


-- INSERT NEW USER
-- INSERT INTO "user" (name, email, password)
-- VALUES ('John Doe', 'john@example.com', 'securePassword');


-- STARTING NEW CHAT
-- INSERT INTO "chat" ("ownerId", name)
-- VALUES (1, 'LLM fun');


-- CREATING A NEW MESSAGE IN CHAT
-- INSERT INTO "message" ("chatId", type, message)
-- VALUES (1, 'text', 'Welcome to my tech corner!');


-- RETRIEVING ALL USERS
-- SELECT * FROM "user";


-- RETRIEVE ALL MESSAGES FROM A SPECIFIC CHAT
-- SELECT message FROM "message" WHERE "chatId" = 1;


-- UPDATING USER EMAIL
-- UPDATE "user" SET email = 'new.jane.doe@example.com' WHERE id = 1;


-- REMOVING A CHAT
-- DELETE FROM "chat" WHERE id = 1;