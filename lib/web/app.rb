require "roda"

module Web
  class App < ::Roda
    def self.build
      app
    end

    plugin :slash_path_empty
    plugin :head
    plugin :request_headers
    plugin :default_headers, "Content-Type" => "text/plain"
    plugin :render,
      views: File.expand_path("./templates", __dir__)

    route do |r|
      # GET / request
      r.root do
        render("hello_world.txt")
      end
    end
  end
end
