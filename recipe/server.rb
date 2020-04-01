require 'sinatra'

require_relative 'recipe'

get '/' do 
    redirect to ('/recipes')
end 

get '/contact_us' do
    @title = "contact us"
    erb :contact 
end 

get '/about_us' do 
    @title = "about us"
    erb :about
end 

get '/legal' do 
    @title = "fine print"
    erb :legal
end 

get '/recipes' do 
    @title = "recipes"
    @recipes = Recipe.all

    erb :recipes 
end 

get '/recipes/:id' do
    id = params[:id] 

    @recipe = Recipe.find(id)
    @title = @recipe.name 

    erb :recipe
end 


get '/form' do 
    erb :form 
end 

get '/edit/:id' do 
    @recipe = Recipe.find(params[:id])

    erb :edit_form
end

put '/recipes/:id' do
puts "post request received..#{params}"
@recipe = Recipe.find(params[:id])
@recipe.update(name: params[:name], 
                prep_time: params[:prepTime],
                description: params[:desc])

                redirect to ('/recipes')
end 

post '/recipes' do 
    puts "post request received..#{params}"
@recipe = Recipe.new
@recipe.name = params[:name] 
@recipe.prep_time = params[:prepTime]
@recipe.description = params[:desc]
@recipe.image = params[:url]

    if @recipe.save
        redirect to ('/recipes')
    else 
        redirect to ('/form')

    end 
end 

delete '/delete/:id' do 
    puts "delete request received..#{params}"
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect to ('/')
end 