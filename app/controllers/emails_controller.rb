class EmailsController < ApplicationController
  before_action :require_admin_rights

  def index

  end

  private

  def require_admin_rights
    unless current_user && current_user.is_admin
      redirect_to admin_login_path
    end
  end
end