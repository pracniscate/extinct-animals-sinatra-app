class AnimalsController < ApplicationController

    # renders the collection of extinct animals if the user is logged in
    # if not logged in, redirect to the login page
    get '/animals' do
        if logged_in?
            erb :'/animals/animals'
        else
            redirect '/login'
        end
    end

    # renders a form to create a new extinct animal if logged in
    # redirects to the login page if logged out
    get '/animals/new' do
        if logged_in?
            erb :'/animals/create_animal'
        else
            redirect '/login'
        end
    end

end