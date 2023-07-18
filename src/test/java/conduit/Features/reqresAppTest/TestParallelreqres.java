package conduit.Features.reqresAppTest;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class TestParallelreqres {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:conduit/Features/reqresAppTest").tags("~@skipme").parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}