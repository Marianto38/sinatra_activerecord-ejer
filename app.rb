require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require_relative "config/application"

# para poder usar delete, patch, get, post, necesitamos escribir aqui...

configure :development do
  use Rack::MethodOverride # habilita metodos
end

# 1 Read = Get ruta principal

get "/" do
  erb :home
end

# 2 Read = Get ruta principal para mostrar los restaurantes

get "/restaurants" do
  @restaurants = Restaurant.all
  erb :index # para mostrar una vista
end

# 3 Read = Get ruta principal para mostrar los restaurantes
# el new y el get van juntos

get "/restaurants/new" do
  @restaurant = Restaurant.new
  erb :new
end

# 4 POST guardar datos nuevos restaurantes
post "/restaurants" do
  Restaurant.create(
    name: params[:name],
    city: params[:city],
    address: params[:address],
    image_url: params[:image_url],
    phone_numer: params[:phone_numer]
  )
  redirect to "/restaurants"
end

# 5 SHOW
get "/restaurants/:id" do
@restaurant = Restaurant.find(params[:id])

erb :show
end

# 6 para editar o modificar datos
get "/restaurants/:id/edit" do
  @restaurant = Restaurant.find(params[:id])
  erb :edit
end

# 7 patch para guardar los datos modificados
patch "/restaurants/:id" do
  @restaurant = Restaurant.find(params[:id])
  @restaurant.update(name: params[:name], address: params[:address], city: params[:city], phone_numer: params[:phone_numer], type_food: params[:type_food], image_url: params[:image_url])
  redirect to "/restaurants/#{@restaurant.id}"
end
# 8 Borrar
delete "/restaurants/:id" do
  Restaurant.find(params[:id]).destroy!
  redirect to "/restaurants"
end
