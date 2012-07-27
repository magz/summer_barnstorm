class MainController < ApplicationController
  require "browser"
  include MainControllerHelpers

    caches_action :welcome, :if => proc {!@browser.mobile?}, :cache_path => Proc.new {|c| (c.params[:team] || c.params[:team1])}, :expires_in => 2.hours

    def welcome
      puts "mobile browser"
      puts @browser.mobile?
      puts "and here it is again"
      puts "http://#{request.host}:#{request.port.to_s + request.fullpath}"
      puts "http://#{request.host}:#{request.port.to_s + request.fullpath}" =~ /toppspennnant/
      if (("http://#{request.host}:#{request.port.to_s + request.fullpath}" =~ /toppspennnant/) && (params[:team] || params[:team1]))
        redirect_to "timecapsule/" + (params[:team] || params[:team1]) and return
      end
      @team = parse_team_name(params)
      
      @tagline = @team ? @team.tagline : "Every team. Every game. Every play. 1952 to today."
      
      @overlay_images = get_overlay_images(@team)


    end

  
  def timecapsule
    
    team = parse_team_name(params)
    @team_name = (team == nil) ? nil : team.name

    @teams = Team.all

    @twitter_feed_hashes = []
    @teams.each do |t|
      if t.promo_start_date != nil && t.promo_end_date && t.promo_start_date < Time.now && t.promo_end_date > Time.now
        @twitter_feed_hashes << t.twitter_tags
      end
    end
    @twitter_feed_hashes = @twitter_feed_hashes.flatten.join(" OR ")


  end

  def test
    @teams = Team.all
    @twitter_feed_hashes = []
    Team.all.each do |t|
      if t.promo_start_date != nil && t.promo_end_date && t.promo_start_date < Time.now && t.promo_end_date > Time.now
        @twitter_feed_hashes << t.twitter_tags
      end
    end
    @twitter_feed_hashes = @twitter_feed_hashes.flatten.join(" OR ")


  end
  
  def send_link
    return_message = ""

    puts "phone " + params[:phone_number]
    puts params[:phone_number] != ""
    if params[:phone_number] && params[:phone_number] != ""
      puts "ok were in here"
      @target_number = params["phone_number"]
      puts @target_number
        unless @target_number[0] == "1"
          @target_number = "1" + @target_number
        end

        sms = Moonshado::Sms.new(@target_number, "Topps Pennant in the App Store! http://bit.ly/I9RkAM")
        sms.deliver_sms
        return_message += "sms message sent \n"
    end

    if params[:mailing_list] && params[:email_address] != "" 
      puts "ok we're in the emailer"
      Pony.mail(:to => params[:email_address], :from => 'support@pennant.topps.com', 
        :subject => "Topps Bunt App Store Link", :body => "Topps Pennant in the App Store! http://bit.ly/I9RkAM")
      return_message += "email_message_sent"
    end

    unless return_message == ""
      puts return_message
      render json: return_message
    else
      render json: "failure"
    end
        
  end



  def how_to

  end

  def team_page


  end

  def giveaway_rules

  end

  # def team_page_redirector(team=nil)
  #   if team
  #     if defunct_team?(team)
  #        path = ""
  #     else
  #        path = correct_for_as_and_diamondbacks(team.split("_")[-1])
  #     end
  #   else
  #     path = ""
  #   end
  
  #   redirect_to "http://pennant.topps.com/" + path
  # end

  # # def defunct_team?(team)
  # #   %w(kansascity_athletics
  # #   philadelphia_athletics
  # #   boston_braves
  # #   milwaukee_braves
  # #   stlouis_browns
  # #   brooklyn_dodgers
  # #   montreal_expos
  # #   newyork_giants
  # #   seattle_pilots
  # #   washington_senators
  # #   ).include? team
  # # end

  # def correct_for_as_and_diamondbacks(team_name)
  #   case team_name
  #     when "athletics" 
  #       "as"
  #     when "diamondbacks" 
  #       "dbacks"
  #     else
  #       team_name
  #     end
  # end
end
