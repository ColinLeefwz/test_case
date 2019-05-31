
module ClientAPI
  module UserInfo
    require 'rest-client'

    class Acount
      API_ENDPOINT = 'https://sample-accounts-api.herokuapp.com/'.freeze

      attr_reader :oauth_token

      def initialize(oauth_token = nil)
        @oauth_token = oauth_token
      end

      def user_details(user_id)
        query_param = "users/#{user_id}"
        client_request(query_param)
      end

      def user_acounts(user_id)
        query_param = "users/#{user_id}/accounts"
        client_request(query_param)
      end

      def account_details(account_id)
        query_param = "accounts/#{account_id}"
        client_request(query_param)
      end

      private

      def client_request(query_param)
        begin
          resp = RestClient.get(API_ENDPOINT + query_param)
        rescue RestClient::Unauthorized, RestClient::Forbidden => err
          return err.response
        rescue RestClient::ImATeapot => err
          return err.response
        else
          return resp
        end
      end
    end
  end
end
