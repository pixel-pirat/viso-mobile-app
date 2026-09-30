BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "story" (
    "id" bigserial PRIMARY KEY,
    "authorId" uuid NOT NULL,
    "mediaUrl" text NOT NULL,
    "mediaType" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expiresAt" timestamp without time zone NOT NULL,
    "viewCount" bigint NOT NULL DEFAULT 0
);

-- Indexes
CREATE INDEX "story_author_idx" ON "story" USING btree ("authorId", "createdAt");
CREATE INDEX "story_expires_idx" ON "story" USING btree ("expiresAt");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "story_view" (
    "id" bigserial PRIMARY KEY,
    "storyId" bigint NOT NULL,
    "viewerId" uuid NOT NULL,
    "viewedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "story_view_unique" ON "story_view" USING btree ("storyId", "viewerId");


--
-- MIGRATION VERSION FOR vibe
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('vibe', '20260930200503908', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260930200503908', "timestamp" = now();

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
