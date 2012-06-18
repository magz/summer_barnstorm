class MainController < ApplicationController
  require "browser"
  
  def welcome
    @teams = Team.all

  	unless request.remote_ip == "38.105.199.253" || Rails.env == "development"
      redirect_to :coming_soon
    end     

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
  		redirect_to :welcome
  	end
  end

  def send_sms
  	target_number = params[:phone_number]
  	unless target_number[0] == "1"
  		target_number = "1" + target_number
  	end

  	sms = Moonshado::Sms.new(target_number, "http://www.summerbarnstorm.com/redirector")
  	sms.deliver_sms
  	
  	render json: "message sent"
  end

  def team_page


  end
end
