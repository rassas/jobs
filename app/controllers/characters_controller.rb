class CharactersController < ApplicationController
  before_action :set_character, only: %i[ show edit update destroy ]

  # GET /characters
  def index
    @characters = Character.all
  end

  # GET /characters/1
  def show
  end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters
  def create
    @character = Character.new(character_params)

    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: "#{I18n.t("activerecord.models.character").capitalize} #{I18n.t('controllers.notice.successfully_created')}" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: "#{I18n.t("activerecord.models.character").capitalize} #{I18n.t('controllers.notice.successfully_updated')}" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url, notice: "#{I18n.t("activerecord.models.character").capitalize} #{I18n.t('controllers.notice.successfully_destroyed')}" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def character_params
      params.require(:character).permit(:name, :health_base_points, :attack_base_points)
    end
end
