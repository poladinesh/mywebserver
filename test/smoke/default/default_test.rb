# # encoding: utf-8

# Inspec test for recipe mywebserver::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

=begin
unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end
=end

describe package('httpd')do
  it { should be_installed }
end

describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end

describe command('curl localhost') do
  its('stdout') { should match /Hello/ }
end

describe port(80) do
  it { should be_listening }
end

#describe port(80),  do
#  it { should be_listening }
#end

=begin
# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end
=end
