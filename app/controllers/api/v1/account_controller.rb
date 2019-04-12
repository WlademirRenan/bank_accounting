class Api::V1::AccountController < Api::V1::ApiController
    
    # POST /api/v1/balance
    def get_balance
      if Account.exists? account_params[:account_id]
        @balance = Account.get_balance(account_params[:account_id])  
        render json: @balance
      else
        render json: ['Account not found'], status: :unprocessable_entity
      end
    end
   
    private
    # Only allow a trusted parameter "white list" through.
    def account_params
      params.permit(:account_id)
    end
  
end