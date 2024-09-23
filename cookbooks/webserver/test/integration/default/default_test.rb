# Chef InSpec test for recipe webserver::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

apache_package = case os.family
when 'debian'
  'apache2'
when 'redhat'
  'httpd'
end

describe service(apache_package) do
  it { should be_enabled }
  it { should be_running }
end

describe http('http://localhost') do
  its('status') { should cmp 200 }
  its('body') { should match /Welcome to the OSU Open Source Lab!/ }
end

describe service('telnet') do
  it{ should_not be_running}
end