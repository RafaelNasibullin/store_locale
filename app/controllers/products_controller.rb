class ProductsController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page], per_page: 10)
  end

  def show_product
  	@product = Product.find(params[:id])
  end

  def show_category
  	@products = Product.where(category_id: params[:id]).paginate(page: params[:page], per_page: 10) 
  end

  def update_avatar
  	if user_signed_in?
  		@user = User.find(current_user)
  	else
  		redirect_to roor_path, notice: "Log in, please"
  	end
  end

  def save_avatar
  	@user = User.find(current_user)
  	if @user.update(user_params)
  		redirect_to root_path, notice: "Avatar updated"
  	else
  		redirect_to root_path, notice: "Avatar isn't updated"
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:image)
  end
end
