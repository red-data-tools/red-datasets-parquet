# -*- ruby -*-

clean_white_space = lambda do |entry|
  entry.gsub(/(\A\n+|\n+\z)/, '') + "\n"
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))
require "datasets-parquet/version"

Gem::Specification.new do |spec|
  spec.name = "red-datasets-parquet"
  spec.version = DatasetsParquet::VERSION
  spec.homepage = "https://github.com/red-data-tools/red-datasets-parquet"
  spec.authors = ["otegami", "Kouhei Sutou"]
  spec.email = ["a.s.takuya1026@gmail.com", "kou@clear-code.com"]

  readme = File.read("README.md")
  readme.force_encoding("UTF-8")
  entries = readme.split(/^\#\#\s(.*)$/)
  clean_white_space.call(entries[entries.index("Description") + 1])
  description = clean_white_space.call(entries[entries.index("Description") + 1])
  spec.summary, spec.description, = description.split(/\n\n+/, 3)
  spec.license = "MIT"
  spec.files = [
    "README.md",
    "LICENSE.txt",
    "Rakefile",
    "Gemfile",
    "#{spec.name}.gemspec",
  ]
  spec.files += [".yardopts"]
  spec.files += Dir.glob("lib/**/*.rb")
  spec.files += Dir.glob("image/*.*")
  spec.files += Dir.glob("doc/text/*")

  spec.add_runtime_dependency("red-datasets")
  spec.add_runtime_dependency("red-parquet")

  spec.add_development_dependency("bundler")
  spec.add_development_dependency("rake")
  spec.add_development_dependency("test-unit")
  spec.add_development_dependency("yard")
  spec.add_development_dependency("kramdown")
end
