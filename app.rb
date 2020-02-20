require 'logger'
require 'sinatra/base'
require 'json'

class App < Sinatra::Base
  enable :static
  set :root, File.join(File.dirname(__FILE__))
  set :port, 80

  get '/' do
    'healthy'
  end


  get '/hollarizer/:text' do |text|
    formatted_param = text.gsub("-", " ")
    hollarized = "Holla!!! #{formatted_param}"
    JSON.generate(hollarized)
  end

end
