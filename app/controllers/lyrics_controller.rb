class LyricsController < ApplicationController
  before_action :set_lyric, only: [:show, :edit, :update, :destroy]

  # GET /lyrics
  # GET /lyrics.json
  def index
    @lyrics = Lyric.all
    if params[:search]
    @lyrics = Lyric.search(params[:search]).order("created_at DESC")

else
    @lyrics = Lyric.all.order('created_at DESC')
  end
  end

  # GET /lyrics/1
  # GET /lyrics/1.json
  def show
    if @lyric.youtube_link.present?
    if @lyric.youtube_link.include?("https://www.youtube.com/watch?v=")
      @youtube_id = @lyric.youtube_link.split("https://www.youtube.com/watch?v=").last
      @youtube_url = "https://www.youtube.com/watch?v=#{@youtube_id}"
    elsif @lyric.youtube_link.include?("https://youtu.be/")
      @youtube_id = @lyric.youtube_link.split("https://youtu.be/").last
      @youtube_url = "https://youtu.be/#{@youtube_id}"
    else
      @youtube_id = "none"
    end
  end
  end

  # GET /lyrics/new
  def new
    @lyric = Lyric.new
  end

  # GET /lyrics/1/edit
  def edit
  end

  # POST /lyrics
  # POST /lyrics.json
  def create
    @lyric = Lyric.new(lyric_params)
    @lyric.user_id = current_user.id
    respond_to do |format|
      if @lyric.save
        format.html { redirect_to @lyric, notice: 'Lyric was successfully created.' }
        format.json { render :show, status: :created, location: @lyric }
      else
        format.html { render :new }
        format.json { render json: @lyric.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lyrics/1
  # PATCH/PUT /lyrics/1.json
  def update
    respond_to do |format|
      if @lyric.update(lyric_params)
        format.html { redirect_to @lyric, notice: 'Lyric was successfully updated.' }
        format.json { render :show, status: :ok, location: @lyric }
      else
        format.html { render :edit }
        format.json { render json: @lyric.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lyrics/1
  # DELETE /lyrics/1.json
  def destroy
    @lyric.destroy
    respond_to do |format|
      format.html { redirect_to lyrics_url, notice: 'Lyric was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lyric
      @lyric = Lyric.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lyric_params
      params.require(:lyric).permit(:name, :description, :lyrics, :artist, :user_id, :youtube_link)
    end
end
