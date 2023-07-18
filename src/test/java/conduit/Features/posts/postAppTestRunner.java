package conduit.Features.posts;


import com.intuit.karate.Results;
import com.intuit.karate.junit5.Karate;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class postAppTestRunner {
    @Karate.Test
    Results testSample() {
        Results results = Karate.run("conduit/Features/posts/getCreatedPosts.feature").outputCucumberJson(true).parallel(5);
        generateReport(results.getReportDir());
        assertEquals(results.getFailCount() == 0, true, results.getErrorMessages());
        return results;
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "demo");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }

//    @Karate.Test
//    void testParallel() {
//        Karate.run("conduit/Features/posts/getCreatedPosts.feature");
//    }


}