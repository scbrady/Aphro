-- --------------------------------------------------
-- Entity Designer DDL Script for Oracle database
-- --------------------------------------------------
-- Date Created: 11/2/2015 9:48:12 AM
-- Generated from EDMX file: C:\Code\Project Class\Aphro\Aphro\Aphro\Models\DataModel.edmx
-- --------------------------------------------------

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

 ALTER TABLE "TEAMAPHRO"."events" DROP CONSTRAINT "FK_event_typesevents" CASCADE;

 ALTER TABLE "TEAMAPHRO"."event_seating" DROP CONSTRAINT "FK_eventsevent_seating" CASCADE;

 ALTER TABLE "TEAMAPHRO"."group_requests" DROP CONSTRAINT "FK_eventsgroup_requests" CASCADE;

 ALTER TABLE "TEAMAPHRO"."people" DROP CONSTRAINT "FK_guestspeople" CASCADE;

 ALTER TABLE "TEAMAPHRO"."events" DROP CONSTRAINT "FK_locationsevents" CASCADE;

 ALTER TABLE "TEAMAPHRO"."seats" DROP CONSTRAINT "FK_locationsseats" CASCADE;

 ALTER TABLE "TEAMAPHRO"."event_seating" DROP CONSTRAINT "FK_peopleevent_seating" CASCADE;

 ALTER TABLE "TEAMAPHRO"."group_requests" DROP CONSTRAINT "FK_peoplegroup_requests" CASCADE;

 ALTER TABLE "TEAMAPHRO"."group_requests" DROP CONSTRAINT "FK_peoplegroup_requests1" CASCADE;

 ALTER TABLE "TEAMAPHRO"."events" DROP CONSTRAINT "FK_seasonsevents" CASCADE;
 ALTER TABLE "TEAMAPHRO"."people" DROP CONSTRAINT "FK_seasonspeople" CASCADE;

 ALTER TABLE "TEAMAPHRO"."event_seating" DROP CONSTRAINT "FK_seatsevent_seating" CASCADE;
-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

 DROP TABLE "TEAMAPHRO"."event_seating";

 DROP TABLE "TEAMAPHRO"."event_types";

 DROP TABLE "TEAMAPHRO"."events";

 DROP TABLE "TEAMAPHRO"."group_requests";

 DROP TABLE "TEAMAPHRO"."guests";

 DROP TABLE "TEAMAPHRO"."locations";

 DROP TABLE "TEAMAPHRO"."people";

 DROP TABLE "TEAMAPHRO"."seasons";

 DROP TABLE "TEAMAPHRO"."seats";

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'event_types'
CREATE TABLE "TEAMAPHRO"."event_types" (
   "event_type_id" NUMBER(10) NOT NULL,
   "name" NVARCHAR2(20) NOT NULL
);

-- Creating table 'locations'
CREATE TABLE "TEAMAPHRO"."locations" (
   "location_id" NUMBER(10) NOT NULL,
   "name" NVARCHAR2(20) NOT NULL,
   "total_seats" NUMBER(10) NOT NULL
);

-- Creating table 'seats'
CREATE TABLE "TEAMAPHRO"."seats" (
   "seat_id" NUMBER(10) NOT NULL,
   "location_id" NUMBER(10) NOT NULL,
   "is_balcony" NUMBER(1) NOT NULL,
   "is_prime" NUMBER(1) NOT NULL,
   "seat_row" NVARCHAR2(3) NOT NULL,
   "seat_section" NVARCHAR2(3) NOT NULL,
   "seat_number" NUMBER(10) NOT NULL
);

-- Creating table 'events'
CREATE TABLE "TEAMAPHRO"."events" (
   "event_id" NUMBER(10) NOT NULL,
   "location_id" NUMBER(10) NOT NULL,
   "event_type_id" NUMBER(10) NOT NULL,
   "season_id" NUMBER(10) NOT NULL,
   "name" NVARCHAR2(20) NOT NULL,
   "description" NVARCHAR2(20) NOT NULL,
   "date_start" DATE NOT NULL,
   "date_end" DATE NOT NULL,
   "regular_price" NUMBER(38) NOT NULL,
   "prime_price" NUMBER(38) NOT NULL
);

-- Creating table 'event_seating'
CREATE TABLE "TEAMAPHRO"."event_seating" (
   "seat_id" NUMBER(10) NOT NULL,
   "event_id" NUMBER(10) NOT NULL,
   "person_id" NUMBER(10) NOT NULL,
   "reserved_type" NVARCHAR2(20) NOT NULL
);

