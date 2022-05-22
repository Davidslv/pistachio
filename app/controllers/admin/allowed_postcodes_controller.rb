# frozen_string_literal: true

module Admin
  class AllowedPostcodesController < BaseController
    before_action :set_admin_allowed_postcode, only: %i[show edit update destroy]

    # GET /admin/allowed_postcodes
    def index
      @admin_allowed_postcodes = Admin::AllowedPostcode.all
    end

    # GET /admin/allowed_postcodes/1
    def show; end

    # GET /admin/allowed_postcodes/new
    def new
      @admin_allowed_postcode = Admin::AllowedPostcode.new
    end

    # GET /admin/allowed_postcodes/1/edit
    def edit; end

    # POST /admin/allowed_postcodes
    def create
      @admin_allowed_postcode = Admin::AllowedPostcode.new(admin_allowed_postcode_params)

      if @admin_allowed_postcode.save
        redirect_to @admin_allowed_postcode, notice: 'Postcode was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /admin/allowed_postcodes/1
    def update
      if @admin_allowed_postcode.update(admin_allowed_postcode_params)
        redirect_to @admin_allowed_postcode, notice: 'Postcode was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /admin/allowed_postcodes/1
    def destroy
      @admin_allowed_postcode.destroy
      redirect_to admin_allowed_postcodes_url, notice: 'Postcode was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_admin_allowed_postcode
      @admin_allowed_postcode = Admin::AllowedPostcode.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_allowed_postcode_params
      params.require(:admin_allowed_postcode).permit(:postcode)
    end
  end
end
