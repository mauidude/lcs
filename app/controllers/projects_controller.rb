class ProjectsController < SecureController
  before_filter :load_project, only: [:show, :edit, :update, :year]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      flash[:notice] = 'Project created successfully!'
      redirect_to @project
    else
      render :new
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xls
    end
  end

  def edit
  end

  def update
    @project.assign_attributes(params[:project])

    if @project.save
      flash[:notice] = 'Project saved successfully!'
      redirect_to @project
    else
      render :edit
    end
  end

  def year
    respond_to do |format|
      format.html
      format.xls
    end
  end

  private

    def load_project
      @project = Project.find(params[:id])
    end
end
