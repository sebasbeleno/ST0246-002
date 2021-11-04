-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/67UvCc
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "LearningBuilding" (
    "buildingID" int   NOT NULL,
    "buildingNumber" int   NOT NULL,
    "cratedBy" int   NOT NULL,
    CONSTRAINT "pk_LearningBuilding" PRIMARY KEY (
        "buildingID"
     ),
    CONSTRAINT "uc_LearningBuilding_buildingNumber" UNIQUE (
        "buildingNumber"
    )
);

CREATE TABLE "Elevator" (
    "elevatorID" int   NOT NULL,
    "capacity" INT   NOT NULL,
    "buildingID" int   NOT NULL,
    CONSTRAINT "pk_Elevator" PRIMARY KEY (
        "elevatorID"
     ),
    CONSTRAINT "uc_Elevator_buildingID" UNIQUE (
        "buildingID"
    )
);

CREATE TABLE "Floor" (
    "floorID" int   NOT NULL,
    "buildingID" int   NOT NULL,
    "floorNumber" int   NOT NULL,
    CONSTRAINT "pk_Floor" PRIMARY KEY (
        "floorID"
     ),
    CONSTRAINT "uc_Floor_buildingID" UNIQUE (
        "buildingID"
    )
);

CREATE TABLE "Classroom" (
    "classroomID" int   NOT NULL,
    "floorID" int   NOT NULL,
    "capacity" int   NOT NULL,
    "numberOfchairs" int   NOT NULL,
    "classroomNumber" int   NOT NULL,
    "classSchedules" json   NOT NULL,
    CONSTRAINT "pk_Classroom" PRIMARY KEY (
        "classroomID"
     )
);

CREATE TABLE "Locker" (
    "lockerID" int   NOT NULL,
    "floorID" int   NOT NULL,
    "ownerID" int   NOT NULL,
    "itsBusy" boolean   NOT NULL,
    "obtainmentDate" date   NOT NULL,
    "expirationDate" date   NOT NULL,
    CONSTRAINT "pk_Locker" PRIMARY KEY (
        "lockerID"
     )
);

CREATE TABLE "VendingMachines" (
    "machineID" int   NOT NULL,
    "floorID" int   NOT NULL,
    "capacity" int   NOT NULL,
    CONSTRAINT "pk_VendingMachines" PRIMARY KEY (
        "machineID"
     )
);

CREATE TABLE "Bathroom" (
    "bathroomID" int   NOT NULL,
    "floorID" int   NOT NULL,
    "sex" string   NOT NULL,
    "capacity" int   NOT NULL,
    CONSTRAINT "pk_Bathroom" PRIMARY KEY (
        "bathroomID"
     )
);

CREATE TABLE "Administrator" (
    "AdminID" int   NOT NULL,
    "Name" String   NOT NULL,
    "password" String   NOT NULL,
    "username" String   NOT NULL,
    CONSTRAINT "pk_Administrator" PRIMARY KEY (
        "AdminID"
     ),
    CONSTRAINT "uc_Administrator_username" UNIQUE (
        "username"
    )
);

CREATE TABLE "Student" (
    "StudentID" int   NOT NULL,
    "name" String   NOT NULL,
    "faculty" String   NOT NULL,
    -- gender identity
    "gender" string   NOT NULL,
    -- biological sex
    "sex" string   NOT NULL,
    "age" int   NOT NULL,
    -- undergraduate, postgraduate, etc
    "level" string   NOT NULL,
    CONSTRAINT "pk_Student" PRIMARY KEY (
        "StudentID"
     )
);

ALTER TABLE "LearningBuilding" ADD CONSTRAINT "fk_LearningBuilding_cratedBy" FOREIGN KEY("cratedBy")
REFERENCES "Administrator" ("AdminID");

ALTER TABLE "Elevator" ADD CONSTRAINT "fk_Elevator_buildingID" FOREIGN KEY("buildingID")
REFERENCES "LearningBuilding" ("buildingID");

ALTER TABLE "Floor" ADD CONSTRAINT "fk_Floor_buildingID" FOREIGN KEY("buildingID")
REFERENCES "LearningBuilding" ("buildingID");

ALTER TABLE "Classroom" ADD CONSTRAINT "fk_Classroom_floorID" FOREIGN KEY("floorID")
REFERENCES "Floor" ("floorID");

ALTER TABLE "Locker" ADD CONSTRAINT "fk_Locker_floorID" FOREIGN KEY("floorID")
REFERENCES "Floor" ("floorID");

ALTER TABLE "Locker" ADD CONSTRAINT "fk_Locker_ownerID" FOREIGN KEY("ownerID")
REFERENCES "Student" ("StudentID");

ALTER TABLE "VendingMachines" ADD CONSTRAINT "fk_VendingMachines_floorID" FOREIGN KEY("floorID")
REFERENCES "Floor" ("floorID");

ALTER TABLE "Bathroom" ADD CONSTRAINT "fk_Bathroom_floorID" FOREIGN KEY("floorID")
REFERENCES "Floor" ("floorID");

