# frozen_string_literal: true

module Admin
  class AllowedAreasController < ApplicationController
    before_action :set_admin_allowed_area, only: %i[show edit update destroy]

    # GET /admin/allowed_areas
    def index
      @admin_allowed_areas = Admin::AllowedArea.all
    end

    # GET /admin/allowed_areas/1
    def show; end

    # GET /admin/allowed_areas/new
    def new
      @admin_allowed_area = Admin::AllowedArea.new
    end

    # GET /admin/allowed_areas/1/edit
    def edit; end

    # POST /admin/allowed_areas
    def create
      @admin_allowed_area = Admin::AllowedArea.new(admin_allowed_area_params)

      if @admin_allowed_area.save
        redirect_to @admin_allowed_area, notice: 'Allowed area was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /admin/allowed_areas/1
    def update
      if @admin_allowed_area.update(admin_allowed_area_params)
        redirect_to @admin_allowed_area, notice: 'Allowed area was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /admin/allowed_areas/1
    def destroy
      @admin_allowed_area.destroy
      redirect_to admin_allowed_areas_url, notice: 'Allowed area was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_admin_allowed_area
      @admin_allowed_area = Admin::AllowedArea.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_allowed_area_params
      params.require(:admin_allowed_area).permit(:area)
    end
  end
end
