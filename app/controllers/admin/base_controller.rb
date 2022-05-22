# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    http_basic_authenticate_with(
      name: ENV['BASIC_AUTH_NAME'],
      password: ENV['BASIC_AUTH_PASSWORD']
    )
  end
end
