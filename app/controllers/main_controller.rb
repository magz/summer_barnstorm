class MainController < ApplicationController
  def welcome
  	@teams = Team.all
  end

  def coming_soon

  end

end
