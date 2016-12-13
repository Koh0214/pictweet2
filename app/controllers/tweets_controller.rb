class TweetsController < ApplicationController
    before_action :move_to_index, except: :index 

  def index
    @tweets = Tweet.order("id DESC").page(params[:page]).per(5) # Tweet.all.order("id DESC")のallを省略できる。
  end


  def new
  end

  def create
    Tweet.create(name: tweet_params[:name], image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private 
  def tweet_params
    params.permit(:name, :image, :text)
  end

end
