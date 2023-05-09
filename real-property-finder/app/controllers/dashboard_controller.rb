class DashboardController < ApplicationController
  before_action :set_sidebar
  def index
    @favorite_properties = current_account.favorite_properties
  end


  def profile
    @account = Account.find(params[:id])
    # @property = Property.where(account_id: @account.id).latest.third
    #@agent_properties = Property.where(account_id: @account.id )
  end

  private
  def set_sidebar
    @show_sidebar = true if account_signed_in?
  end
end
