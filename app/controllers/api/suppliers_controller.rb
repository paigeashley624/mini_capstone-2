class Api::SuppliersController < ApplicationController
  before_action :authenticate_admin

  def index
    @suppliers = Supplier.all
    render "index.json.jb"
  end

  def show
    id_input = params[:id]
    @supplier = Supplier.find(id_input)
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      id: params[:id],
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number],
    )

    #happy/sad path
    if @supplier.save
      render "show.json.jb"
    else
      render json: { message: @supplier.errors.full_messages }, status: 406
    end
  end

  def update
    supplier_id = params[:id]
    @supplier = Supplier.find(supplier_id)

    @supplier.id = params[:id] || @supplier.id
    @supplier.name = params[:name] || @supplier.name
    @supplier.email = params[:email] || @supplier.email
    @supplier.phone_number = params[:phone_number] || @supplier.phone_number

    #happy/sad path
    if @supplier.save
      render "show.json.jb"
    else
      render json: { message: @supplier.errors.full_messages }, status: 406
    end
  end

  def delete
    supplier_id = params[:id]
    supplier = Supplier.find(supplier_id)
    supplier.destroy
    render json: { message: "Supplier deleted successfully!" }
  end
end
