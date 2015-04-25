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
      options = {:count => 3, :include_rts => true}
      @search  = $twitter.user_timeline(@nickname, options)
    else
      redirect_to root_path, notice: 'Please set twitter name'
    end
  end
end
