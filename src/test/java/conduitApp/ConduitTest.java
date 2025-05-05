package conduitApp;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import helpers.DataGenerator;

class ConduitTest {

   @Test
   void testHomePage() {
       Results results = Runner.path("classpath:conduitApp").tags("@test").parallel(1);
       assertEquals(0, results.getFailCount(), results.getErrorMessages());
   }

   @Test
    void testCreatePost() {
        Results results = Runner.path("classpath:conduitApp/features/CreatePost.feature").tags("@createArticle").parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    @Test
    void testDeleteArticle() {
        Results results = Runner.path("classpath:conduitApp/features/CreatePost.feature").tags("@createAndDeleteArticle").parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    @Test
    void signUpFeature() {
        Results results = Runner.path("classpath:conduitApp/features/SignUp.feature").tags("@test").parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    @Test
    void homeWorkFeature(){
        Results results = Runner.path("classpath:conduitApp/features/HomeWork.feature").tags("@test2").parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}