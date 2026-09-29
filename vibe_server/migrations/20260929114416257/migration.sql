BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "device_token" (
    "id" bigserial PRIMARY KEY,
    "authUserId" uuid NOT NULL,
    "token" text NOT NULL,
    "platform" text NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "device_token_token_unique" ON "device_token" USING btree ("token");
CREATE INDEX "device_token_auth_user_idx" ON "device_token" USING btree ("authUserId");


--
-- MIGRATION VERSION FOR vibe
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('vibe', '20260929114416257', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260929114416257', "timestamp" = now();

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
