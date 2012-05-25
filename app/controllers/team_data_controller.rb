class TeamDataController < ApplicationController
  # GET /team_data
  # GET /team_data.json
  def index
    @team_data = TeamDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @team_data }
    end
  end

  # GET /team_data/1
  # GET /team_data/1.json
  def show
    @team_datum = TeamDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team_datum }
    end
  end

  # GET /team_data/new
  # GET /team_data/new.json
  def new
    @team_datum = TeamDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team_datum }
    end
  end

  # GET /team_data/1/edit
  def edit
    @team_datum = TeamDatum.find(params[:id])
  end

  # POST /team_data
  # POST /team_data.json
  def create
    @team_datum = TeamDatum.new(params[:team_datum])

    respond_to do |format|
      if @team_datum.save
        format.html { redirect_to @team_datum, notice: 'Team datum was successfully created.' }
        format.json { render json: @team_datum, status: :created, location: @team_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @team_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /team_data/1
  # PUT /team_data/1.json
  def update
    @team_datum = TeamDatum.find(params[:id])

    respond_to do |format|
      if @team_datum.update_attributes(params[:team_datum])
        format.html { redirect_to @team_datum, notice: 'Team datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_data/1
  # DELETE /team_data/1.json
  def destroy
    @team_datum = TeamDatum.find(params[:id])
    @team_datum.destroy

    respond_to do |format|
      format.html { redirect_to team_data_url }
      format.json { head :no_content }
    end
  end
end
