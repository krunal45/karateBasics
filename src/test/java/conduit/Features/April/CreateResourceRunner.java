package conduit.Features.April;

import com.intuit.karate.junit5.Karate;

public class CreateResourceRunner {
    @Karate.Test
    Karate testCreateResource() {
        return Karate.run().relativeTo(getClass());
    }

    @Karate.Test
    Karate testGoRestAPI() {
        return Karate.run("GoRestAPI").tags("@createUser,@listUsers").relativeTo(getClass());
    }
}