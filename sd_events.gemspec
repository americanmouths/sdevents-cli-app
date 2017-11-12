
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sd_events/version"

Gem::Specification.new do |spec|
  spec.name          = "sd_events"
  spec.version       = SdEvents::VERSION
  spec.authors       = ["Kayla Hansen"]
  spec.email         = "shiverr@gmail.com"
  spec.summary       = "Listing of events happening in San Diego today"
  spec.homepage      = "https://github.com/americanmouths/sdevents-cli-app"
  spec.license       = "MIT"
  spec.executables << 'sd-events'
  spec.files         = ["lib/sd_events.rb", "lib/sd_events/cli.rb", "lib/sd_events/scraper.rb", "lib/sd_events/version.rb", "lib/sd_events/events.rb"]


  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
  spec.add_development_dependency "nokogiri", ">= 0"

end
