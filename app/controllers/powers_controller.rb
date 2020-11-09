class PowersController < ApplicationController

  get '/powers' do # INDEX
    #We use instance variables in controller methods to pass information to views
    @powers = Power.all
    erb :'powers/index'
  end

  get '/powers/:id' do # SHOW
    @power = Power.find_by(id: params[:id])
    if @power
      erb :'powers/show'
    else
      "Woops! That power doesn't exist"
      #Routes that use symbols in the URL are dynamic routes
      #The word that's as a symbol is called a `slug`, they're basically wildcards that will accept ANY string that falls there
      #Whatever gets placed in this slug/wildcard space will end up inside of the params hash under that key

      #The 'param' variable is a variable available to every controller method. It is a hash that stores information coming through slugs in URLS OR information from forms
      #Params is the only way to get information from a URL or from a form into a controller method
    end
  end

  get '/powers/new' do # NEW
    #render the ERB form to create a new instance of a power
  end

  post '/powers' do # CREATE
    #this is the route that we submit the form to
    #all of the values that the user inputted to make a new instance of a power will be stored in the params hash here
    #we will make a new instance and then re-direct the user to the SHOW page of the instance we just created
  end

  get '/powers/:id/edit' do # EDIT
    #use the :id slug's key in the params hash to find a power by its ID
    #then render a form with pre-filled fields based on the current attributes of the form and allow the user to change them
  end

  patch '/powers/:id' do # UPDATE
    #use the :id slug's key in the params hash to find a power by its ID
    #make the changes from the form to the attributes of the power and commit those changes to the DB
    #redirect the user to the show page for the power that they editted
  end

  delete '/powers/:id' do # DESTROY
    #use the :id slug's key in the params hash to find a power by its ID
    #then we will delete that power from the DB and redirect the user back to the index of all powers 
  end



end
