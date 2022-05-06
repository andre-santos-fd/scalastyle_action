ThisBuild / version := "0.1.0-SNAPSHOT"

ThisBuild / scalaVersion := "2.13.8"

addCompilerPlugin(
  "org.scalameta" %% "semanticdb-scalac" % "4.5.6" cross
  CrossVersion.full
)


scalacOptions ++= Seq(
  "-deprecation",
  "-Ywarn-unused",
  "-Yrangepos"
)


lazy val root = (project in file("."))
  .settings(
    name := "scala_example"
  )
