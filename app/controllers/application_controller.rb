require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions # keeps state & stores all data in a cookie
    # below is a random value for HMAC-SHA1 equal to 64 bytes,
    # as recommended in Sinatra README
    # http://sinatrarb.com/intro.html#Using%20Sessions
    set :session_secret, "62f668e0974cdb9816269fb545d6c39433dad0f9b8bbd98a8f467e4064c4162f5613ced68a1322c2702c74b1fd4efd004e98f9176bcd2deaf3f01073a5b5cea8"
  end

  get "/" do #loads the home page
    erb :index
  end

end
