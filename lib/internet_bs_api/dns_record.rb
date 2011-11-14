module IBS
  module InternetBsApi
    module Domain
      module DnsRecord
        def add(domain_name_with_tld, type, value)
          options = {
            "FullRecordName" => "www.#{domain_name_with_tld}",
            "Type" => type,
            "Value" => value
          }
          connection.post("Domain/DnsRecord/Add", options)
        end

        def remove
        end

        def update
        end

        def list
        end
      end


    end
  end
end