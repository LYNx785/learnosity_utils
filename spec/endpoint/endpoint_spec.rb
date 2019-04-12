require_relative '../spec_helper'

RSpec.describe LearnosityUtils::EndPoint do
  before :each do
    # this config contains publicly accessible learnosity demo credentials only
    LearnosityUtils.configure do |config|
      config.consumer_secret = '74c5fd430cf1242a527f6223aebd42d30464be22'
      config.security_packet = {
          'consumer_key' => 'yis0TYCu7U9V4o7M',
          'domain' => 'localhost'
      }
    end

    stub_request(:post, "https://data.learnosity.com/v2019.1.LTS/itembank/items").
        to_return(status: 200,
                  body: {:meta=>{:status=>true, :timestamp=>1554922422,
                                 :versions=>{
                                     :requested=>"v2019.1.LTS", :mapped=>"v1.27",:concrete=>"v1.27.1"},
                                 :records=>1},
                         :data=>[{:reference=>"LEAR-VG-f4fdc632-ebbd-4848-927f-93f599f147ee",
                                  :title=>nil, :workflow=>nil, :metadata=>nil, :note=>nil, :source=>nil,
                                  :definition=>{
                                    :widgets=>[{:reference=>"213dd680-0689-439d-b1d7-7380c27c8ed9"}],
                                    :template=>"dynamic"},
                                  :description=>"",
                                  :status=>"published",
                                  :questions=>[{:reference=>"213dd680-0689-439d-b1d7-7380c27c8ed9",
                                                :type=>"mcq"}],
                                  :features=>[],
                                  :tags=>{}}]}.to_json,
                  headers: {})
  end

  it 'makes a successful post request to the items endpoint' do
    body = LearnosityUtils::EndPoint::ItemBank.send(:get_items, ['LEAR-VG-f4fdc632-ebbd-4848-927f-93f599f147ee'])
    expect(body[:meta][:status]).to be true
    expect(body[:data][0][:reference]).to match('LEAR-VG-f4fdc632-ebbd-4848-927f-93f599f147ee')
  end
end