require 'spec_helper'

describe CheckHTTP::Checker do
  let(:checker) { CheckHTTP::Checker.new }
  let(:url) { 'http://example.com' }
  let(:mock_result) { {:return_code=>:ok, 
                   :total_time=>0.037439, 
                   :connect_time=>0.009433, 
                   :namelookup_time=>0.003042, 
                   :effective_url=>"http://google.com", 
                   :primary_ip=>"74.125.224.98", 
                   :response_code=>301, 
                   :redirect_count=>0} }

  it 'should be able to sample a url' do
    checker.should_receive(:sample).with(url) { {} }
    checker.sample(url)
  end

  it 'should return sampled results with url merged in' do
    checker.stub(:sample).with(url) { mock_result }
    checker.check(url).should eq(mock_result.merge(:url => url))
  end

  it 'should clean sampled results before returning' do
    checker.stub(:sample).with(url) { mock_result }
    checker.should_receive(:clean).with(mock_result) { mock_result }
    checker.check(url)
  end

  it 'should be able to remove blacklisted items' do
    checker.blacklist = [:foo]
    checker.clean({:foo => 1, :baz => 2}).should eq({:baz => 2})
  end
end
