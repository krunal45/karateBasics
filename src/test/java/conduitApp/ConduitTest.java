package conduitApp;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;

class ConduitTest {

   @Test
   void testHomePage() {
       Results results = Runner.path("classpath:conduitApp/features/HomePage.feature").tags("@test").parallel(1);
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

    @Test
    void testParallel(){
        Results results = Runner.path("classpath:conduitApp/features/Hooks.feature").tags("@test").outputCucumberJson(true).parallel(1);
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "conduitApp");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}