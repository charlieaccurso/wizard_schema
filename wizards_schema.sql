CREATE TABLE "wizards" (
  "id" int PRIMARY KEY,
  "first_name" varchar(20),
  "last_name" varchar(20),
  "email" varchar(255),
  "realm_id" int
);

CREATE TABLE "apprentices" (
  "id" int PRIMARY KEY,
  "first_name" varchar(50),
  "last_name" varchar(50),
  "wizard_id" int
);

CREATE TABLE "powers" (
  "id" int PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "realms" (
  "id" int PRIMARY KEY,
  "name" varchar(50)
);

ALTER TABLE "apprentices" ADD FOREIGN KEY ("wizard_id") REFERENCES "wizards" ("id");

CREATE TABLE "wizards_powers" (
  "wizards_id" int,
  "powers_id" int,
  PRIMARY KEY ("wizards_id", "powers_id")
);

ALTER TABLE "wizards_powers" ADD FOREIGN KEY ("wizards_id") REFERENCES "wizards" ("id");

ALTER TABLE "wizards_powers" ADD FOREIGN KEY ("powers_id") REFERENCES "powers" ("id");


ALTER TABLE "realms" ADD FOREIGN KEY ("id") REFERENCES "wizards" ("realm_id");

CREATE TABLE "apprentices_powers" (
  "apprentices_id" int,
  "powers_id" int,
  PRIMARY KEY ("apprentices_id", "powers_id")
);

ALTER TABLE "apprentices_powers" ADD FOREIGN KEY ("apprentices_id") REFERENCES "apprentices" ("id");

ALTER TABLE "apprentices_powers" ADD FOREIGN KEY ("powers_id") REFERENCES "powers" ("id");


ALTER TABLE "apprentices" ADD FOREIGN KEY ("id") REFERENCES "realms" ("id");
