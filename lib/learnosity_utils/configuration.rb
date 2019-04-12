module LearnosityUtils
  class Configuration
    attr_accessor :get_rate, :set_rate, :sort, :retry_delay,
                  :consumer_secret, :security_packet, :version

    def initialize
      @get_rate = 6000
      @set_rate = 300
      @sort = 'asc'
      @retry_delay = 5
      @consumer_secret = nil
      @security_packet = nil
      @version = '2019.1.LTS'
    end
  end
end