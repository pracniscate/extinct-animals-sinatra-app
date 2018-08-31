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
            if animal.valid?
                animal.save
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

    # renders animal edit form if user is logged in
    get '/animals/:id/edit' do
        if logged_in?
            @animal = Animal.find_by(id: params[:id])
            if @animal && @animal.user = current_user
                erb :'/animals/edit'
            else
                redirect '/animals'
            end
        else
            redirect '/login'
        end
    end

    # updates the data about an animal if user is logged in
    # if the update is successful, redirects to that animal's individual page
    # if the update fails, redirects back to animal's edit form
    # if user is not logged in, redirects to the login page
    patch '/animals/:id' do
        if logged_in?
            @animal = Animal.find_by(id: params[:id])

            if @animal.update(name: params[:name], animal_type: params[:animal_type], last_sighting: params[:last_sighting], description: params[:description])
                redirect "/animals/#{@animal.id}"
            else
                redirect "/animals/#{@animal.id}/edit"
            end
        else
            redirect '/login'
        end
    end

    # deletes an animal's object if user is logged in
    # and if that animal belongs to currently logged in user
    delete '/animals/:id/delete' do
        if logged_in?
            @animal = Animal.find_by(id: params[:id])
            if @animal && @animal.user == current_user
                @animal.delete
            end
            redirect '/animals'
        else
            redirect '/login'
        end
    end

end