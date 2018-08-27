class UsersController < ApplicationController

    # renders sign up form if the user is not logged in
    # if logged in, redirects to the main page of collected animals
    get '/signup' do
        if !logged_in?
            erb :'/users/create_user'
        else
            redirect '/animals'
        end
    end

    # submits the sign up form
    # if the input contains blank space, render the sign up form again
    # if user signs up with their username, email, & password, save the params
    # set their session to their user_id
    # & render the main page containing a collection of animals added
    post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect '/signup'
        else
            @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
            @user.save
            session[:user_id] = @user.id
            redirect '/animals'
        end
    end

end