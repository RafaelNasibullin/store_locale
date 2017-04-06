class Admin::ProductsController < AdminController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, @product]
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to [:admin, @product]
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.destroy(params[:id])
    redirect_to admin_products_url
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:title_en, :title_ru, :description_en, :description_ru, :price, :category_id, :image)
  end
end
