# frozen_string_literal: true

module Admin
  class AllowedArea < ApplicationRecord
    validates :area, presence: true
    validates :area, uniqueness: true
  end
end
