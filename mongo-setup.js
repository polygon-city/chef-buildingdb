// mongo shortcuts replaced with valid js

// use test;
db = db.getSiblingDB('test');

// test.db.dropDatabase();
db.dropDatabase();

db.buildings.ensureIndex( { location: "2dsphere" } );
db.createUser(
   {
     user: "user",
     pwd: "password",
     roles: [ "readWrite", "dbAdmin" ]
   }
);