-- Creating table 'group_requests'
CREATE TABLE "TEAMAPHRO"."group_requests" (
   "event_id" NUMBER(10) NOT NULL,
   "requester_id" NUMBER(10) NOT NULL,
   "requested_id" NUMBER(10) NOT NULL,
   "has_accepted" NUMBER(1) NOT NULL
);

-- Creating table 'people'
CREATE TABLE "TEAMAPHRO"."people" (
   "person_id" NUMBER(10) NOT NULL,
   "student_id" NVARCHAR2(20) NOT NULL,
   "teacher_id" NVARCHAR2(20) NOT NULL,
   "guest_id" NUMBER(10) NOT NULL,
   "season_id" NUMBER(10) NOT NULL
);

-- Creating table 'seasons'
CREATE TABLE "TEAMAPHRO"."seasons" (
   "season_id" NUMBER(10) NOT NULL,
   "name" NVARCHAR2(20) NOT NULL,
   "created_at" DATE NOT NULL
);

-- Creating table 'guests'
CREATE TABLE "TEAMAPHRO"."guests" (
   "guest_id" NUMBER(10) NOT NULL,
   "first_name" NVARCHAR2(20) NOT NULL,
   "last_name" NVARCHAR2(20) NOT NULL,
   "email" NVARCHAR2(20) NOT NULL,
   "password" NVARCHAR2(50) NOT NULL,
   "salt" NVARCHAR2(50) NOT NULL
);


-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on "event_type_id"in table 'event_types'
ALTER TABLE "TEAMAPHRO"."event_types"
ADD CONSTRAINT "PK_event_types"
   PRIMARY KEY ("event_type_id" )
   ENABLE
   VALIDATE;


-- Creating primary key on "location_id"in table 'locations'
ALTER TABLE "TEAMAPHRO"."locations"
ADD CONSTRAINT "PK_locations"
   PRIMARY KEY ("location_id" )
   ENABLE
   VALIDATE;


-- Creating primary key on "seat_id"in table 'seats'
ALTER TABLE "TEAMAPHRO"."seats"
ADD CONSTRAINT "PK_seats"
   PRIMARY KEY ("seat_id" )
   ENABLE
   VALIDATE;


-- Creating primary key on "event_id"in table 'events'
ALTER TABLE "TEAMAPHRO"."events"
ADD CONSTRAINT "PK_events"
   PRIMARY KEY ("event_id" )
   ENABLE
   VALIDATE;


-- Creating primary key on "seat_id", "event_id"in table 'event_seating'
ALTER TABLE "TEAMAPHRO"."event_seating"
ADD CONSTRAINT "PK_event_seating"
   PRIMARY KEY ("seat_id", "event_id" )
   ENABLE
   VALIDATE;


-- Creating primary key on "event_id", "requester_id", "requested_id"in table 'group_requests'
ALTER TABLE "TEAMAPHRO"."group_requests"
ADD CONSTRAINT "PK_group_requests"
   PRIMARY KEY ("event_id", "requester_id", "requested_id" )
   ENABLE
   VALIDATE;


-- Creating primary key on "person_id"in table 'people'
ALTER TABLE "TEAMAPHRO"."people"
ADD CONSTRAINT "PK_people"
   PRIMARY KEY ("person_id" )
   ENABLE
   VALIDATE;


-- Creating primary key on "season_id"in table 'seasons'
ALTER TABLE "TEAMAPHRO"."seasons"
ADD CONSTRAINT "PK_seasons"
   PRIMARY KEY ("season_id" )
   ENABLE
   VALIDATE;


-- Creating primary key on "guest_id"in table 'guests'
ALTER TABLE "TEAMAPHRO"."guests"
ADD CONSTRAINT "PK_guests"
   PRIMARY KEY ("guest_id" )
   ENABLE
   VALIDATE;


-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on "event_type_id" in table 'events'
ALTER TABLE "TEAMAPHRO"."events"
ADD CONSTRAINT "FK_event_typesevents"
   FOREIGN KEY ("event_type_id")
   REFERENCES "TEAMAPHRO"."event_types"
       ("event_type_id")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_event_typesevents'
CREATE INDEX "IX_FK_event_typesevents"
ON "TEAMAPHRO"."events"
   ("event_type_id");

-- Creating foreign key on "location_id" in table 'events'
ALTER TABLE "TEAMAPHRO"."events"
ADD CONSTRAINT "FK_locationsevents"
   FOREIGN KEY ("location_id")
   REFERENCES "TEAMAPHRO"."locations"
       ("location_id")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_locationsevents'
CREATE INDEX "IX_FK_locationsevents"
ON "TEAMAPHRO"."events"
   ("location_id");

