class HealthCheckController < ApplicationController
  rescue_from(Exception) { render head: 503 }

  def show
    format.html { render head: 200 }
    format.json { render head: 200 }
  end
end
