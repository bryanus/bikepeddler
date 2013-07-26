#!/bin/env ruby
# encoding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
  	
  end

private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
  	redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

  def correct_user(user)
    current_user == user
  end

  helper_method :correct_user

  #are these in the right place? should they be in post controller? Or can I put these into the model? how?
  def listing_type(id)
    if id == 0
      "For Sale"
    elsif id == 1
      "Wanted"
    else 
      "Trade"
    end
  end

  helper_method :listing_type

  def currency_type(id)
    if id == 0
      "USD $"
    elsif id == 1
      "CAD $"
    elsif id == 2
      "GPB £"
    else 
      "Euro €"
    end
  end

  helper_method :currency_type


  def check_time_since_post(comment)
    (Time.zone.now - comment.updated_at) <= 900 #15 mins
  end

  helper_method :check_time_since_post

  def created_at_time(post)
    Date.strptime(post.created_at.to_s, "%Y-%m-%d %H:%M:%S %Z").strftime("%m/%d/%Y")
  end

  helper_method :created_at_time

  def updated_at_time(post)
    Date.strptime(post.updated_at.to_s, "%Y-%m-%d %H:%M:%S %Z").strftime("%m/%d/%Y")
  end

  helper_method :updated_at_time

end
