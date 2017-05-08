class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    # @projects = Project.all
    # # @projects = @projects.order(:end_date)
    # @projects = Project.order(:title).page params[:page]
    @q = Project.ransack(params[:q])
    @projects = @q.result(distinct: true).page params[:page]
  end

  def show
    @project = Project.find(params[:id])
    @pledges_total = 0
    (@project.pledges).each do |pledge|
      @pledges_total += pledge.dollar_amount
    end
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_url
    else
      render :new
    end
   end

  private
  def project_params
    params.require(:project).permit(:title, :description, :goal, :start_date, :end_date, :image, rewards_attributes: [:dollar_amount, :description])
  end
end
