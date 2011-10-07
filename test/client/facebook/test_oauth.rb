
require 'rest-core/test'

describe RestCore::Facebook do
  before do
    @rg  = RestCore::Facebook.new(:app_id => '29', :secret => '18')
    @uri = 'http://zzz.tw'
  end

  after do
    WebMock.reset!
  end

  should 'return correct oauth url' do
    TestHelper.normalize_url(@rg.authorize_url(:redirect_uri => @uri)).
    should.eq 'https://graph.facebook.com/oauth/authorize?' \
              'client_id=29&redirect_uri=http%3A%2F%2Fzzz.tw'
  end

  should 'do authorizing and parse result and save it in data' do
    stub_request(:get, 'https://graph.facebook.com/oauth/access_token?' \
                       'client_id=29&client_secret=18&code=zzz&'        \
                       'redirect_uri=http%3A%2F%2Fzzz.tw').
      to_return(:body => 'access_token=baken&expires=2918')

    result = {'access_token' => 'baken', 'expires' => '2918'}

    @rg.authorize!(:redirect_uri => @uri, :code => 'zzz').
             should.eq result
    @rg.data.should.eq result
  end

  should 'not append access_token in authorize_url even presented' do
    RestCore::Facebook.new(:access_token => 'do not use me').authorize_url.
      should.eq 'https://graph.facebook.com/oauth/authorize'
  end

end
