var axios = require('axios');

module.exports = {
  authenticate: function(email, password) {
    let data = { auth: { email: email, password: password } };
    return axios.post('/api/v1/user/token', data)
      .then((response) => response.data.jwt)
      .catch((error) => console.log(error, 'auth ERRor!!!1!111'))
  }
}