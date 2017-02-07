class Api::V1::EventsController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :load_resource, except: [:create]

  # CRUDs
  def create
    require_parameters([:name])
    @event = Event.create!(event_params)
    render json: @event
  end

  def update
    @event.update!(event_params)
    render json: @event
  end

  def index
    render json: @events.where("created_at > ?", Time.zone.now)
  end

  def show
    render json: @event
  end

  def destroy
    @event.destroy
    # No content
  end

  ###
  private

    def event_params

      params.permit(:name, :address, :when, :lat, :lng)
    end

end
