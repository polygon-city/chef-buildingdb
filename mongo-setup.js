// Create user
db.createUser(
  {
    user: "user",
    pwd: "password",
    roles: [ "readWrite", "dbAdmin" ]
  }
);

// Create indexes
db.users.ensureIndex( { email: 1 }, { unique: true } );
db.users.ensureIndex( { username: 1 }, { unique: true } );
db.buildings.ensureIndex( { "slug.id": 1 }, { unique: true } );
db.buildings.ensureIndex( { location: "2dsphere" } );