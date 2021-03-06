class Api::V1::TransferenceController < Api::V1::ApiController
    
    # POST /api/v1/transference
    def create
      @transference = TransferenceService.new(transference_params.merge(user_id: @user.id))
      @transference.call
      if @transference.errors.empty?
        render json: @transference, status: :created
      else
        render json: @transference, status: :unprocessable_entity
      end
    end
   
    private
    # Only allow a trusted parameter "white list" through.
    def transference_params
      params.permit(:source_account_id, :destination_account_id, :amount)
    end
  
end