require 'serverspec'
require 'net/http'

# check port availability
describe "port 80 is opened" do
  it "port 80 is opened" do
    expect(port(80)).to be_listening
  end
end

# check response code
describe 'response code is 200' do
  it 'response code is 200' do
     url = URI("http://localhost/")
     status_response = Net::HTTP.get_response(url)
     expect status_response.kind_of? Net::HTTPSuccess
  end
end

# check pid file
case node['web_server_type']
when 'apache'
  describe file('/var/run/httpd/httpd.pid') do
    it { should exist }
  end
when 'nginx'
  describe file('/var/run/nginx.pid') do
    it { should exist }
  end
end
