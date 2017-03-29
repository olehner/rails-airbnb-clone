class RegistrationsController < Devise::RegistrationsController

  def create
    super do
      user = User.create(account_id: resource.id)
      # address = Address.create(user_id: user.id)
    end
  end

  protected

  def after_sign_up_path_for(resource)
    edit_user_path(resource.user)
  end

end
