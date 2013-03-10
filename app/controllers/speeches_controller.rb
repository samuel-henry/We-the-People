class SpeechesController < ApplicationController
  # GET /speeches
  # GET /speeches.json
  def index
    @speeches = Speech.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @speeches }
    end
  end

  # GET /speeches/1
  # GET /speeches/1.json
  def show
    @speech = Speech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @speech }
    end
  end

  # GET /speeches/new
  # GET /speeches/new.json
  def new
    @speech = Speech.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @speech }
    end
  end

  # GET /speeches/1/edit
  def edit
    @speech = Speech.find(params[:id])
  end

  # POST /speeches
  # POST /speeches.json
  def create
    #@speech = Speech.new(params[:speech])
    @speech = Speech.new
    @speech.date = params[:speech][:date]
    @speech.location = params[:speech][:location]
    @speech.speaker = params[:speech][:speaker]
    @speech.title = params[:speech][:title]
    @speech.text = params[:speech][:text].split

    respond_to do |format|
      if @speech.save
        format.html { redirect_to @speech, notice: 'Speech was successfully created.' }
        format.json { render json: @speech, status: :created, location: @speech }
      else
        format.html { render action: "new" }
        format.json { render json: @speech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /speeches/1
  # PUT /speeches/1.json
  def update
    
    @speech = Speech.find(params[:id])
    params[:speech][:text] = params[:speech][:text].split
    respond_to do |format|
      if @speech.update_attributes(params[:speech])
        format.html { redirect_to @speech, notice: 'Speech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @speech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /speeches/1
  # DELETE /speeches/1.json
  def destroy
    @speech = Speech.find(params[:id])
    @speech.destroy

    respond_to do |format|
      format.html { redirect_to speeches_url }
      format.json { head :no_content }
    end
  end
end
