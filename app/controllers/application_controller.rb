class ApplicationController < ActionController::Base
	#csfr?  is there a reason that's off?  
	before_filter :get_browser

	def get_browser
      @browser = Browser.new(ua: request.env['HTTP_USER_AGENT'], :accept_language => "en-us")
	end

end
