class UsersController < ApplicationController

    # renders sign up form if the user is not logged in
    get '/signup' do
        if !logged_in?
            erb :'/users/create_user'
        end
    end

end