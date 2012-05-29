require "Rmagick"
include Magick
colors_and_team_names = [["#b31633", "Angels"], ["#95331c", "Astros"], ["#1a8408", "Athletics"], ["#0c57c7", "Blue_Jays"], ["#2e0160", "Braves"], ["#917645", "Brewers"], ["#c02138", "Cardinals"], ["#04316a", "Cubs"], ["#a31c2f", "Diamondbacks"], ["#035aa2", "Dodgers"], ["#f85d00", "Giants"], ["#fb042d", "Indians"], ["#0e2b59", "Mariners"], ["#00a0ae", "Marlins"], 
["#02297c", "Mets"], ["#b31633", "Nationals"], ["#f65200", "Orioles"], ["#02204a", "Padres"], ["#d60024", "Phillies"], ["#000000", "Pirates"], ["#04307e", "Rangers"], ["#022661", "Rays"], ["#c9321d", "Red_Sox"], ["#ff0028", "Reds"], ["#33326a", "Rockies"], ["#162e83", "Royals"], ["#00113c", "Tigers"], ["#d60121", "Twins"], 
["#000000", "White_Sox"], ["#001c43", "Yankees"]]

RADIUS = 33
IMAGE_SIZE = 75

GREY = "#b0aeae"

disc_layer = Image.new(IMAGE_SIZE, IMAGE_SIZE)
disc_layer.transparent_color = "white"

circle = Draw.new
circle.fill_color(GREY)
circle.stroke_width = 0
circle.circle(IMAGE_SIZE/2, IMAGE_SIZE/2, IMAGE_SIZE/2 + RADIUS, IMAGE_SIZE/2)
circle.draw(disc_layer)
disc_layer.write("app/assets/images/small_logo_icons/grey_blank_color_disc.png")


colors_and_team_names.each do |color, team|
	disc_layer = Image.new(IMAGE_SIZE, IMAGE_SIZE)
	disc_layer.transparent_color = "white"

	circle = Draw.new
	circle.fill_color(color)
	circle.stroke_width = 0
	circle.circle(IMAGE_SIZE/2, IMAGE_SIZE/2, IMAGE_SIZE/2 + RADIUS, IMAGE_SIZE/2)
	circle.draw(disc_layer)
	disc_layer.write("app/assets/images/small_logo_icons/" + team + "_blank_color_disc.png")


	img_list = ImageList.new("app/assets/images/small_logo_icons/" + team + "_small.png", "app/assets/images/small_logo_icons/" + team + "_blank_color_disc.png")
	img_list[0].page = Rectangle.new(img_list[1].page.width, img_list[1].page.height, (IMAGE_SIZE/2 - img_list[0].page.width/2), (IMAGE_SIZE/2 - img_list[0].page.height/2))
	img_list.reverse.flatten_images.write "app/assets/images/small_logo_icons/color_disc_" + team.downcase + ".png"

	img_list = ImageList.new("app/assets/images/small_logo_icons/" + team + "_small.png", "app/assets/images/small_logo_icons/grey_blank_color_disc.png")
	img_list[0].page = Rectangle.new(img_list[1].page.width, img_list[1].page.height, (IMAGE_SIZE/2 - img_list[0].page.width/2), (IMAGE_SIZE/2 - img_list[0].page.height/2))
	img_list.reverse.flatten_images.write "app/assets/images/small_logo_icons/grey_disc_" + team.downcase + ".png"


	# img.transparent("white").write(team + ".png")

end
