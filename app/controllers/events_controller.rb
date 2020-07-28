class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    def index
        @events = Event.all
        @past_events = Event.past
        @upcoming = Event.upcoming
    end

    def new
        @event = Event.new
    end

    def show
        @event = Event.find(params[:id])
    end

    def create
        @event = current_user.created_events.build(whitelisted_post_params)
        if @event.save
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
        @event = Event.find(params[:id])
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        flash.notice = "Article '#{@event.description}' Deleted."

        redirect_to root_path
    end

    def update
        @event = Event.find(params[:id])
        if @event.update(whitelisted_post_params)
            redirect_to edit_event_path
        else
            render :edit
        end
    end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def whitelisted_post_params
      params.require(:event).permit(:description,:location, :date, :creator, :creator_id, :attendees)
  end

end