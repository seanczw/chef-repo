# Chef InSpec test for recipe webserver::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

describe service('apache2.service') do
  it { should be_enabled }
  it { should be_running }
end

describe http('http://localhost') do
  its('status') { should cmp 200 }
  its('body') { should match /Welcome to the OSU Open Source Lab!/ }
end