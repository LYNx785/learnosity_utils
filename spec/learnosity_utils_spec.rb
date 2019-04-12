require_relative 'spec_helper'

RSpec.describe LearnosityUtils do
  it 'has a version number' do
    expect(LearnosityUtils::VERSION).not_to be nil
  end

  it 'is user configurable' do
    expect(LearnosityUtils.configuration.get_rate).to be 6000

    LearnosityUtils.configure do |config|
      config.get_rate = 2000
    end

    expect(LearnosityUtils.configuration.get_rate).to be 2000
  end
end
