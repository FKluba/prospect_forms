#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

	before_filter :authenticate_admin!
	before_filter :define_title

  private


  def define_title
	@title = "Formulaires destinés aux prospects"
  end


 end