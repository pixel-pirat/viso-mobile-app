BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "post" (
    "id" bigserial PRIMARY KEY,
    "authorId" uuid NOT NULL,
    "text" text NOT NULL,
    "mediaUrls" json NOT NULL,
    "mediaType" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "likeCount" bigint NOT NULL DEFAULT 0,
    "commentCount" bigint NOT NULL DEFAULT 0,
    "viewCount" bigint NOT NULL DEFAULT 0
);

-- Indexes
CREATE INDEX "post_created_idx" ON "post" USING btree ("createdAt");
CREATE INDEX "post_author_idx" ON "post" USING btree ("authorId", "createdAt");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "post_like" (
    "id" bigserial PRIMARY KEY,
    "postId" bigint NOT NULL,
    "userId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "post_like_unique" ON "post_like" USING btree ("postId", "userId");


--
-- MIGRATION VERSION FOR vibe
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('vibe', '20260930164820763', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260930164820763', "timestamp" = now();

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
