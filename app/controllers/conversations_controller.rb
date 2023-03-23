class ConversationsController < ApplicationController
    before_action :set_conversation, only: [:show, :edit, :update, :destroy]
    def index
        @conversations = Conversation.all
    end
    

    def new
        @conversation = Conversation.new
        @customer = Customer.find(params[:customer_id])
    end

    def create
        @conversation = Conversation.new(conversation_params)
        @conversation.customer_id = params[:customer_id]
        if @conversation.save
          redirect_to customer_path(params[:customer_id]), notice: "Conversation Succesfully added to chat"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @conversation.destroy
        redirect_to customer_path(params[:customer_id])  , notice: "Conversation Succesfully removed"
    end


    def delete_all
        @customer = Customer.find(params[:customer_id])
        @customer.conversations.destroy_all
        redirect_to @customer, notice: "Conversation Succesfully removed"

    end

    private

    def set_conversation
        @conversation = Conversation.find(params[:id])
        
    end

    def conversation_params
        params.require(:conversation).permit(:conversation)
    end
end
