class HomeController < ApplicationController
  def index
    if params[:tweet_text]
      unless params[:tweet_text].blank?
        $twitter.update(params[:tweet_text])
        flash[:notice] ='Great, user gushulo successful tweet'
      else
        flash[:notice] = 'Please write tweet text'
      end
    end
  end

  def tweets
    unless params[:nickname].blank?
      @nickname = params[:nickname]
    else
      redirect_to root_path, notice: 'Please set twitter name'
    end

    if check_twitter_name(@nickname)
      TweetsWorker.perform_async(@nickname)
    else
      redirect_to root_path, notice: 'Please set correct twitter name'
    end
    @tweets = FetchTweet.names(@nickname)
  end


private
  def check_twitter_name(nickname)
    TwitterNameWorker.perform_async(nickname)
  end
end
