package performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class PerfTest extends Simulation {

  val protocol = karateProtocol(
    "/api/articles/{articleId}" -> Nil
  )

  // protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
  // protocol.runner.karateEnv("perf")

  val create = scenario("create").exec(karateFeature("classpath:runaApp/performance/poc/createArticle.feature"))
  //val delete = scenario("delete").exec(karateFeature("classpath:mock/cats-delete.feature@name=delete"))

  setUp(
    create.inject(atOnceUsers(3)).protocols(protocol),
    //delete.inject(rampUsers(5) during (5 seconds)).protocols(protocol)
  )

}