-- Creating foreign key on "location_id" in table 'seats'
ALTER TABLE "TEAMAPHRO"."seats"
ADD CONSTRAINT "FK_locationsseats"
   FOREIGN KEY ("location_id")
   REFERENCES "TEAMAPHRO"."locations"
       ("location_id")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_locationsseats'
CREATE INDEX "IX_FK_locationsseats"
ON "TEAMAPHRO"."seats"
   ("location_id");

-- Creating foreign key on "season_id" in table 'events'
ALTER TABLE "TEAMAPHRO"."events"
ADD CONSTRAINT "FK_seasonsevents"
   FOREIGN KEY ("season_id")
   REFERENCES "TEAMAPHRO"."seasons"
       ("season_id")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_seasonsevents'
CREATE INDEX "IX_FK_seasonsevents"
ON "TEAMAPHRO"."events"
   ("season_id");

-- Creating foreign key on "person_id" in table 'event_seating'
ALTER TABLE "TEAMAPHRO"."event_seating"
ADD CONSTRAINT "FK_peopleevent_seating"
   FOREIGN KEY ("person_id")
   REFERENCES "TEAMAPHRO"."people"
       ("person_id")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_peopleevent_seating'
CREATE INDEX "IX_FK_peopleevent_seating"
ON "TEAMAPHRO"."event_seating"
   ("person_id");

-- Creating foreign key on "requested_id" in table 'group_requests'
ALTER TABLE "TEAMAPHRO"."group_requests"
ADD CONSTRAINT "FK_peoplegroup_requests"
   FOREIGN KEY ("requested_id")
   REFERENCES "TEAMAPHRO"."people"
       ("person_id")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_peoplegroup_requests'
CREATE INDEX "IX_FK_peoplegroup_requests"
ON "TEAMAPHRO"."group_requests"
   ("requested_id");

-- Creating foreign key on "seat_id" in table 'event_seating'
ALTER TABLE "TEAMAPHRO"."event_seating"
ADD CONSTRAINT "FK_seatsevent_seating"
   FOREIGN KEY ("seat_id")
   REFERENCES "TEAMAPHRO"."seats"
       ("seat_id")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_seatsevent_seating'
CREATE INDEX "IX_FK_seatsevent_seating"
ON "TEAMAPHRO"."event_seating"
   ("seat_id");

-- Creating foreign key on "event_id" in table 'event_seating'
ALTER TABLE "TEAMAPHRO"."event_seating"
ADD CONSTRAINT "FK_eventsevent_seating"
   FOREIGN KEY ("event_id")
   REFERENCES "TEAMAPHRO"."events"
       ("event_id")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_eventsevent_seating'
CREATE INDEX "IX_FK_eventsevent_seating"
ON "TEAMAPHRO"."event_seating"
   ("event_id");

-- Creating foreign key on "event_id" in table 'group_requests'
ALTER TABLE "TEAMAPHRO"."group_requests"
ADD CONSTRAINT "FK_eventsgroup_requests"
   FOREIGN KEY ("event_id")
   REFERENCES "TEAMAPHRO"."events"
       ("event_id")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_eventsgroup_requests'
CREATE INDEX "IX_FK_eventsgroup_requests"
ON "TEAMAPHRO"."group_requests"
   ("event_id");

-- Creating foreign key on "requester_id" in table 'group_requests'
ALTER TABLE "TEAMAPHRO"."group_requests"
ADD CONSTRAINT "FK_peoplegroup_requests1"
   FOREIGN KEY ("requester_id")
   REFERENCES "TEAMAPHRO"."people"
       ("person_id")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_peoplegroup_requests1'
CREATE INDEX "IX_FK_peoplegroup_requests1"
ON "TEAMAPHRO"."group_requests"
   ("requester_id");

-- Creating foreign key on "season_id" in table 'people'
ALTER TABLE "TEAMAPHRO"."people"
ADD CONSTRAINT "FK_seasonspeople"
   FOREIGN KEY ("season_id")
   REFERENCES "TEAMAPHRO"."seasons"
       ("season_id")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_seasonspeople'
CREATE INDEX "IX_FK_seasonspeople"
ON "TEAMAPHRO"."people"
   ("season_id");

-- Creating foreign key on "guest_id" in table 'people'
ALTER TABLE "TEAMAPHRO"."people"
ADD CONSTRAINT "FK_guestspeople"
   FOREIGN KEY ("guest_id")
   REFERENCES "TEAMAPHRO"."guests"
       ("guest_id")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_guestspeople'
CREATE INDEX "IX_FK_guestspeople"
ON "TEAMAPHRO"."people"
   ("guest_id");

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
