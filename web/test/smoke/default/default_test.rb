# # encoding: utf-8

# Inspec test for recipe web::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# test connectivity
describe port(80) do
  it { should be_listening }
  its('processes') { should include web_server_type }
end

# test response status
describe http("http://#{web_server_type}/") do
  its('status') { should cmp 200 }
end

# test pid file
case web_server_type
when 'apache'
  describe file('/var/run/httpd/httpd.pid') do
    it { should exist }
  end
when 'nginx'
  describe file('/var/run/nginx.pid') do
    it { should exist }
  end
end
