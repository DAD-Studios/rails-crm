class DashboardController < ApplicationController
  def index
    @agents = Agent.all.group_by(&:status)
    @statuses = ["Not Contacted", "Contacted", "Meeting Scheduled", "Proposal Sent", "Won", "Lost"]
  end
end
