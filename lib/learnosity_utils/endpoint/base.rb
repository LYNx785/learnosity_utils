require 'net/http'
require 'learnosity/sdk/request/init'

module LearnosityUtils
  module EndPoint
    module Base

      def request(data_request = nil, endpoint = nil, action = 'get', service = 'data')
        init = Learnosity::Sdk::Request::Init.new(
            service,
            LearnosityUtils.configuration.security_packet,
            LearnosityUtils.configuration.consumer_secret,
            data_request,
            action
        )

        request = init.generate
        remote = Net::HTTP.post_form URI("#{site}#{endpoint}"), request
        body = JSON.parse remote.body, symbolize_names: true

        if body[:meta][:code] == 42000
          sleep LearnosityUtils.configuration.retry_delay
          request(data_request, endpoint, action, service)
        else
          body
        end
      end

      private

      def site
        "https://data.learnosity.com/v#{LearnosityUtils.configuration.version}/"
      end

    end
  end
end