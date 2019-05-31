class AccountsController < ApplicationController
  def search
  end

  def details
    search_term = params['q']
    client = ClientAPI::UserInfo::Acount.new

    user = client.user_details(search_term)
    user_res = JSON.parse(user)
    if user_res.present?
      attrs = user_res["attributes"]
      @name = attrs["name"]
      account_ids = attrs["account_ids"]
      @account_attrs = account_ids.map{|account_id| JSON.parse(client.account_details(account_id))["attributes"] }
    end
  end
end
