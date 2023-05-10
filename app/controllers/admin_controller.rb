class AdminController < ApplicationController
  before_action :authenticate_account!
  before_action :can_access?

  def accounts
    @accounts = Account.where(admin: false)
  end


  def can_access?
    @show_sidebar = true
    unless current_account.admin? || current_account.broker?
      redirect_to root_url, flash: {danger: "You must be an admin" }
    end
  end

  def index
    @accounts = Account.where(admin: false)
  end


  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Account was successfully deleted.' }
      format.json { head :no_content }
    end
  end




end
