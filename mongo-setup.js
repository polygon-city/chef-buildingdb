// Create indexes
db.users.ensureIndex( { email: 1 }, { unique: true } );
db.users.ensureIndex( { username: 1 }, { unique: true } );
db.buildings.ensureIndex( { slug: 1 }, { unique: true } );
db.buildings.ensureIndex( { location: "2dsphere" } );