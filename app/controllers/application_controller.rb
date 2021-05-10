class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行されます。
  
  def after_sign_in_path_for(resource)
    post_images_path
  end
  protected
  #protectedは呼び出された他のコントローラからも参照できます。
  
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  #ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作が許可されます。
  
end
