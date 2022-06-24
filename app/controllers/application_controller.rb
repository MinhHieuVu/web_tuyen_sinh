class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_admin!
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def authenticate_moderator!
    unless current_user.admin? || current_user.moderator?
      redirect_to root_path
    end
  end

  def authenticate_editor!
    unless current_user && (current_user.admin? || current_user.moderator? || current_user.editor?)
      redirect_to root_path
    end
  end

  def autheticate_banned!
    if current_user && current_user.banned?
      flash[:error] = "Tài khoản của bạn đã bị tạm ngưng hoạt động. Vui lòng liên hệ với quản trị viên để khắc phục và tiếp tục."
      redirect_to root_path
    end
  end

  def current_url(overwrite={})
    url_for :only_path => false, :params => params.merge(overwrite)
  end

  def render_403(options={})
    @project = nil
    render_error({:message => :notice_not_authorized, :status => 403}.merge(options))
    false
  end

  def render_404(options={})
    render_error({:message => "Ôi không!!! Không thể tìm thấy link bạn đang truy cập. Nếu đây là lỗi, vui lòng báo cho admin qua Facebook Tìm Đáp Án. Cảm ơn bạn!", :status => 404}.merge(options))
    false
  end

  # Renders an error response
  def render_error(arg)
    arg = {:message => arg} unless arg.is_a?(Hash)

    @message = arg[:message]
    @message = l(@message) if @message.is_a?(Symbol)
    @status = arg[:status] || 500

    respond_to do |format|
      format.html {
        render :template => 'common/error', :status => @status
      }
      format.any { head @status }
    end
  end

  def configure_permitted_parameters
    # added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    # devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    # devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password])
  end
end
