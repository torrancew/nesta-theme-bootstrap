begin
  require 'less'
rescue e
  puts "Please install the 'less' gem to use this theme"
end

require 'nesta/app'

module Nesta
  class App
    # Use LESS for CSS template rendering
    get '/css/:sheet.css' do
      content_type 'text/css', :charset => 'utf-8'
      cache less(params[:sheet].to_sym)
    end
    
    # Mount this theme at /bootstrap
    use Rack::Static, :urls => ['/bootstrap'], :root => 'themes/bootstrap/public'
  end
end

