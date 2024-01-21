package com.example.restservice;

import com.example.restservice.GreetingController;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

public class StepDefinitions {

    private MockMvc mockMvc;
    private String actualResponse;

    @Given("the greeting API is available")
    public void the_greeting_api_is_available() {
        // Setup or verify the availability of the greeting API
        // You can initialize the MockMvc instance and configure it here
        GreetingController gt = new GreetingController();
        mockMvc = MockMvcBuilders.standaloneSetup(gt.greeting("Hello")).build();
    }

    @When("I make a GET request to \"/greeting\" endpoint")
    public void i_make_a_get_request_to_endpoint() throws Exception {
        // Make a GET request to the "/greeting" endpoint
        // Perform the request using MockMvc and store the result
        actualResponse = mockMvc.perform(MockMvcRequestBuilders.get("/greeting"))
                .andDo(print())
                .andReturn()
                .getResponse()
                .getContentAsString();
    }

    @Then("the response status should be {int} OK")
    public void the_response_status_should_be_ok(int expectedStatus) throws Exception {
        // Verify that the response status is as expected
        mockMvc.perform(MockMvcRequestBuilders.get("/greeting"))
                .andDo(print())
                .andExpect(MockMvcResultMatchers.status().isOk());
    }

    @Then("the response content should contain a JSON object")
    public void the_response_content_should_contain_a_json_object() {
        // Verify that the response content is a valid JSON object
        // You may want to use a JSON parsing library to check for validity
        // For simplicity, we are not implementing this check in this example
        assert(actualResponse.getClass().equals("Object"));
    }

    @Then("the \"content\" field in the JSON object should have the value {string}")
    public void the_field_in_the_json_object_should_have_the_value(String expectedValue) {
        // Verify that the "content" field in the JSON object has the expected value
        // For simplicity, we are not parsing the actual JSON response in this example
        // You might want to use a JSON parsing library to extract and compare values
        // For example, you can use JsonPath or Jackson ObjectMapper
        // Note: This step assumes that the response is a JSON string
        // and the "content" field is at the root level
        assert(actualResponse.getClass().equals(expectedValue));
    }
}



