module.exports = {
  "db": {
    "url": "mongodb://user:password@localhost/test"
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
