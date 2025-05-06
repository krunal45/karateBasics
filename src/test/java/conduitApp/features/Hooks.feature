@test @ignore
Feature:Before Hooks & After Hooks

  Background: hooks
##    before Hooks
##    callonce > Will only execute once before feature.
##    call > Will execute before every scenario.
#    * def result = callonce read('classpath:helpers/dummy.feature')
#    * def userName = result.username

#    afterHooks
#    afterFeature > Will execute at the end of feature
#    afterScenario > Will execute at the end of each scenario
  * configure afterScenario = function(){karate.call('classpath:helpers/dummy.feature')}
    * configure afterFeature =
    """
    function(){
    karate.log('After Feature Text!')
    }
    """

  Scenario:First Scenario
    * print userName
    * print 'This is First Scenario'

  Scenario:Second Scenario
    * print userName
    * print 'This is Second Scenario'