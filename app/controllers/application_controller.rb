#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery


  def home
  	@title = "Formulaires destinés aux prospects"
  end



 end