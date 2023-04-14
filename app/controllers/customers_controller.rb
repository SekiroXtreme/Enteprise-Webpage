class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def show
    @conversations = @customer.conversations
    @works = @customer.works
  end


  def create
    @customer = current_user.customers.build(customer_params)
    if @customer.save
      redirect_to customers_path, notice: "New client created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path, notice: "Customer was successfully updated." 
    else
      render :edit, status: :unprocessable_entity
    end 
  end


  def destroy
       @customer.destroy
       redirect_to customers_path, notice: "Customer was successfully removed." 
  end
  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone, :main_address, :status, :email)
  end
end
