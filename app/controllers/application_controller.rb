# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def postcodes_cache
    @postcodes_cache ||= PostcodesCache.new
  end

  def postcodes_io
    PostcodesIo.new(cache: postcodes_cache)
  end
end
