require "minitest/autorun"
require "minitest/pride"

require "bundler/setup"
Bundler.require

APP_ROOT = File.expand_path("..", dir)

Dir[File.join(APP_ROOT, "app/**/*.rb")].sort.each do |file|
  require file
end