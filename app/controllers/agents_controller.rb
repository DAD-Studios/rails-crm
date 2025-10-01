require 'csv'

class AgentsController < ApplicationController
  protect_from_forgery with: :null_session, only: [:update_status]

  def show
    @agent = Agent.find(params[:id])
  end

  def new
    @agent = Agent.new
  end

  def create
    @agent = Agent.new(agent_params)
    if @agent.save
      redirect_to root_path, notice: "Agent was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update_status
    @agent = Agent.find(params[:id])
    request_body = JSON.parse(request.body.read)
    if @agent.update(status: request_body["status"])
      render json: { message: "Status updated successfully" }, status: :ok
    else
      render json: { errors: @agent.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def import
    # This action will render the import form
  end

  def upload
    file = params[:file]
    if file.nil?
      redirect_to import_agents_path, alert: "Please select a file to upload."
      return
    end

    CSV.foreach(file.path, headers: true) do |row|
      Agent.create!(row.to_hash)
    end

    redirect_to root_path, notice: "Agents imported successfully."
  end

  private

  def agent_params
    params.require(:agent).permit(:first_name, :last_name, :email, :phone_number, :company)
  end
end
