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

CREATE TABLE "address" (
  "id" bigserial PRIMARY KEY,
  "passenger_id" bigint NOT NULL,
  "detail" varchar UNIQUE NOT NULL,
  "house_number" varchar NOT NULL DEFAULT 'none',
  "street" varchar NOT NULL DEFAULT 'none',
  "ward" varchar NOT NULL,
  "district" varchar NOT NULL,
  "city" varchar NOT NULL,
  "latitude" float8 NOT NULL,
  "longitude" float8 NOT NULL
);

CREATE INDEX ON "passenger" ("name");

CREATE INDEX ON "passenger" ("phone");

CREATE INDEX ON "address" ("detail");

CREATE INDEX ON "address" ("passenger_id");

CREATE INDEX ON "address" ("latitude", "longitude");

ALTER TABLE "address" ADD FOREIGN KEY ("passenger_id") REFERENCES "passenger" ("id");
