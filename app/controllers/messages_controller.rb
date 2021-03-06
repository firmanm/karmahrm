class MessagesController < ApplicationController
   before_action :authenticate_user!

   def new
       @to_employee = Employee.find(params[:employee]) if params[:employee]
   end

   def create
     recipients = User.where(id: params['recipients'])
     conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
     flash[:success] = 'Message has been sent!'
     redirect_to conversation_path(conversation)
   end

   def index
   end
end
