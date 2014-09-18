class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new movie_params
    if @movie.save
      redirect_to root_path, notice: "Successfully created movie"
    else
      render 'new'
    end
  end

  private
    def movie_params
      params.require(:movie).permit(:name, :description, :tag_line)
    end
end
