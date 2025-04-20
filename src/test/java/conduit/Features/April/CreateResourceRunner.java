package conduit.Features.April;

import com.intuit.karate.junit5.Karate;

public class CreateResourceRunner {
    @Karate.Test
    Karate testCreateResource() {
        return Karate.run("SimpleBooksAPI").relativeTo(getClass());
    }
}