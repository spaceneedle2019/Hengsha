require 'sinatra'
require 'tilt/erb'
require 'redcarpet'
require_relative 'views/base'

DEFAULT_LAYOUT = :'templates/layout.html'

get '/' do
  erb :'templates/projects.html', :layout => DEFAULT_LAYOUT,  :locals => {base: Views::Base}
end

get '/about' do
  erb :'templates/about.html', :layout => DEFAULT_LAYOUT
end

get '/:things' do
  "#{params[:things]} not found"
  # erb :'not_found.html', :layout => DEFAULT_LAYOUT, :locals => {:things => params[:things]}
end

not_found do
  'not found'
  # erb :'not_found.html', :layout => DEFAULT_LAYOUT
end