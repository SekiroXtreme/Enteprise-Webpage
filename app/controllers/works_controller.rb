class WorksController < ApplicationController
    before_action :set_work, only: [:edit, :update, :destroy]

    def index
        @works = Work.all
    end

    def new
        @work = Work.new
        @customer = Customer.find(params[:customer_id])
    end

    def create
        @work = Work.new(work_params)
        @work.customer_id = params[:customer_id]
        if @work.save
            redirect_to customer_work_path(:customer_id), notice: "New Job added successfully"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit 
    end

    def update
        if @work.update(work_params)
            redirect_to customer_work_path(:customer_id), notice: "Job updated successfully"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @work.destroy
        redirect_to works_path, notice: "Job deleted successfully"
    end

    private

    def set_work
        @work = Work.find(params[:id])
        
    end

    def work_params
        params.require(:work).permit(:job, :description, :price, :status )
    end 
end
