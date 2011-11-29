require 'rails/all'

module RSpecRails
  class Application < ::Rails::Application
  end
end

require 'rspec/rails'
require 'ammeter/init'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

class RSpec::Core::ExampleGroup
  def self.run_all(reporter=nil)
    run(reporter || RSpec::Mocks::Mock.new('reporter').as_null_object)
  end
end

RSpec.configure do |config|
  config.before(:each) do
    @real_world = RSpec.world
    RSpec.instance_variable_set(:@world, RSpec::Core::World.new)
  end
  config.after(:each) do
    RSpec.instance_variable_set(:@world, @real_world)
  end
  #config.order = :random
end

# def generate unique domain name
#
def generate_domain
  "random#{Time.now.hash % 1000000}.com"
end

require "#{Rails.root}/lib/internet_bs_api/contact.rb"
def initialize_valid_contact
  contact = Contact.new
  contact.contact_type = Contact::ADMIN_CONTACT_TYPE

  contact.first_name = "A"
  contact.last_name = "B"
  contact.email = "C@D.com"
  contact.phone_number = "+1.2345678912"
  contact.street = "E"
  contact.city = "F"
  contact.country_code = "US"
  contact.postal_code = "98765"

  contact
end
