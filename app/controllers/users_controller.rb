class UsersController < ApplicationController
   
   def index
      render json: User.all.to_json(user_serializer_options)
   end

   def show 
      user = User.find(params[:id])
      render json: user.to_json(user_serializer_options)
   end

   # def self.from_omniauth(auth)
   #    where(email: auth.info.email).first_or_initialize do |user|
   #       user.name = auth.info.name
   #       user.email = auth.info.email 
   #    end
   # end

   def create
      user = User.new(user_params)
      if user.save
         render json: user
      else 
         render json: { error_message: "Something went wrong"}
      end
   end

   def update 
      User.find(params[:id]).update(user_params)
      render json: User.find(params[:id])
   end

   private

   def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
   end

   def user_serializer_options()
      {
         include: {
            customers: {
               except: [:id, :updated_at]
            }, 
            tasks: {
               except: [:id, :user_id, :customer_id, :updated_at, :created_at]
            }
         },
         except: [:updated_at, :created_at]
      }
   end



end
