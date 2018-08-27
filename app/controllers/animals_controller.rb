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

end