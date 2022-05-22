class ResponseLogic
  def initialize(postcode)
    @postcode = postcode
    @response = response
  end

  def call
    case @response[:status]
    when 400, 404
      if find_by_postcode(normalised_postcode(@postcode))
        { notice: 'We do operate in your postcode.' }
      else
        { error: @response[:error] }
      end
    when 200
      if find_by_area(normalised_area(@response[:lsoa]))
        { notice: 'We do operate in your area.' }
      else
        { error: 'Apologies, we currently do not operate in your area.' }
      end
    else
      # Would log this for later analysis
      { error: "We can't verify your request at this time."}
    end
  end

  private

  def normalised_postcode(postcode)
    postcode.delete(' ').downcase
  end

  def normalised_area(area)
    area.split(' ').first.downcase
  end

  def find_by_postcode(postcode)
    Admin::AllowedPostcode.find_by(postcode: postcode)
  end

  def find_by_area(area)
    Admin::AllowedArea.find_by(area: area)
  end
end
