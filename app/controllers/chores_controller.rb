class ChoresController < ApplicationController
  before_action :set_chore, only: [:show, :update, :destroy]

  def index
    @chores = Chore.last(15)
    json_response(extract_response_attributes(@chores))
  end

  def create
    @chore = Chore.create!(Chore_params)
    json_response(extract_response_attributes([@chore]))
  end

  def show
    json_response(extract_response_attributes([@chore])).first
  end

  def update
    @chore.update(Chore_params)
    head :no_content
  end

  def destroy
    @chore.destroy
    head :no_content
  end

  private

  def set_chore
    @chore = Chore.find(params[:id])
  end

  def chore_params
    # whitelist params
    params.permit(:name)
  end

  def extract_response_attributes(chores)
    chores.map do |chore|
      { id: chore.id, name: chore.name, users: chore.users.uniq, assigned_to: chore.assigned_to.name }
    end
  end
end
