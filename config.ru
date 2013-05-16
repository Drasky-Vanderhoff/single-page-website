$stdout.sync = true

use Rack::Static,
  :urls => ["/stylesheet", "/js", "/images", "/fonts"],
  :root => "."

# require 'sprockets'
# map '/assets' do
#   environment = Sprockets::Environment.new
#   environment.append_path 'js'
#   environment.append_path 'stylesheets'
#   run environment
# end
#map '/' do
    run lambda { |env|
      [
        200,
        {
          'Content-Type'  => 'text/html',
          'Cache-Control' => 'public, max-age=86400'
        },
        File.open('index.html', File::RDONLY)
      ]
    }
#end
