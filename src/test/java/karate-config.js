function fn() {
  var env = 'dev'; // get java system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev'; // a custom 'intelligent' default
  }
  var config = { // base config JSON
    webURL: 'https://opensource-demo.orangehrmlive.com/web/index.php/auth/login',
    apiBaseURLForPostFeature: 'https://jsonplaceholder.typicode.com',
    animalRestAPI: 'https://cat-fact.herokuapp.com/',
    apiBaseURLForReqresFeature: 'https://reqres.in/',
    conduitAPIEndpoint: 'https://conduit-api.bondaracademy.com',
    restFulBooker: 'https://restful-booker.herokuapp.com',
    goRest: 'https://gorest.co.in',
    authToken: 'Bearer 3345dbb24f1d49db4a482b6eeb11ae938320b54a6fa505903863fca4befef311'
    };
  if (env == 'dev') {
config.userName = 'krunalb@test.com'
config.password = 'Test@123'
  } else if (env == 'e2e') {
    config.someUrlBase = 'https://e2e-host/v1/auth';
  }
//  var accessToken = karate.callSingle('classpath:helpers/createToken.feature',config).token
  karate.configure('headers',{Authorization:config.authToken})
karate.configure('url',config.goRest)

  karate.configure('logPrettyRequest',true)
  karate.configure('logPrettyResponse',true)

return config;
}