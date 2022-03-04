class JokesController < ApplicationController
  before_action :set_joke, only: [:show, :update, :destroy]

  def index
    @jokes = Joke.all
    render json: @jokes
  end

  def create
    @joke = Joke.create(joke_params)
    if @joke.errors.any?
      render json: @joke.errors, status: 422
    else
      render json: @joke, status: 201
    end
  end

  def show
    render json: @joke
  end

  def update
    @joke.update(joke_params)
    if @joke.errors.any?
      render json: @joke.errors, status: 422
    else
      render json: @joke, status: 200
    end
  end

  def destroy
    @joke.delete
    render json: @joke, status: 204
  end

  def random
    if params[:category]
      puts "Searching for #{params[:category]} jokes"
      count = Joke.find_by_category(params[:category]).count
      if count.zero?
        render json: { error: "No jokes of that category" }, status: 400
      elsif Joke.find_by_category(params[:category])
      end
    elsif @joke = Joke.all.sample
      render json: @joke, status: 200
    end
  end

  private

  def joke_params
    params.permit(:category_id, :body, :id)
  end

  def set_joke
    begin
      @joke = Joke.find(params[:id])
    rescue
      render json: { error: "Joke not found" }, status: 404
    end
  end
end
