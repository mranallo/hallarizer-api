require 'logger'
require 'sinatra/base'
require 'json'
require 'ruby_cowsay'


class App < Sinatra::Base
  enable :static
  set :root, File.join(File.dirname(__FILE__))
  set :port, 80

  get '/' do
    'healthy'
  end


  get '/say/:text' do |text|
    formatted_param = text.gsub("-", " ")
    cow = Cow.new({ cow:  'stegosaurus'})
    body = cow.say("Holla!!!! #{formatted_param}").gsub(/[\r\n]+/, "<br>").gsub(" ", "&nbsp")
    "<code>#{body}</code>"
  end

  get '/say-cli/:text' do |text|
    formatted_param = text.gsub("-", " ")
    cow = Cow.new({ cow:  'stegosaurus'})
    body = cow.say("Holla!!!! #{formatted_param}")
    "#{body}"
  end

end
