package conduitApp;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class ConduitTest {

   @Test
   void testHomePage() {
       Results results = Runner.path("classpath:conduitApp").tags("@2").parallel(1);
       assertEquals(0, results.getFailCount(), results.getErrorMessages());
   }

   @Test
    void testCreatePost() {
        Results results = Runner.path("classpath:conduitApp/features/CreatePost.feature").tags().parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}