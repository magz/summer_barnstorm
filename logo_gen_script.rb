require "Rmagick"
include Magick
colors_and_team_names = [["#b31633", "Angels"], ["#95331c", "Astros"], ["#1a8408", "Athletics"], ["#0c57c7", "Blue_Jays"], ["#2e0160", "Braves"], ["#917645", "Brewers"], ["#c02138", "Cardinals"], ["#04316a", "Cubs"], ["#a31c2f", "Diamondbacks"], ["#035aa2", "Dodgers"], ["#f85d00", "Giants"], ["#fb042d", "Indians"], ["#0e2b59", "Mariners"], ["#00a0ae", "Marlins"], 
["#02297c", "Mets"], ["#b31633", "Nationals"], ["#f65200", "Orioles"], ["#02204a", "Padres"], ["#d60024", "Phillies"], ["#000000", "Pirates"], ["#04307e", "Rangers"], ["#022661", "Rays"], ["#c9321d", "Red_Sox"], ["#ff0028", "Reds"], ["#33326a", "Rockies"], ["#162e83", "Royals"], ["#00113c", "Tigers"], ["#d60121", "Twins"], 
["#000000", "White_Sox"], ["#001c43", "Yankees"]]

RADIUS = 67
IMAGE_SIZE = 150

colors_and_team_names.each do |color, team|
	disc_layer = Image.new(150, 150)
	disc_layer.transparent_color = "white"

	circle = Draw.new
	circle.fill_color(color)
	circle.stroke_width = 0
	circle.circle(IMAGE_SIZE/2, IMAGE_SIZE/2, IMAGE_SIZE/2 + RADIUS, IMAGE_SIZE/2)
	circle.draw(disc_layer)

	img_list = ImageList.new("app/assets/images/small_logo_icons/" + team + ".png", disc_layer)
	img_list[0].page = Rectangle.new(img_list[0].page.width, img_list[0].page.height, (IMAGE_SIZE/2 - img_list[0].page.width/2), (IMAGE_SIZE/2 - img_list[0].page.height/2))
	img_list.flatten_images.write "assets/team_logos/small/color_test_" + team + ".png"

	# img.transparent("white").write(team + ".png")

end
