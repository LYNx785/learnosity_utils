require_relative 'learnosity_utils/version'
require_relative 'learnosity_utils/end_point'
require_relative 'learnosity_utils/configuration'

module LearnosityUtils
  extend self

  attr_writer :configuration

  def configuration
    @configuration ||= Configuration.new
  end

  def reset
    @configuration = Configuration.new
  end

  def configure
    yield configuration
  end
end
