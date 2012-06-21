puts "hi magz"
unless Rails.env.production?
	YAML::load(File.open("#{Rails.root}/config/amazon_s3.yml")).each do |k,v|
		ENV[k] = v

	end
end