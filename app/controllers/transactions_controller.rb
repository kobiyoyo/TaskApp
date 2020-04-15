class TransactionsController < ApplicationController
 before_action :set_transactions,only: [:show,:edit,:destroy,:update]
  before_action :authorized

  def index
  	@transactions = current_user.transactions
  end

  def new
  	@transaction = Transaction.new
  end

  def create
  	@transaction = current_user.transactions.new(transaction_params)
  	if @transaction.save
  		flash[:success] = 'Transactions successfully created.'
  		redirect_to transactions_path
  	else
  		flash.now[:success] = "Transactions wasn't created."
  		render :new
  	end
  end

  def edit

  end

  def update
  	if @transaction.update(transaction_params)
  		flash[:success] = 'Transactions successfully updated.'
  		redirect_to transactions_path
  	else
  		flash.now[:danger] = "Transactions wasn't updated."
  		render :edit
  	end
  end



  def show
  end

  def destroy
  	@transaction.destroy
  	redirect_to transactions_path,danger: 'Transactions successfully deleted.'
  end

  private
  def transaction_params
    params.require(:transaction).permit(:name,:amount, group_ids:[])
  end
  def set_transactions
  	@transaction = Transaction.find(params[:id])
  end
  
end
