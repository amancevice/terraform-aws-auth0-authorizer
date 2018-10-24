const { authenticate } = require('lambda-auth0-authenticator/lib');

exports.handler = (event, context, callback) => {
  authenticate(event).then((res) => {
    callback(null, res);
  }).catch((err) => {
    console.error(err);
    callback('Unauthorized');
  });
};
