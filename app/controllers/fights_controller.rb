class FightsController < ApplicationController
  before_action :set_fight, only: :show

  # GET /fights
  def index
    @fights = Fight.all.order(created_at: :desc)
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
        format.html { redirect_to @fight }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fight
      @fight = Fight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fight_params
      params.require(:fight).permit(
        fight_participations_attributes: [
          :character_id,
          fight_participation_weapons_attributes: [
            :equipment_id
          ],
          fight_participation_shields_attributes: [
            :equipment_id
          ]
        ]
      )
    end
end
