Feature:dummy

  Scenario:Dummy
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def username = dataGenerator.getRandomName()
    * print username