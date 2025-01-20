function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    apiUrl: 'https://conduit-api.bondaracademy.com/api/'
  }
  if (env == 'dev') {
    config.userEmail = 'rompecocos7@gmail.com'
    config.userPassword = '123456'
  } else if (env == 'qa') {
    config.userEmail = 'karate2@gmail.com'
    config.userPassword = 'Karate456'
  }

  //this is to get the token from the response
  var accessToken = karate.callSingle('classpath:helpers/CreateToken.feature', config).authToken;
  karate.configure('headers', {Authorization: 'Token ' + accessToken});
  return config;
}