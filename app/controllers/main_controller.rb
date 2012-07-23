class MainController < ApplicationController
  require "browser"
  include MainControllerHelpers

    def welcome

      logger.info @browser
      team_param = (params[:team] || params[:team1])
      
      if team_param != nil
        team_param = "athletics" if team_param == "as"
        team_param = "diamondbacks" if team_param == "dbacks"
        team_param = "white_sox" if team_param == "whitesox"
        team_param = "red_sox" if team_param == "redsox"  
        team_param = "blue_jays" if team_param == "blue_jays"
          
        team_param = Team.team_hash2[team_param.upcase] if team_param.length == 3
      end
      @team = Team.find_by_name team_param

      @tagline = @team ? @team.tagline : "Every team. Every game. Every play. 1952 to today."
      
      @overlay_images = get_overlay_images(@team)


    end

  
  def timecapsule
    if params[:redirect]
      team_page_redirector(params[:team1])
    end
    
    @teams = Team.all


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

  def team_page_redirector(team=nil)
    if team
      if defunct_team?(team)
         path = ""
      else
         path = correct_for_as_and_diamondbacks(team.split("_")[-1])
      end
    else
      path = ""
    end
  
    redirect_to "http://pennant.topps.com/" + path
  end

  def defunct_team?(team)
    %w(kansascity_athletics
    philadelphia_athletics
    boston_braves
    milwaukee_braves
    stlouis_browns
    brooklyn_dodgers
    montreal_expos
    newyork_giants
    seattle_pilots
    washington_senators
    ).include? team
  end

  def correct_for_as_and_diamondbacks(team_name)
    case team_name
      when "athletics" 
        "as"
      when "diamondbacks" 
        "dbacks"
      else
        team_name
      end
  end
end
