# frozen_string_literal: true

module Admin
  class AllowedPostcode < ApplicationRecord
    POSTCODE_REGEX = /\A[A-Z]{1,2}[0-9][A-Z0-9]? ?[0-9][A-Z]{2}\z/.freeze

    validates :postcode, presence: true
    validates :postcode, uniqueness: true
    validates_format_of :postcode, with: POSTCODE_REGEX
  end
end
