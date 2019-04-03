require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do

    erb :welcome
  end

get "/artists" do
  @artists = Artist.all
  erb :index
end

get "/artists/new" do

  erb :new
end

post "/artist" do
  @artist = Artist.create(params)
  redirect to "artist/#{@artist.id}"
end



get '/artist/:id' do
  @artist = Artist.find(params[:id])
  erb :show
end


get "/artist/:id/edit" do
  @artist = Artist.find_by(params[:id])
  erb :edit
end



patch "/artist/:id" do
  @artist = Artist.find_by(params[:id])
  @artist.name = params[:name]
  @artist.age = params[:age]
  @artist.bio = params[:bio]
  @artist.save
  redirect to "/artists/#{artist.id}"

end

delete "/artist/:id/delete" do
  @artist = Artist.find(params[:id])
  @artist.destroy
  redirect to "/artists"
end



end
