require 'sinatra'
require 'tilt/erb'
require 'redcarpet'

LAYOUT = :'layout.html'

get '/' do
  html = []
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::XHTML)
  md_directory = 'views/md/**/*'
  Dir.glob(md_directory).select do |file_name|
    html << markdown.render(File.read(file_name)) if File.file?(file_name)
  end
  erb html.join, :layout => LAYOUT
end

get '/about' do
  erb :'about.html', :layout => LAYOUT
end

get '/:things' do
  "#{params[:things]} not found"
  # erb :'not_found.html', :layout => DEFAULT_LAYOUT, :locals => {:things => params[:things]}
end

not_found do
  'not found'
  # erb :'not_found.html', :layout => DEFAULT_LAYOUT
end