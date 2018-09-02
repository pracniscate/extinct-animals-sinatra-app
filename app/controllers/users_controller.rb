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
        if params[:username].blank? || params[:email].blank? || params[:password].blank?

            flash[:message] = "All fields are required."

            redirect '/signup'
        else
            @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
            @user.save
            session[:user_id] = @user.id
            redirect '/animals'
        end
    end

    # renders the login page
    # if the user is not logged in, directs the login page
    # if the user is logged in, redirects to the main page of collected animals
    get '/login' do
        if !logged_in?
            erb :'users/login'
        else
            redirect '/animals'
        end
    end

    # submits the login form
    # find the user in db based on their username
    # if the user is found AND the user is authenticated,
    # set their session to their user_id
    # and redirect to the main page of collected animals
    # otherwise, redirect to the sign up page
    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/animals'
        else
            flash[:message] = "User not found. Please sign up."
            redirect '/signup'
        end
    end

    get '/logout' do
        session.clear
        redirect '/login'
    end

end