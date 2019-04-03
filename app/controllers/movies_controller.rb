class MoviesController < ApplicationController
    def index
     @movies = Movie.all
    end
    def new
	# default: render ‘new’ template
    end
    def create
      @movie = Movie.create!(params[:movie])
      redirect_to movies_path
    end
end
    
    
def show
  id = params[:id] # retrieve movie ID from URI route
  @movie = Movie.find(id) # look up movie by unique ID
  # will render app/views/movies/show.html.haml by default
end

# in movies_controller.rb
def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
end

def edit
  @movie = Movie.find params[:id]
end
#commit 7
def update
  @movie = Movie.find params[:id]
  @movie.update_attributes!(params[:movie])
  flash[:notice] = "#{@movie.title} was successfully updated."
  redirect_to movie_path(@movie)
end
