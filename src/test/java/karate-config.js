function fn() {
  var env = 'qa'; // get java system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev'; // a custom 'intelligent' default
  }
  var config = { // base config JSON
    webURL: 'https://opensource-demo.orangehrmlive.com/web/index.php/auth/login',
    apiBaseURLForPostFeature: 'https://jsonplaceholder.typicode.com',
    apiBaseURLForReqresFeature: 'https://reqres.in/',
    conduitAPIEndpoint: 'https://api.realworld.io/api',
    restFulBooker: 'https://restful-booker.herokuapp.com',
    goRest: 'https://gorest.co.in/',
    authToken: 'Bearer 18c9caaf7a49d07943da5306092cdb8c759e03df2e98c282c2b4ab03177ecc8d'
    };
  if (env == 'stage') {
//     over-ride only those that need to be
    config.someUrlBase = 'https://stage-host/v1/auth';
  } else if (env == 'e2e') {
    config.someUrlBase = 'https://e2e-host/v1/auth';
  }
  karate.configure('logPrettyRequest',true)
  karate.configure('logPrettyResponse',true)

return config;
}