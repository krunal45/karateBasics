Feature: sample after Hook Feature

  Background: after Hook

    * configure afterScenario = function(){karate.log('inside after Hook')} // Will Run after Every scenario
    * configure afterFeature = function(){karate.log('inside after Hook')} // Will run at the feature end

  Scenario: first scenario
    * print 'Inside scenario 1'

  Scenario: second scenario
    * print 'Inside scenario 2'