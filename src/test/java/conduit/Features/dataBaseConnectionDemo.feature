Feature: DB Connection

  Background: Connect to db
    * def dbHandler = Java.type('helpers.DBConnection')

  Scenario: DB Connection
    * eval dbHandler.addNewEmployee(12,"Pandya","Krunal","QA-Lead")
