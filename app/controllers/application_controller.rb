class ApplicationController < ActionController::Base
  before_action :check_admin_access

  private

  def check_admin_access
    if admin_controller? && !admin_signed_in? && request.path != '/admin/sign_in'
      redirect_to root_path
    end
  end

  def admin_controller?
    self.class.to_s.start_with?("Admin::")
  end
end
