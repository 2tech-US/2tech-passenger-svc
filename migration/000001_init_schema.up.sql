CREATE TABLE "passenger" (
  "id" bigserial PRIMARY KEY,
  "phone" varchar UNIQUE NOT NULL,
  "hashed_password" varchar NOT NULL,
  "name" varchar NOT NULL,
  "date_of_birth" date,
  "avatar_url" varchar,
  "verified" boolean NOT NULL DEFAULT false,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "passenger" ("name");

CREATE INDEX ON "passenger" ("phone");
