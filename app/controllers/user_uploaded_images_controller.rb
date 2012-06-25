class UserUploadedImagesController < ApplicationController
  
  # require "Base64"
  require "RMagick"
  include Magick
  # GET /user_uploaded_images
  # GET /user_uploaded_images.json
  def index
    @user_uploaded_images = UserUploadedImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_uploaded_images }
    end
  end

  # GET /user_uploaded_images/1
  # GET /user_uploaded_images/1.json
  def show
    @user_uploaded_image = UserUploadedImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_uploaded_image }
    end
  end

  # GET /user_uploaded_images/new
  # GET /user_uploaded_images/new.json
  def new
    @user_uploaded_image = UserUploadedImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_uploaded_image }
    end
  end

  # GET /user_uploaded_images/1/edit
  def edit
    @user_uploaded_image = UserUploadedImage.find(params[:id])
  end

  #POST /user_uploaded_images
  #POST /user_uploaded_images.json
  def create
  #   if params[:access_key]
  #     #check if access_key is correct
  #     if Digest::MD5.hexdigest(request.body.read + "images_are_great") == params[:access_key]
        @u = UserUploadedImage.new
        @u.team1 = Team.app_team_hash[params[:team1]]
        @u.team2 = Team.app_team_hash[params[:team2]]
        
       puts "body data --"
       
       if params["image.jpg"]
         begin
          @u.screenshot = params["image.jpg"]
          puts "ok that went through..."
         rescue
          puts "in rescue"
          temp_filepath = File.join(Rails.root, "public", "tmp",Time.now.to_s + ".jpg" )

          i=(Image.from_blob Base64.decode64 params["image.jpg"].read)[0]
          i.write(temp_filepath)

          @u.screenshot = File.open(temp_filepath)
         end
       else
         puts "image upload param not found"
         temp_filepath = File.join(Rails.root, "public", "tmp",Time.now.to_s + ".jpg" )

         i=(Image.from_blob Base64.decode64 request.body.read)[0]
         i.write(temp_filepath)
         @u.screenshot = File.open(temp_filepath)
       end

        
        
        

         if @u.save
            render json: {message: "successs", image: @u, url: @u.screenshot.url}, status: :created
         else
            render json: {message: "something went wrong", image: nil, url: nil}, status: :unprocessable_entity
         end
         
  end

  # PUT /user_uploaded_images/1
  # PUT /user_uploaded_images/1.json
  def update
    @user_uploaded_image = UserUploadedImage.find(params[:id])

    respond_to do |format|
      if @user_uploaded_image.update_attributes(params[:user_uploaded_image])
        format.html { redirect_to @user_uploaded_image, notice: 'User uploaded image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_uploaded_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_uploaded_images/1
  # DELETE /user_uploaded_images/1.json
  def destroy
    @user_uploaded_image = UserUploadedImage.find(params[:id])
    @user_uploaded_image.destroy

    respond_to do |format|
      format.html { redirect_to user_uploaded_images_url }
      format.json { head :no_content }
    end
  end
end
