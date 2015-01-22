class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  # GET /tasks/1/edit
  def edit
    @task = @list.tasks.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.create(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @list, notice: 'Task was successfully created.' }
      else
        format.html { redirect_to @list, alert: 'Failed' }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])

    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @list, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])

    respond_to do |format|
      if @task.destroy
        format.html { redirect_to @list, notice: 'Task was successfully destroyed.' }
      end
    end
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @list = List.find(params[:list_id])
      @task = @list.tasks.find(params[:id])
#      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :duedate)
    end
end
