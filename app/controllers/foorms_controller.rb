class FoormsController < ApplicationController
  before_action :set_foorm, only: %i[ show edit update destroy submissions ]

  # GET /foorms or /foorms.json
  def index
    @foorms = Foorm.all
  end
  # GET /foorms/new

  def new
    @foorm = Foorm.new
  end

  # GET /foorms/1/edit
  def edit
  end

  # POST /foorms or /foorms.json
  def create
    @foorm = Foorm.new(foorm_params)

    respond_to do |format|
      if @foorm.save
        format.html { redirect_to edit_foorm_path(@foorm), notice: "Foorm was successfully created." }
        format.json { render :show, status: :created, location: @foorm }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @foorm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foorms/1 or /foorms/1.json
  def update
    respond_to do |format|
      if @foorm.update(foorm_params)
        format.html { redirect_to edit_foorm_path(@foorm), notice: "Foorm was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @foorm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @foorm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foorms/1 or /foorms/1.json
  def destroy
    @foorm.destroy!

    respond_to do |format|
      format.html { redirect_to foorms_path, notice: "Foorm was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  def submissions
    @submissions = Submission.for_form(@foorm.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foorm
      @foorm = Foorm.includes(form_items: :form_item_options).find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def foorm_params
      params.expect(foorm: [ :title, form_items_attributes: [ [ :id, :label, :item_type, :_destroy, form_item_options_attributes: [ [ :id, :label, :value, :_destroy ] ] ] ] ])
    end
end
