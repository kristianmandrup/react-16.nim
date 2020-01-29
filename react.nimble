# Package

version       = "0.3.3"
author        = "Andrea Ferretti and Kristian Mandrup"
description   = "Sample React 16.6 SPA with hooks using Nim"
license       = "Apache2"
skipDirs      = @["example"]

# Dependencies

requires "nim >= 1.0.0"

task example, "builds example application":
  --define: release
  switch("out", "example/app.js")
  --path: "."
  setCommand "js", "example/app.nim"
