class PostcodeSearchesController < ApplicationController
  def new; end

  def create
    rq = postcodes_io.find(permitted_params.dig(:postcode))

    if rq[:status] != 200
      flash[:error] = rq[:error]
    else
      flash[:notice] = "You appear to be on our serviceable area."
    end

    render :new
  end

  private

  def permitted_params
    params.permit(:postcode, :authenticity_token)
  end
end
