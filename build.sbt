ThisBuild / version := "0.1.0-SNAPSHOT"

ThisBuild / scalaVersion := "2.13.8"
autoStartServer := false


scalacOptions ++= Seq(
  "-deprecation",
  "-Ywarn-unused",
  "-Yrangepos"
)


lazy val root = (project in file("."))
  .settings(
    name := "scala_example"
  )
