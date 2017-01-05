class Api::V1::PotentialManagersController < Api::V1::BaseController
  before_action :authenticate_user!, except: [:create, :reset_password]
  before_action :load_resource, except: [:create, :reset_password]

  # CRUDs
  def create
    @potential_manager = PotentialManager.create!(sign_up_params)
    bypass_authenticate(@potential_manager)
    render json: @potential_manager
  end

  def update
    authorize @potential_manager
    @potential_manager.update!(update_params)
    render json: @potential_manager
  end

  def show
    authorize @potential_manager
    render json: @potential_manager
  end

  # Custom actions
  def password
    authorize @potential_manager
    @potential_manager.update_with_password!(password_params)
  end

  def reset_password
    params.require(:email)
    PotentialManager.reset_password(params[:email])
    # No Content
  end

  def register_device
    require_parameters([:device_id, :device_os])
    authorize @potential_manager
    current_user.register_device(request.headers["client"], params[:device_id], params[:device_os])
    # No Content
  end

  ###
  private

    def sign_up_params
      require_parameters([:property_relation, :name, :phone, :avatar, :email, :password])
      params.permit(:property_relation, :name, :phone, :avatar, :email, :password)
    end

    def update_params
      params.permit(:property_relation, :name, :phone, :avatar, :email)
    end

    def password_params
      require_parameters([:current_password, :password])
      params.permit(:current_password, :password, :password_confirmation)
    end

end
