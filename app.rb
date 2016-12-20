require 'sinatra'
require 'tilt/erb'

DEFAULT_LAYOUT = :'layouts/default.html'

get '/' do
  'You are at home!'
  # erb :'home.html', :layout => DEFAULT_LAYOUT
end

get '/:things' do
  "#{params[:things]} not found"
  # erb :'not_found.html', :layout => DEFAULT_LAYOUT, :locals => {:things => params[:things]}
end

not_found do
  'not found'
  # erb :'not_found.html', :layout => DEFAULT_LAYOUT
end