

map = <<-MAP
<html>
  <head>
    <title>Test HTML</title>
    <style>
    </style>
  </head>
  <body>
    <h1>Test</h1>
    <p>This is a test.</p>
  </body>
</html>
MAP

File.open("map.html", "w") { |f|
  f.puts map
}
