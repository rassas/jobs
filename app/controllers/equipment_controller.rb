class EquipmentController < ApplicationController
  before_action :set_equipment, only: %i[ show edit update destroy ]

  # GET /equipment
  def index
    if params[:type] == "Weapon"
      @equipment = Weapon.all
    elsif params[:type] == "Shield"
      @equipment = Shield.all
    else
      @equipment = Equipment.all
    end
  end

  # GET /equipment/1
  def show
  end

  # GET /equipment/new
  def new
    @equipment = Equipment.new(type: params[:type])
  rescue ActiveRecord::SubclassNotFound
    redirect_to equipment_index_path
  end

  # GET /equipment/1/edit
  def edit
  end

  # POST /equipment
  def create
    if params[:weapon].present?
      @equipment = Weapon.new(weapon_params)
    elsif params[:shield].present?
      @equipment = Shield.new(shield_params)
    else
      @equipment = Equipment.new(equipment_params)
    end

    respond_to do |format|
      if @equipment.save
        format.html { redirect_to @equipment, notice: "#{I18n.t("activerecord.models.#{@equipment.class.name.downcase}").capitalize} #{I18n.t('controllers.notice.successfully_created')}" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment/1
  def update
    respond_to do |format|
      if @equipment.update(send("#{@equipment.class.name.downcase}_params"))
        format.html { redirect_to @equipment, notice: "#{I18n.t("activerecord.models.#{@equipment.class.name.downcase}").capitalize} #{I18n.t('controllers.notice.successfully_updated')}" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment/1
  def destroy
    @equipment.destroy
    respond_to do |format|
      format.html { redirect_to equipment_index_url(type: @equipment.class.name), notice: "#{I18n.t("activerecord.models.#{@equipment.class.name.downcase}").capitalize} #{I18n.t('controllers.notice.successfully_destroyed')}" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def equipment_params
      params.require(:equipment).permit(:name, :attack_points, :defense_points, :required_experience, :type)
    end

    # Only allow a list of trusted parameters through.
    def weapon_params
      params.require(:weapon).permit(:name, :attack_points, :defense_points, :required_experience)
    end

    # Only allow a list of trusted parameters through.
    def shield_params
      params.require(:shield).permit(:name, :attack_points, :defense_points, :required_experience)
    end
end
