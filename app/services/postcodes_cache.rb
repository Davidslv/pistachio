# frozen_string_literal: true

class PostcodesCache
  def initialize
    @cache = {}
  end

  def write(postcode, options = {})
    status = options.fetch(:status, nil)
    lsoa = options.fetch(:lsoa, nil)
    expire_in_seconds = options.fetch(:expire_in_seconds, 300)
    expire_at = Time.now + expire_in_seconds

    @cache[postcode] = {
      status: status,
      lsoa: lsoa,
      postcode: postcode,
      expire_at: expire_at
    }
  end

  def read(postcode)
    @cache[postcode]
  end

  # deletes all data stored
  def clear
    @cache = {}
  end

  # iterates through all stored keys and removes the ones which have expired
  def cleanup
    @cache.delete_if { |_key, data| data[:expire_at] < Time.now }
  end
end
