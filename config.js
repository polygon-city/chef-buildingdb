module.exports = {
  "db": {
    "url": "mongodb://user:password@localhost/building-database"
  },
  "email": {
    "report": {
      "fromAddress": "noreply@example.com",
      "subject": "Building report"
    },
    "reset": {
      "fromAddress": "noreply@example.com",
      "subject": "Password reset"
    }
  },
  "session": {
    "secret": "secret"
  }
};
