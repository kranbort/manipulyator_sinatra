#coding: UTF-8
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pony'
require 'sass'
require 'haml'
require './message'

require 'sass/plugin/rack'
use Sass::Plugin::Rack

get('/') { haml :index }
get('/contacts') { haml :contacts }
get('/faq') { haml :faq }
get('/info') { haml :contacts }
get('/prices') { haml :prices }
get('/services') { haml :services }
get('/gallery') { haml :gallery }

post '/contacts' do
  Message.new(params[:contact]).deliver
  redirect to('/')
end
