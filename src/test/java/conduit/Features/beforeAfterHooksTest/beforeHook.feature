Feature: sample before Hook Feature

  //Will execute before every scenario
  Background:
    * print 'Inside Before Hook'

  Scenario: before Hook Test 1
    * print 'Inside scenario 1'

  Scenario: before Hook Test 2
    * print 'Inside scenario 2'