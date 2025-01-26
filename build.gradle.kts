plugins {
  alias(libs.plugins.kotlin.jvm)
  alias(libs.plugins.ktor)
  alias(libs.plugins.ktfmt)
}

group = "dev.hsuliz"
version = "0.0.4"

application {
  mainClass.set("dev.hsuliz.ApplicationKt")

  val isDevelopment: Boolean = project.ext.has("development")
  applicationDefaultJvmArgs = listOf("-Dio.ktor.development=$isDevelopment")
}

repositories { mavenCentral() }

dependencies {
  implementation(libs.ktor.server.core)
  implementation(libs.ktor.server.netty)
  implementation(libs.logback.classic)
  implementation(libs.ktor.server.config.yaml)
  testImplementation(libs.ktor.server.test.host)
  testImplementation(libs.kotlin.test.junit)
}

ktor { fatJar { archiveFileName.set("web-server.jar") } }

//tasks.register<Task>("getVersion") {
//  description = "Prints the current project version"
//  group = "versioning"
//
//  println(version)
//}
//
//abstract class IncrementVersionTask : DefaultTask() {
//  enum class VersionType(val version: String) {
//    MAJOR("major"),
//    MINOR("minor"),
//    PATCH("patch"),
//  }
//
//  @Input
//  @Option(option = "versionType", description = "Type of version type.")
//  lateinit var versionType: VersionType
//
//  @TaskAction
//  fun execute() {
//    val buildFileContent = project.buildFile.readText()
//    lateinit var newVersion: String
//    val versionRegex = "version\\s*=\\s*\"(\\d+)\\.(\\d+)\\.(\\d+)\"".toRegex()
//    val updatedContent =
//        versionRegex.replace(buildFileContent) {
//          val major = it.groups[1]!!.value.toInt()
//          val minor = it.groups[2]!!.value.toInt()
//          val patch = it.groups[3]!!.value.toInt()
//
//          val (newMajor, newMinor, newPatch) =
//              when (versionType) {
//                VersionType.MAJOR -> Triple(major + 1, 0, 0)
//                VersionType.MINOR -> Triple(major, minor + 1, 0)
//                VersionType.PATCH -> Triple(major, minor, patch + 1)
//              }
//          newVersion = "$newMajor.$newMinor.$newPatch"
//          "version = \"$newMajor.$newMinor.$newPatch\""
//        }
//
//    project.buildFile.writeText(updatedContent)
//    println(newVersion)
//  }
//}
//
//tasks.register<IncrementVersionTask>("incrementVersion") {
//  description =
//      "Increments the project version. Specify the version type via --versionType=major|minor|patch"
//  group = "versioning"
//}
