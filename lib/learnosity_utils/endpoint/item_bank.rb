require 'rare'
require_relative 'base'

module LearnosityUtils
  module EndPoint
    module ItemBank
      include Base

      extend self

      endpoints = [:items, :items_tags, :questions, :features, :activities]

      instance_eval do
        endpoints.each do |endpoint|
          define_method "get_#{endpoint}" do |references = [], options = {}|
            Rare.throttle rpm: LearnosityUtils.configuration.get_rate, key: 'get' do
              request({references: references, sort: LearnosityUtils.configuration.sort}.merge(options), method("#{endpoint}_endpoint").call)
            end
          end

          define_method "set_#{endpoint}" do |collection = [], options = {}|
            Rare.throttle rpm: LearnosityUtils.configuration.set_rate, key: 'set' do
              remote = request({items: collection}.merge(options), method("#{endpoint}_endpoint").call, 'set')
              remote[:meta][:status]
            end
          end
        end
      end

      private

      def items_endpoint
        'itembank/items'
      end

      def items_tags_endpoint
        'itembank/items/tags'
      end

      def questions_endpoint
        'itembank/questions'
      end

      def features_endpoint
        'itembank/features'
      end

      def activities_endpoint
        'itembank/activities'
      end

    end
  end
end