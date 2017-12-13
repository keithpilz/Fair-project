class EmailsController < ApplicationController
  before_action :require_admin_rights

  def index
    @email = Email.new
    @emails = Email.all
  end

  def create
  end

  private


  def require_admin_rights
    redirect_to admin_path unless current_user && current_user.is_admin
  end
end