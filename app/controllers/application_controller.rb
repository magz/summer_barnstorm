class ApplicationController < ActionController::Base
	#csfr?  is there a reason that's off?  
	before_filter :get_browser, :instantiate_controller_and_action_names


	def get_browser
      @browser = Browser.new(ua: request.env['HTTP_USER_AGENT'], :accept_language => "en-us")
	  puts "full path is: " + request.fullpath 
	  puts "http://#{request.host}:#{request.port.to_s + request.fullpath}"
	end
  	def instantiate_controller_and_action_names
      @current_action = action_name
      @current_controller = controller_name
  	end

end
