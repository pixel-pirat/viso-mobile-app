BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "chat_message" ADD COLUMN "mediaUrl" text;
ALTER TABLE "chat_message" ADD COLUMN "mediaType" text;
ALTER TABLE "chat_message" ADD COLUMN "replyToMessageId" bigint;
ALTER TABLE "chat_message" ADD COLUMN "deliveredAt" timestamp without time zone;
ALTER TABLE "chat_message" ADD COLUMN "editedAt" timestamp without time zone;
ALTER TABLE "chat_message" ADD COLUMN "deletedAt" timestamp without time zone;
ALTER TABLE "chat_message" ADD COLUMN "hiddenForSender" timestamp without time zone;
ALTER TABLE "chat_message" ADD COLUMN "hiddenForRecipient" timestamp without time zone;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "message_reaction" (
    "id" bigserial PRIMARY KEY,
    "messageId" bigint NOT NULL,
    "userId" uuid NOT NULL,
    "emoji" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "message_reaction_unique" ON "message_reaction" USING btree ("messageId", "userId");


--
-- MIGRATION VERSION FOR vibe
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('vibe', '20261013215451844', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261013215451844', "timestamp" = now();

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
