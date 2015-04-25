class HomeController < ApplicationController
  def index

  ***REMOVED***

  def tweets
    unless params[:nickname].blank?
      @nickname = params[:nickname]
      options = {:count => 3, :include_rts => true}
      @search  = $twitter.user_timeline(@nickname, options)
    else
      redirect_to root_path, notice: 'Please set twitter name'
    ***REMOVED***
  ***REMOVED***
***REMOVED***
