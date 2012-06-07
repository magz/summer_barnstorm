class MainController < ApplicationController
  require "browser"
  
  def welcome
  	@teams = Team.all
  end

  def coming_soon

  end

  def how_to

  end

  def redirector
  	@browser = Browser.new(ua: request.env['HTTP_USER_AGENT'], :accept_language => "en-us")
  	if @browser.mobile?
  		redirect_to "http://click.linksynergy.com/fs-bin/stat?id=HXDYbs8K8P4&offerid=146261&type=3&subid=0&tmpid=1826&RD_PARM1=http%253A%252F%252Fitunes.apple.com%252Fus%252Fapp%252Ftopps-pennant%252Fid514201097%253Fmt%253D8%2526uo%253D4%2526partnerId%253D30"
  		#redirect_to "http://google.com"
  	else
  		render :json => @browser
  	end
  end

  def send_sms
  	
  	
  end
end
