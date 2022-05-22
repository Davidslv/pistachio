# frozen_string_literal: true

module Admin
  class AllowedPostcode < ApplicationRecord
    POSTCODE_REGEX = /\A[a-zA-Z]{1,2}[0-9][a-zA-Z0-9]? ?[0-9][a-zA-Z]{2}\z/.freeze

    validates :postcode, presence: true
    validates :postcode, uniqueness: true
    validates_format_of :postcode, with: POSTCODE_REGEX

    before_save { normalise_postcode }

    private

    def normalise_postcode
      self.postcode = postcode.delete(' ').downcase
    end
  end
end
