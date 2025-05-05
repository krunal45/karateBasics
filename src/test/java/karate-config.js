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
    authToken: 'Bearer 69d45aa51f3c6b46d10b725570c4828036880ce50b0e5394d452d9b2ba7e4d1c'
    };
  if (env == 'dev') {
config.userName = 'krunalb@test.com'
config.password = 'Test@123'
  } else if (env == 'e2e') {
    config.someUrlBase = 'https://e2e-host/v1/auth';
  }
  var accessToken = karate.callSingle('classpath:helpers/createToken.feature',config).token
  karate.configure('headers',{Authorization:'Token '+accessToken})

  karate.configure('logPrettyRequest',true)
  karate.configure('logPrettyResponse',true)

return config;
}