require 'sinatra'

get '/hi' do
    "Hello World!"
end

get '/app' do
    send_file File.join(settings.public_folder, 'index.html')
end