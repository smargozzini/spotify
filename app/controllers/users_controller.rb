class UsersController < ApplicationController
  def admin
  	@users = User.all
  end

  def index
  	@user = User.all
  end

  def destroy
		@user = User.find(params[:id])
		@user.destroy
		respond_to do |format|
		  format.html { redirect_to users_admin_path, notice: 'Post was successfully destroyed.' }
		  format.json { head :no_content }
		end

  def user_params
    params.require(:user).permit(:email)
  end
    
	end
	def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params.require(:user).permit(:email))
      redirect_to users_profile_path, :notice => "Profile updated"
    else
      render "edit"
    end
  end
end
