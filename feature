#Author: Sunny



Feature: Login Functionality in Hotel Booking Application 
 
 Scenario: Verify the title as Hotel Booking Application
    Given user is on hotel booking application page
   
    Then check the heading of the page
    
    
 Scenario: Successful hotel booking with all valid data
    Given user is on hotel booking application page
    When user enters all the valid data
    Then navigate to Hotel Booking page
    
Scenario: Failure in hotel booking on leaving user name blank
    Given user is on hotel booking application page
    When user leaves user name blank and clicks the button
    Then dispaly appropriate message
    
Scenario: Failure in hotel booking on giving incorrect username or passsword
    Given user is on hotel booking application page
    When user enters incorrect username or  password blank and clicks the button
    Then dispaly login failed message    


 
