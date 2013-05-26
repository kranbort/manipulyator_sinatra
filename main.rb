require 'sinatra'
require 'sinatra/reloader' if development?
require 'pony'
require 'sass'
require 'haml'

require 'sass/plugin/rack'
use Sass::Plugin::Rack

helpers do
  def send_message
    Pony.mail(
    :from => 'kranbortspb@gmail.com',
    :to => 'kranbortspb@gmail.com',
    :subject => params[:contact][:name] + " связался с вами",
    :body => "#{params[:contact][:tel]} \n #{params[:contact][:serv]} \n #{params[:contact][:email]} \n #{params[:contact][:extra_info]}",
    :port => '587',
    :via => :smtp,
    :enable_starttls_auto => true,
    :via_options => {
      :address => 'smtp.gmail.com',
      :port => '587',
      :enable_starttls_auto => true,
      :user_name => 'kranbortspb',
      :password  => 'qwedsa123',
      :authentication => :plain,
      :domain => 'localhost.localdomain'
    })
  end
end

get('/') { haml :index }
get('/contacts') { haml :contacts }
get('/faq') { haml :faq }
get('/info') { haml :contacts }
get('/prices') { haml :prices }
get('/services') { haml :services }
get('/gallery') { haml :gallery }

post '/contacts' do
  logger.info "============= #{params}"
  send_message
  redirect to('/')
end
