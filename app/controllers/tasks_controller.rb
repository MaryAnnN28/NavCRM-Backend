class TasksController < ApplicationController
   
   def index
      render json: Task.all.to_json(task_serializer_options)
   end

   # def show
   #    task = Task.find(params[:id])
   #    render json: task.to_json(task_serializer_options)
   # end

   def show
      task = Task.find(params[:id])
      render json: task.to_json(task_serializer_options)
   end

   def create
      task = Task.new(task_params)
      task.user_id = User.first.id
      if task.save
         render json: task.to_json(task_serializer_options)
      else
         render json: {error: "Unable to create new task"}
      end
   end

   def update
      Task.find(params[:id]).update(task_params)
      render json: Task.find(params[:id])
   end

   def destroy
      task = Task.find(params[:id]).destroy
      render json: Task.all.to_json(task_serializer_options)
   end

   private

   def task_params
      params.require(:task).permit(:title, :task_type, :description, :due_date, :time_due, :notes)
   end

   def task_serializer_options()
      { 
         include: {
            customer: {
               only: [:first_name, :last_name, :company]
            } 
         }, except: [:updated_at, :user_id, :customer_id, :id]
      }
   end


end
