class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @customers = pagy(Customer.all, items: 5)
    @customers_quantity = Customer.count
    @recurring_quantity = Customer.where(status: :active).count
    @jobs_quantity = Work.where(status: :pending).count
  end

  def new
    @customer = Customer.new
  end

  def show
    @pagy, @conversations = pagy(@customer.conversations, items: 5)
    @works = @customer.works
  end


  def create
    @customer = current_user.customers.build(customer_params)
    if @customer.save
      redirect_to customers_path, notice: t("New Customer created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path, notice: t("Customer was successfully updated") 
    else
      render :edit, status: :unprocessable_entity
    end 
  end


  def destroy
       @customer.destroy
       redirect_to customers_path, notice: t("Customer was successfully removed") 
  end
  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone, :main_address, :status, :email)
  end
end
