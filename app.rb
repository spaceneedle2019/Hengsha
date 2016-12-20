require 'sinatra'
require 'tilt/erb'
require 'redcarpet'
require_relative 'helpers/view_helper'

DEFAULT_LAYOUT = :'layout.html'

get '/' do
  erb :'projects.html', :layout => DEFAULT_LAYOUT,  :locals => {:helper => ViewHelper}
end

get '/about' do
  erb :'about.html', :layout => DEFAULT_LAYOUT
end

get '/:things' do
  "#{params[:things]} not found"
  # erb :'not_found.html', :layout => DEFAULT_LAYOUT, :locals => {:things => params[:things]}
end

not_found do
  'not found'
  # erb :'not_found.html', :layout => DEFAULT_LAYOUT
end