BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "archived_conversation" (
    "id" bigserial PRIMARY KEY,
    "userId" uuid NOT NULL,
    "archivedUserId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "archived_conversation_unique" ON "archived_conversation" USING btree ("userId", "archivedUserId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "blocked_user" (
    "id" bigserial PRIMARY KEY,
    "blockerId" uuid NOT NULL,
    "blockedId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "blocked_user_unique" ON "blocked_user" USING btree ("blockerId", "blockedId");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "chat_message" ADD COLUMN "linkPreviewUrl" text;
ALTER TABLE "chat_message" ADD COLUMN "linkPreviewTitle" text;
ALTER TABLE "chat_message" ADD COLUMN "linkPreviewDescription" text;
ALTER TABLE "chat_message" ADD COLUMN "linkPreviewImageUrl" text;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "muted_conversation" (
    "id" bigserial PRIMARY KEY,
    "userId" uuid NOT NULL,
    "mutedUserId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "muted_conversation_unique" ON "muted_conversation" USING btree ("userId", "mutedUserId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "pinned_conversation" (
    "id" bigserial PRIMARY KEY,
    "userId" uuid NOT NULL,
    "pinnedUserId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "pinned_conversation_unique" ON "pinned_conversation" USING btree ("userId", "pinnedUserId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "starred_message" (
    "id" bigserial PRIMARY KEY,
    "userId" uuid NOT NULL,
    "messageId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "starred_message_unique" ON "starred_message" USING btree ("userId", "messageId");


--
-- MIGRATION VERSION FOR vibe
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('vibe', '20261013224105231', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261013224105231', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260129180959368', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129180959368', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260129181112269', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129181112269', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260213194423028', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260213194423028', "timestamp" = now();


COMMIT;
