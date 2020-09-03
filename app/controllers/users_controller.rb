class UsersController < ApplicationController

    def create
        @user = User.create(user_params)
        if @user.valid?
          render json: { created: 'successful'}, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
      end
     
      private
      def user_params
        params.permit(:user_name, :password, :first_name, :last_name, :dob, :user_name, :password_digest, :current_location)
      end

end