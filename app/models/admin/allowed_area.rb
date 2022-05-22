# frozen_string_literal: true

module Admin
  class AllowedArea < ApplicationRecord
    validates :area, presence: true
    validates :area, uniqueness: true

    before_save { normalised_area }

    private

    def normalised_area
      return if area.nil?

      self.area = area.split(' ').first.downcase
    end
  end
end
