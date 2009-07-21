module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Smmail
        class Return < ActiveMerchant::Billing::Integrations::Return
          
          def order
            params["out_trade_no"]
          end

          def amount
            params["total_fee"]
          end

          def initialize(query_string)
            super
            values = params["value"].split("|")
            ["out_trade_no", "total_fee", "status", "success", "reason"].each_with_index do |key, i|
              params.merge!(key => values[i])
            end
          end

          def success?
            if !verify_sign
              @message = "Error: ILLEGAL_SIGN"
              return false
            elsif params["success"] != "1"
              @message = "Fail: The returned reason is #{params[:reason]}"
              return false
            else
              return true
            end
          end

          def message
            @message
          end
          
          def verify_sign
            md5_string = []
            ["username", "userid", "value"].each do |key|
              md5_string << key.to_s + "=" + CGI.escape(params[key])
            end

            Digest::MD5.hexdigest(md5_string.join("")+ "key=" + KEY) == params["md5"].downcase
          end

        end
      end
    end
  end
end
