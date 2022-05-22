# frozen_string_literal: true

class PostcodeSearchesController < ApplicationController
  def new; end

  def create
    message = ResponseLogic.new(
      normalised_postcode,
      postcodes_io.find(normalised_postcode)
    ).call

    redirect_to(root_url, flash: message)
  end

  private

  def normalised_postcode
    permitted_params[:postcode].delete(' ').downcase
  end

  def permitted_params
    params.permit(:postcode, :authenticity_token, :commit)
  end
end
