class HealthController < ApplicationController
  def show
    render json: {
      ok: true,
      time: Time.now,
      db: ActiveRecord::Base.connection.active?
    }
  end
end
