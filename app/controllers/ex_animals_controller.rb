class ExAnimalsController < ApplicationController

    # renders the collection of extinct animals if the user is logged in
    # if not logged in, redirect to the login page
    get '/animals' do
        redirect_if_not_logged_in
        erb :'/animals/animals'
    end

    # renders a form to create a new extinct animal if logged in
    # redirects to the login page if logged out
    get '/animals/new' do
        redirect_if_not_logged_in
        erb :'/animals/create_animal'
    end

    # creates an instance of the animal & sends to db if
    # the input fields are filled out & the user is logged in
    post '/animals' do
        redirect_if_not_logged_in

        if Animal.new(params).valid?
            # builds a new animal object associated with the currently logged in user
            animal = current_user.animals.build(params)
            # saving the animal to the database if params were filled out
            # upon a successful save, redirects to that animal's page
            # upon failure to save, redirects back to the new animal form
            if animal.save

                flash[:message] = "Extinct animal successfully added."

                redirect "/animals/#{animal.id}"
            else
                flash[:message] = "Failed to add this animal."
                redirect '/animals/create_animal'
            end
        else
            flash[:message] = "Failed to add this animal."
            redirect '/animals/create_animal'
        end
    end

    # shows the individual animal page if user is logged in
    get '/animals/:id' do
        redirect_if_not_logged_in
        @animal = Animal.find_by(id: params[:id])
        erb :'/animals/show'
    end

    # renders animal edit form if user is logged in
    get '/animals/:id/edit' do
        redirect_if_not_logged_in

        @animal = Animal.find_by(id: params[:id])
        if animal_belongs_to_user
            erb :'/animals/edit'
        else
            flash[:message] = "You can't edit information about this animal because you did not create it."
            redirect '/animals'
        end
    end

    # updates the data about an animal if user is logged in
    # if the update is successful, redirects to that animal's individual page
    # if the update fails, redirects back to animal's edit form
    # if user is not logged in, redirects to the login page
    patch '/animals/:id' do
        redirect_if_not_logged_in

        @animal = Animal.find_by(id: params[:id])

        if @animal.update(name: params[:name], animal_type: params[:animal_type], last_sighting: params[:last_sighting], description: params[:description])

            flash[:message] = "Information updated."
            redirect "/animals/#{@animal.id}"
        else

            flash[:message] = "All fields are required, please."
            redirect "/animals/#{@animal.id}/edit"
        end
    end

    # deletes an animal's object if user is logged in
    # and if that animal belongs to currently logged in user
    delete '/animals/:id/delete' do
        redirect_if_not_logged_in

        @animal = Animal.find_by(id: params[:id])
        if animal_belongs_to_user
            @animal.delete

            flash[:message] = "You successfully deleted this animal."
            redirect '/animals'
        else
            flash[:message] = "You can't delete this animal because you did not create it."
            redirect '/animals'
        end
    end

end