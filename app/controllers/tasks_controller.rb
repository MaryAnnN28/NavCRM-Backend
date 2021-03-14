class TasksController < ApplicationController
   
   def index
      render json: Task.all.to_json(task_serializer_options)
   end

   def show
      task = Task.find(params[:id])
      render json: task.to_json(task_serializer_options)
   end


   def create
      task = Task.create(task_params)
      render json: task.to_json(task_serializer_options)
   end

   # THIS WORKS!!!!! 
   def update
      task = Task.find(params[:id])
      task.update(task_params)
      render json: task.to_json(task_serializer_options)
   end


   def destroy
      task = Task.find(params[:id]).destroy
      render json: Task.all.to_json(task_serializer_options)
   end

   private

   def task_params
      params.require(:task).permit(:title, :task_type, :description, :due_date, :time_due, :notes, :user_id, :customer_id)
   end

 


   def task_serializer_options()
      { 
         include: {
            customer: {
               only: [:first_name, :last_name, :company, :id]
            }, 
            user: {
               only: [:first_name, :last_name, :id]
            }
         }
      }
   end


end



 # UPDATE CLICK GOES IMMEDIATELY TO TASK LIST PAGE 
   # DOES NOT UPDATE TASK TITLE UNTIL REFRESH 
   # BUT HAS ALL THE DATA 
   # def update
   #    task = Task.find(params[:id]).update(task_params)
   #    render json: task.to_json(task_serializer_options)
   # end

   # UPDATE CLICK GOES IMMEDIATELY TO TASK LIST PAGE 
   # UPDATES TASK TITLE IMMEDIATELY 
   # MISSING CUSTOMER AND COMPANY UNTIL REFRESH 
   # def update
   #    Task.find(params[:id]).update(task_params)
   #    render json: Task.find(params[:id])
   # end


   # UPDATE CLICK GOES IMMEDIATELY TO TASK LIST PAGE  
   # DOES NOT UPDATE TASK TITLE UNTIL REFRESH 
   # BUT HAS ALL THE DATA 
   # def update
   #    Task.find(params[:id]).update(task_params)
   #    render json: task.to_json(task_serializer_options)
   # end