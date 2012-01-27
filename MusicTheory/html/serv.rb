#!/usr/bin/env ruby

require 'sinatra'
require 'haml'
require 'sass'

def rerender_sass
  sass_engine = Sass::Engine.for_file( 'public/music.scss', :cache => false )
  output = sass_engine.render
  File.open( "public/music.css", "w" ) { |f| f.puts output }
end

get '/' do
  rerender_sass

  haml_template = File.read( 'music.haml' )
  haml_engine = Haml::Engine.new(haml_template)
  haml_engine.render
end
