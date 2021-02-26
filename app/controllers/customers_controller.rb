class CustomersController < ApplicationController

   def index
      render json: Customer.all.to_json(customer_serializer_options)
   end

   def show
      customer = Customer.find(params[:id])
      render json: customer.to_json(customer_serializer_options)
   end

   def create
      customer = Customer.new(customer_params)
      customer.user_id = User.first.id
      customer.save
      render json: customer
   end

   def update
      Customer.find(params[:id]).update(customer_params)
      render json: Customer.find(params[:id])
   end

   def destroy
      customer = Customer.find(params[:id]).destroy
      render json: Customer.all.to_json(customer_serializer_options)
   end

   private

   def customer_params
      params.require(:customer).permit(:first_name, :last_name, :company, :job_title, :industry, :email, :phone, :notes)
   end

   def customer_serializer_options()
      {
         include: {
            tasks: {
               except: [:id, :customer_id, :user_id, :updated_at]
            }
         }, 
         except: [:updated_at]
      }
   end

end
