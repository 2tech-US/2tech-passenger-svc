CREATE TABLE "passenger" (
  "id" bigserial PRIMARY KEY,
  "phone" varchar UNIQUE NOT NULL,
  "name" varchar NOT NULL,
  "date_of_birth" date,
  "avatar_url" varchar,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "passenger" ("name");

CREATE INDEX ON "passenger" ("phone");
