require 'weibo_2'

WeiboOAuth2::Config.api_key = 'abc'
WeiboOAuth2::Config.api_secret = 'def'
WeiboOAuth2::Config.redirect_uri = 'https://example.com/callback'

describe WeiboOAuth2::Client do
  it 'should assign id and secret from config' do
    subject.id.should == 'abc'
    subject.secret.should == 'def'
  end

  it 'should assign site from default' do
    subject.site.should == 'https://api.weibo.com/2/'
  end

  it 'should get authorize_url' do
    authorize_url = 'https://api.weibo.com/oauth2/authorize?client_id=abc&redirect_uri=https%3A%2F%2Fexample.com%2Fcallback&response_type=code'
    subject.authorize_url.should == authorize_url
  end

  it 'should leave Faraday::Connection#ssl unset' do
    subject.connection.ssl.empty?.should be_truthy
  end

  it "defaults raise_errors to true" do
    subject.options[:raise_errors].should be_truthy
  end

  it "allows true/false for raise_errors option" do
    client = OAuth2::Client.new('abc', 'def', :site => 'https://api.example.com', :raise_errors => false)
    client.options[:raise_errors].should be_falsey
    client = OAuth2::Client.new('abc', 'def', :site => 'https://api.example.com', :raise_errors => true)
    client.options[:raise_errors].should be_truthy
  end

  it "allows get/post for access_token_method option" do
    client = OAuth2::Client.new('abc', 'def', :site => 'https://api.example.com', :access_token_method => :get)
    client.options[:access_token_method].should == :get
    client = OAuth2::Client.new('abc', 'def', :site => 'https://api.example.com', :access_token_method => :post)
    client.options[:access_token_method].should == :post
  end

end
