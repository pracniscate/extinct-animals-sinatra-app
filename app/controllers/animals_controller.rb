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

    # creates an instance of the animal & sends to db if
    # the input fields are filled out & the user is logged in
    post '/animals' do
        if !params[:name].blank? && !params[:animal_type].blank? && !params[:last_sighting].blank? && !params[:description].blank? && logged_in?
            # builds a new animal object associated with the currently logged in user
            animal = current_user.animals.build(params)

            # saving the animal to the database if params were filled out
            # upon a successful save, redirects to that animal's page
            # upon failure to save, redirects back to the new animal form
            if animal.save
                redirect "/animals/#{animal.id}"
            else
                redirect '/animals/create_animal'
            end
        else
            redirect '/animals/create_animal' if logged_in?
        end
    end

    # shows the individual animal page if user is logged in
    get '/animals/:id' do
        if logged_in?
            @animal = Animal.find_by(id: params[:id])
            erb :'/animals/show'
        end
    end

end