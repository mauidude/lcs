class ProjectTasksController < SecureController
  before_filter :load_project

  def new
    @project_task = ProjectTask.new
  end

  def create
    @project_task = @project.tasks.build(params[:project_task])

    if @project_task.save
      flash[:notice] = 'Hours added successfully!'
      redirect_to @project
    else
      render :new
    end
  end

  def destroy
    @project.tasks.find(params[:id]).destroy
    flash[:notice] = 'Hours deleted successfully!'

    redirect_to @project
  end

  private

    def load_project
      @project = Project.find(params[:project_id])
    end
end
