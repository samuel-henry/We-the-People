class SpeechesController < ApplicationController
  require 'ruby-aws'

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
    @speech = Speech.new(params[:speech])

    @speech[:speech_text].split(" ").uniq.each do |speech_word|
      speech_word = speech_word.downcase.gsub(/[^a-z\s]/, '')
      word = Word.find_by word: speech_word
      if word.nil?
          word = Word.new
          word[:word] = speech_word
        if File.exist?("#{Rails.root}/public/audios/#{speech_word}.mp3")
          word[:status] = "completed"
        else
          @mturk = Amazon::WebServices::MechanicalTurkRequester.new :Host => :Sandbox
          question_file = File.read("#{Rails.root}/app/assets/external_hit.question")
          properties_file = Amazon::Util::DataReader.load( "#{Rails.root}/app/assets/external_hit.properties", :Properties )
          input = [{:words=>speech_word}]
          hits = @mturk.createHITs(properties_file, question_file, input)
          hit_id = hits[:Created].first[:HITId]
          hit_type_id = hits[:Created].first[:HITTypeId]
          word[:hit_id] = hit_id
          word[:status] = "posted"
          if @mturk.host =~ /sandbox/
            word[:url] = "http://workersandbox.mturk.com/mturk/preview?groupId=#{hit_type_id}" # Sandbox Url
          else
            word[:url] = "http://mturk.com/mturk/preview?groupId=#{hit_type_id}" # Production Url
          end
        end
        word.save
      end
    end

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
