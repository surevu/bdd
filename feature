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

_______________________________________________________________________________________________________________________________________
 Step Definition
package login;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

import PageBean.PageFactoryLogin;
import cucumber.api.PendingException;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class StepDefinitionLogin {
	
	
	private WebDriver driver;
	private PageFactoryLogin objhlpg;


@Given("^user is on hotel booking application page$")
public void user_is_on_hotel_booking_application_page() throws Throwable {
    driver=new FirefoxDriver();
    Thread.sleep(2000);
   // driver.manage().timeouts().implicitlyWait(3, TimeUnit.SECONDS);
    objhlpg=new PageFactoryLogin(driver);
    
    driver.get("file:///D:/share/hotelBooking/login.html");
    
    
    }

@Then("^check the heading of the page$")
public void check_the_heading_of_the_page() throws Throwable {
    String strheading=driver.findElement(By.xpath(".//*[@id='mainCnt']/div[1]/div[1]/form/table/tbody/tr[2]/td[2]/input")).getText();
    if(strheading.contentEquals("Hotel Booking Application"))
    	System.out.println("********** Heading Matched");
    else
    	System.out.println("********** Heading Not Matched");
    Thread.sleep(2000);
    driver.close();
}



@When("^user enters all the valid data$")
public void user_enters_all_the_valid_data() throws Throwable {
   
	objhlpg.setPfuname("capgemini");
	objhlpg.setPfpwd("capg1234");
	Thread.sleep(2000);
	objhlpg.setPflogin();
	driver.close();
}

@Then("^navigate to Hotel Booking page$")
public void navigate_to_Hotel_Booking_page() throws Throwable {
    
	driver.navigate().to("file:///D:/share/hotelBooking/hotelbooking.html");
	Thread.sleep(2000);
	driver.close();

}

@When("^user leaves user name blank and clicks the button$")
public void user_leaves_user_name_blank_and_clicks_the_button() throws Throwable {
    objhlpg.setPfuname("");
    Thread.sleep(2000);
    objhlpg.setPflogin();
    
}

@Then("^dispaly appropriate message$")
public void dispaly_appropriate_message() throws Throwable {
    
	
}

@When("^user enters incorrect username or  password blank and clicks the button$")
public void user_enters_incorrect_username_or_password_blank_and_clicks_the_button() throws Throwable {
	objhlpg.setPfuname("capgemini");
	objhlpg.setPfpwd("1234");
	Thread.sleep(2000);
	objhlpg.setPflogin();
}

@Then("^dispaly login failed message$")
public void dispaly_login_failed_message() throws Throwable {
    
	
}
	
	
