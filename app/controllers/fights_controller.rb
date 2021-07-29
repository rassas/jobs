class FightsController < ApplicationController
  before_action :set_fight, only: :show

  # GET /fights
  def index
    @fights = Fight.all
  end

  # GET /fights/1
  def show
  end

  # GET /fights/new
  def new
    @fight = Fight.new
    2.times { @fight.fight_participations.build }
  end

  # POST /fights
  def create
    @fight = Fight.new(fight_params)

    respond_to do |format|
      if @fight.save
        format.html { redirect_to @fight, notice: "#{I18n.t("activerecord.models.fight").capitalize} #{I18n.t('controllers.notice.successfully_created')}" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fight
      @Fight = Fight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fight_params
      params.require(:fight).permit(
        fight_participations_attributes: [
          :character_id
        ]
      )
    end
end
