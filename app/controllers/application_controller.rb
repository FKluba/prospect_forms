#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

	before_filter :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy]

  def home
  	@title = "Formulaires destinés aux prospects"
  end



 end