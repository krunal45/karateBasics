package conduit.Features.GoRestAPIS;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import io.cucumber.junit.CucumberOptions;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

@CucumberOptions(
        plugin = {"json:target/cucumber-report/cucumber.json"}
)

public class testRunner {

@Test
    void testParallel() {
        Results results = Runner.path("classpath:conduit/Features/GoRestAPIS").tags("~@skipme").parallel(10);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}