class TweetsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @tweets = Tweet.order("id DESC").page(params[:page]).per(5) # Tweet.all.order("id DESC")のallを省略できる。
  end


  def new
  end

  def create
    Tweet.create(tweet_params)
  end

  def move_to_index
    redirect_to action: :index
  end

  private 
  def tweet_params
    params.permit(:name, :image, :text)
  end

end
