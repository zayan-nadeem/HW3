# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController

  def index


    @ratings = params[:ratings]
    if @ratings.nil?
	ratings = Movie.ratings
    else
	ratings = @ratings.keys
    end
    
    #next 4 lines, I have taken from net.
    @all_ratings = Movie.ratings.inject(Hash.new) do |all_ratings, rating|
          all_ratings[rating] = @ratings.nil? ? false : @ratings.has_key?(rating)
          all_ratings
    end
   @sort = params[:sort]
  
   if !@sort.nil?
      begin	#if any exception
	@movies = Movie.order("#{@sort} ASC").find_all_by_rating(ratings)
      rescue ActiveRecord::StatementInvalid  #handling exception
 	flash[:warning] = "Cannot Sort"
	@movies = Movie.find_all_by_rating(ratings) 
      end
    else
      @movies = Movie.find_all_by_rating(ratings)
    end 			
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # Look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
