require 'net/http'
require 'json'

module Services
  class PostcodesIo
    def initialize(base_url: nil)
      @base_url =  base_url || ENV.fetch('POSTCODES_IO_BASE_URL')
    end

    def find(postcode)
      postcode = normalised_postcode(postcode)

      parse_response get_request(postcode)
    end

    private

    def get_request(postcode)
      Net::HTTP.get_response(postcodes_io_url(postcode))
    end

    def postcodes_io_url(postcode)
      URI("#{@base_url}/postcodes/#{postcode}")
    end

    def parse_response(response)
      json = JSON.parse(response.body)

      response.code === '200' ? success_json(json) : error_json(json)
    end

    def success_json(json)
      postcode = normalised_postcode(json.dig('result', 'postcode'))

      response = {
        status: json['status'],
        lsoa: json.dig('result', 'lsoa'),
        postcode: postcode
      }

      response
    end

    def error_json(json)
      { status: json['status'], error: json['error'] }
    end

    def normalised_postcode(postcode)
      postcode.delete(' ')
    end
  end
end
