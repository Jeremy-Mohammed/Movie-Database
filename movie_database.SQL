/*
Created: 2021-09-22
Modified: 2021-10-09
Model: Lab4
Database: PostgreSQL 12
*/

-- Create tables section -------------------------------------------------

-- Table Movie

CREATE TABLE "Movie"
(
  "movie_title" Character varying NOT NULL,
  "ticket_id" Character varying NOT NULL,
  "awards_id" Character varying,
  "festival_id" Character varying,
  "release_date" Date NOT NULL,
  "rating" Bigint NOT NULL,
  "budget" Bigint,
  "gross" Bigint
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship20" ON "Movie" ("awards_id")
;

CREATE INDEX "IX_Relationship21" ON "Movie" ("festival_id")
;

ALTER TABLE "Movie" ADD CONSTRAINT "PK_Movie" PRIMARY KEY ("movie_title","ticket_id")
;

ALTER TABLE "Movie" ADD CONSTRAINT "release_date" UNIQUE ("release_date")
;

-- Table Actors

CREATE TABLE "Actors"
(
  "actor_id" UUID NOT NULL,
  "university_id" UUID,
  "location_id" UUID NOT NULL,
  "first_name" Character varying NOT NULL,
  "surname" Character varying NOT NULL,
  "date_of_birth" Date NOT NULL,
  "eye_colour" Character varying
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship39" ON "Actors" ("university_id")
;

CREATE INDEX "IX_Relationship8" ON "Actors" ("location_id")
;

ALTER TABLE "Actors" ADD CONSTRAINT "PK_Actors" PRIMARY KEY ("actor_id")
;

-- Table Movie_Actor

CREATE TABLE "Movie_Actor"
(
  "actor_id" UUID NOT NULL,
  "movie_title" Character varying NOT NULL,
  "ticket_id" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Movie_Actor" ADD CONSTRAINT "PK_Movie_Actor" PRIMARY KEY ("actor_id","movie_title","ticket_id")
;

-- Table Director

CREATE TABLE "Director"
(
  "director_id" UUID NOT NULL,
  "university_id" UUID,
  "location_id" UUID NOT NULL,
  "first_name" Character varying NOT NULL,
  "surname" Character varying NOT NULL,
  "date_of_birth" Date NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship40" ON "Director" ("university_id")
;

CREATE INDEX "IX_Relationship9" ON "Director" ("location_id")
;

ALTER TABLE "Director" ADD CONSTRAINT "PK_Director" PRIMARY KEY ("director_id")
;

-- Table University

CREATE TABLE "University"
(
  "university_id" UUID NOT NULL,
  "num_of_students" Bigint NOT NULL,
  "is_private" Boolean NOT NULL,
  "representative_colour" Character varying NOT NULL,
  "department" Character varying NOT NULL,
  "description" Character varying
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "University" ADD CONSTRAINT "PK_University" PRIMARY KEY ("university_id")
;

-- Table Movie_Type

CREATE TABLE "Movie_Type"
(
  "genre" Character varying NOT NULL,
  "genre_description" Character varying
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Movie_Type" ADD CONSTRAINT "PK_Movie_Type" PRIMARY KEY ("genre")
;

-- Table Director_Movie

CREATE TABLE "Director_Movie"
(
  "director_id" UUID NOT NULL,
  "movie_title" Character varying NOT NULL,
  "ticket_id" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Director_Movie" ADD CONSTRAINT "PK_Director_Movie" PRIMARY KEY ("director_id","movie_title","ticket_id")
;

-- Table Actor_Movie

CREATE TABLE "Actor_Movie"
(
  "actor_id" UUID NOT NULL,
  "movie_title" Character varying NOT NULL,
  "ticket_id" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Actor_Movie" ADD CONSTRAINT "PK_Actor_Movie" PRIMARY KEY ("actor_id","movie_title","ticket_id")
;

-- Table Location

CREATE TABLE "Location"
(
  "location_id" UUID NOT NULL,
  "city_name" Bigint NOT NULL,
  "country_name" Bigint NOT NULL,
  "state_name" Bigint NOT NULL,
  "postal_code" Bigint NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Location" ADD CONSTRAINT "PK_Location" PRIMARY KEY ("location_id")
;

-- Table Movie_Movie_Type

CREATE TABLE "Movie_Movie_Type"
(
  "movie_title" Character varying NOT NULL,
  "genre" Character varying NOT NULL,
  "ticket_id" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Movie_Movie_Type" ADD CONSTRAINT "PK_Movie_Movie_Type" PRIMARY KEY ("movie_title","genre","ticket_id")
;

-- Table Cinema

CREATE TABLE "Cinema"
(
  "cinema_id" UUID NOT NULL,
  "location_id" UUID,
  "cinema_name" Character varying NOT NULL,
  "cinema_website" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship14" ON "Cinema" ("location_id")
;

ALTER TABLE "Cinema" ADD CONSTRAINT "PK_Cinema" PRIMARY KEY ("cinema_id")
;

-- Table Cinema_Movie

CREATE TABLE "Cinema_Movie"
(
  "movie_title" Character varying NOT NULL,
  "cinema_id" UUID NOT NULL,
  "ticket_id" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Cinema_Movie" ADD CONSTRAINT "PK_Cinema_Movie" PRIMARY KEY ("movie_title","cinema_id","ticket_id")
;

-- Table Tickets

CREATE TABLE "Tickets"
(
  "ticket_id" Character varying NOT NULL,
  "price" Money NOT NULL,
  "showtime" Time NOT NULL,
  "date" Date NOT NULL,
  "cinema_hall_type" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Tickets" ADD CONSTRAINT "PK_Tickets" PRIMARY KEY ("ticket_id")
;

-- Table Cinema_Tickets

CREATE TABLE "Cinema_Tickets"
(
  "ticket_id" Character varying NOT NULL,
  "cinema_id" UUID NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Cinema_Tickets" ADD CONSTRAINT "PK_Cinema_Tickets" PRIMARY KEY ("ticket_id","cinema_id")
;

-- Table Awards

CREATE TABLE "Awards"
(
  "awards_id" Character varying NOT NULL,
  "award_company" Character varying NOT NULL,
  "category" Character varying NOT NULL,
  "award_year" Date NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Awards" ADD CONSTRAINT "PK_Awards" PRIMARY KEY ("awards_id")
;

-- Table Festivals

CREATE TABLE "Festivals"
(
  "festival_id" Character varying NOT NULL,
  "festival_name" Bigint NOT NULL,
  "festival_date" Date NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Festivals" ADD CONSTRAINT "PK_Festivals" PRIMARY KEY ("festival_id")
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE "Movie_Actor"
  ADD CONSTRAINT "Relationship6"
    FOREIGN KEY ("movie_title", "ticket_id")
    REFERENCES "Movie" ("movie_title", "ticket_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Movie_Actor"
  ADD CONSTRAINT "Relationship7"
    FOREIGN KEY ("actor_id")
    REFERENCES "Actors" ("actor_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Director_Movie"
  ADD CONSTRAINT "Directs in"
    FOREIGN KEY ("director_id")
    REFERENCES "Director" ("director_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Actor_Movie"
  ADD CONSTRAINT "Acts in"
    FOREIGN KEY ("actor_id")
    REFERENCES "Actors" ("actor_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Actor_Movie"
  ADD CONSTRAINT "Includes"
    FOREIGN KEY ("movie_title", "ticket_id")
    REFERENCES "Movie" ("movie_title", "ticket_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Director_Movie"
  ADD CONSTRAINT "Includes"
    FOREIGN KEY ("movie_title", "ticket_id")
    REFERENCES "Movie" ("movie_title", "ticket_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Actors"
  ADD CONSTRAINT "Graduated from"
    FOREIGN KEY ("university_id")
    REFERENCES "University" ("university_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Director"
  ADD CONSTRAINT "Graduated from"
    FOREIGN KEY ("university_id")
    REFERENCES "University" ("university_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Actors"
  ADD CONSTRAINT "born in"
    FOREIGN KEY ("location_id")
    REFERENCES "Location" ("location_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Director"
  ADD CONSTRAINT "born in"
    FOREIGN KEY ("location_id")
    REFERENCES "Location" ("location_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Movie_Movie_Type"
  ADD CONSTRAINT "type of"
    FOREIGN KEY ("movie_title", "ticket_id")
    REFERENCES "Movie" ("movie_title", "ticket_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Movie_Movie_Type"
  ADD CONSTRAINT "within"
    FOREIGN KEY ("genre")
    REFERENCES "Movie_Type" ("genre")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Cinema_Movie"
  ADD CONSTRAINT "projected in"
    FOREIGN KEY ("movie_title", "ticket_id")
    REFERENCES "Movie" ("movie_title", "ticket_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Cinema_Movie"
  ADD CONSTRAINT "previews"
    FOREIGN KEY ("cinema_id")
    REFERENCES "Cinema" ("cinema_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Cinema"
  ADD CONSTRAINT "located at"
    FOREIGN KEY ("location_id")
    REFERENCES "Location" ("location_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Movie"
  ADD CONSTRAINT "access"
    FOREIGN KEY ("ticket_id")
    REFERENCES "Tickets" ("ticket_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Cinema_Tickets"
  ADD CONSTRAINT "bought in"
    FOREIGN KEY ("ticket_id")
    REFERENCES "Tickets" ("ticket_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Cinema_Tickets"
  ADD CONSTRAINT "sells"
    FOREIGN KEY ("cinema_id")
    REFERENCES "Cinema" ("cinema_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Movie"
  ADD CONSTRAINT "given to"
    FOREIGN KEY ("awards_id")
    REFERENCES "Awards" ("awards_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Movie"
  ADD CONSTRAINT "played"
    FOREIGN KEY ("festival_id")
    REFERENCES "Festivals" ("festival_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

