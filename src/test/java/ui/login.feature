Feature: Login

  Background: util
    * def testData = read('loginTestData.json')
    * def loginPageLoc = read('loginPageLocators.json')
    * def homePageLoc = read('homePageLocators.json')
    * configure driver = {type: 'chrome',addoptions: ['--incognito']}

  Scenario: Login Functionality
    Given driver webURL
    * waitUntil("document.readyState == 'complete'")
    When driver.maximize()
    * waitForText('//button[@type=\'submit\']',' Login ')
    Then retry().input(loginPageLoc.userNameField,testData.userName)
    And  retry().input(loginPageLoc.passwordField,testData.password)
    And retry().click(loginPageLoc.loginButtonField)
    And match text('.oxd-sheet[data-v-98346df6] > .orangehrm-dashboard-widget-header .oxd-text') == 'Time at Work'
    * screenshot()
    Then click(homePageLoc.adminLink)
    And mouse().down().move('').up()
    And click(homePageLoc.deleteAdminButton)
    * delay(3000)
    * dialog(true)
    * delay(3000)
    * print driver.dialog

    Scenario: Switching browser tabs
      Given driver 'https://training.rcvacademy.com/'
      When driver.maximize()
      Then click('{}Automation Practice page')
      And switchPage('RCV Academy & Software Testing Mentor | Launch your Software Testing Career!')
      * delay(3000)
      And switchPage('training.rcvacademy.com/automation-practice-page')
      * delay(3000)
      And switchPage(0)

    Scenario: Switching Frames
      Given driver 'https://the-internet.herokuapp.com/nested_frames'
      When driver.maximize()
      Then switchFrame(1)
      And print text('body')
      And switchFrame("//body[contains(text(),'LEFT')]")