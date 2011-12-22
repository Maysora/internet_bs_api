require 'internet_bs_api/domain'
require 'internet_bs_api/private_who_is'
require 'internet_bs_api/registrar_lock'
require 'internet_bs_api/transfer'
require 'internet_bs_api/dns_record'
require 'internet_bs_api/host'
require 'internet_bs_api/account'
require 'internet_bs_api/url_forward'
require 'internet_bs_api/email_forward'

module InternetBsApi
  
  class Base
    include InternetBsApi::Account
    include InternetBsApi::Domain
    include InternetBsApi::Utilities

    attr_reader :connection

    DEFAULT_OPTIONS = {
      :response_format => "JSON",
      :test_mode => false,
      :url_base => "https://api.internet.bs/",
      :test_url_base => "https://testapi.internet.bs/",
      :api_key => "testapi",
      :password => "testpass"
    }

    def initialize options={}
      options = DEFAULT_OPTIONS.merge options
      options[:url_base] = options[:test_url_base] if options[:test_mode]
      @connection = Connection.new options
    end
    
  end

end
