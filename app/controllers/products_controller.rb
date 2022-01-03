# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def all
    @products = Product.all
  end

  # GET /products or /products.json
  def index
    
    @products = current_user.products.all
  end

  # GET /products/1 or /products/1.json
  def show; end

  # GET /products/new
  def new
    @product = current_user.products.new(product_params)
  end

  # GET /products/1/edit
  def edit; end

  # POST /products or /products.json
  def create
    @product = current_user.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to url: user_products_path(current_user), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_url(product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to user_products_path(@product), notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.permit(:name, :description, :price, images: [])
  end
end
