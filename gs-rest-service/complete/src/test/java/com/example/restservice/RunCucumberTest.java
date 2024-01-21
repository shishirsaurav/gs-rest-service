package com.example.restservice;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = {"classpath:features/DefaultGreeting.feature"},
        glue = {"com.example.restservice.StepDefinitions"}
        plugin = {"pretty", "html:target/cucumber-reports"}
        )
public class RunCucumberTest {
}
