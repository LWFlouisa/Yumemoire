ppv = File.read("scenes/plot_progress/ppv.txt").strip.to_i

File.open("scene/plot_progress/ppv.txt", "w") { |f|
  ppv = ppv + 1

  f.puts ppv
}
