class PostcodeSearchesController < ApplicationController
  def new; end

  def create
    response = postcodes_io.find(normalised_postcode)
    message = ResponseLogic.new(normalised_postcode, response).call

    redirect_to(root_url, flash: message)
  end

  private

  def normalised_postcode
    permitted_params.dig(:postcode).delete(' ').downcase
  end

  def permitted_params
    params.permit(:postcode, :authenticity_token, :commit)
  end
end
