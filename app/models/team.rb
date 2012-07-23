class Team < ActiveRecord::Base
	has_many :user_uploaded_images 
	has_many :mailing_list_emails
 	serialize :alternate_names, Array


	attr_accessible :city, :color, :name, :x_map_point, :y_map_point, :twitter_tags, :abbreviation, :defunct
	serialize :twitter_tags, Array

	default_scope :conditions => { :defunct => false }

	def self.app_team_hash1
		{"CAL"=>"CALIFORNIA_ANGELS",
 		"LAA"=>"LOS_ANGELES_ANGELS",
 		"ANA"=>"ANAHEIM_ANGELS",
 		"HOU"=>"HOUSTON_ASTROS",
 		"KC1"=>"KANSAS_CITY_ATHLETICS",
 		"OAK"=>"OAKLAND_ATHLETICS",
 		"PHA"=>"PHILADELPHIA_ATHLETICS",
 		"TOR"=>"TORONTO_BLUE_JAYS",
 		"MLN"=>"MILWAUKEE_BRAVES",
 		"MIL"=>"MILWAUKEE_BREWERS",
 		"SLA"=>"ST_LOUIS_BROWNS",
 		"SLN"=>"ST_LOUIS_CARDINALS",
 		"HOC"=>"HOUSTON_COLTS",
 		"CHN"=>"CHICAGO_CUBS",
 		"ARI"=>"ARIZONA_DIAMONDBACKS",
 		"BRO"=>"BROOKLYN_DODGERS",
 		"LAN"=>"LOS_ANGELES_DODGERS",
 		"MON"=>"MONTREAL_EXPOS",
 		"SFN"=>"SAN_FRANCISCO_GIANTS",
 		"NY1"=>"NEW_YORK_GIANTS",
 		"CLE"=>"CLEVELAND_INDIANS",
 		"SEA"=>"SEATTLE_MARINERS",
		"FLO"=>"FLORIDA_MARLINS",
 		"NYN"=>"NEW_YORK_METS",
 		"WAS"=>"WASHINGTON_NATIONALS",
 		"BAL"=>"BALTIMORE_ORIOLES",
 		"SDN"=>"SAN_DIEGO_PADRES",
 		"PHI"=>"PHILADELPHIA_PHILLIES",
 		"SE1"=>"SEATTLE_PILOTS",
 		"PIT"=>"PITTSBURGH_PIRATES",
 		"TEX"=>"TEXAS_RANGERS",
 		"TBA"=>"TAMPA_BAY_RAYS",
 		"BOS"=>"BOSTON_RED_SOX",
 		"BSN"=>"BOSTON_BRAVES",
 		"CIN"=>"CINCINATTI_REDS",
 		"COL"=>"COLORADO_ROCKIES",
 		"KCA"=>"KANSAS_CITY_ROYALS",
 		"WS1"=>"WASHINGTON_SENATORS1",
 		"WS2"=>"WASHINGTON_SENATORS2",
 		"DET"=>"DETROIT_TIGERS",
 		"MIN"=>"MINNESOTA_TWINS",
 		"CHA"=>"CHICAGO_WHITE_SOX",
 		"NYA"=>"NEW_YORK_YANKEES",
 		"ATL"=>"ATLANTA_BRAVES"}
	end

def self.team_hash2
			{"ANA"=>"angles",
 		"HOU"=>"astors",
 		"OAK"=>"athletics",
 		"PHA"=>"as",
 		"MIL"=>"brewers",
 		"SLA"=>"browns",
 		"SLN"=>"cardinals",
 		"HOC"=>"colts",
 		"CHN"=>"cubs",
 		"ARI"=>"diamondbacks",
 		"LAN"=>"dodgers",
 		"SFN"=>"giants",
 		"CLE"=>"indians",
 		"SEA"=>"mariners",
		"FLO"=>"marlines",
 		"NYN"=>"mets",
 		"WAS"=>"nationals",
 		"BAL"=>"orioles",
 		"SDN"=>"padres",
 		"PHI"=>"phillies",
 		"PIT"=>"pirates",
 		"TEX"=>"rangers",
 		"TBA"=>"rays",
 		"BOS"=>"red_sox",
 		"CIN"=>"reds",
 		"COL"=>"rockies",
 		"KCA"=>"royals",
 		"DET"=>"tigers",
 		"MIN"=>"twins",
 		"CHA"=>"white_sox",
 		"NYA"=>"yankees",
 		"ATL"=>"braves"}
end
	#this is a utility funciton to get a team from different string formats
	#it'll return the Team object
	#it may return nil
	def self.id_team_by_name(name, include_defunct=false)
		conditions = {}
		unless include_defunct
			conditions.update defunct: false
		end

		if Team.app_team_hash.invert[name]
			name = Team.app_team_hash.invert[name]
		end
		
		if name.length==3
			conditions.update abbreviation: name.upcase
		else

		end
		

		Team.where(conditions).first



	end
end

