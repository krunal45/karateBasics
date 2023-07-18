package conduit.Features.performanceTest

import com.intuit.karate.gatling.KarateProtocol
import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import io.gatling.core.structure.ScenarioBuilder

class perfTest extends Simulation {

  val protocol: KarateProtocol = karateProtocol()

  //  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
  //  protocol.runner.karateEnv("perf")

  val create: ScenarioBuilder = scenario("create new Record in Database").exec(karateFeature("classpath:conduit/Features/performanceTest/createNewRecord.feature"))
  //  val delete = scenario("delete").exec(karateFeature("classpath:mock/cats-delete.feature@name=delete"))

  setUp(
    create.inject(atOnceUsers(1)).protocols(protocol)
  )

}