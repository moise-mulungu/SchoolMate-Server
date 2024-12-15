class FeesController < ApplicationController
  before_action :set_fee, only: [:show, :update, :destroy]

  # GET /fees
  def index
    @fees = Fee.all
    render json: @fees
  end

  # GET /fees/:id
  def show
    render json: @fee
  end

  # POST /fees
  def create
    @fee = Fee.new(fee_params)
    if @fee.save
      render json: @fee, status: :created
    else
      render json: @fee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fees/:id
  def update
    if @fee.update(fee_params)
      render json: @fee
    else
      render json: @fee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fees/:id
  def destroy
    @fee.destroy
    head :no_content
  end

  private

  def set_fee
    @fee = Fee.find(params[:id])
  end

  def fee_params
    params.require(:fee).permit(:student_id, :amount, :total_paid, :due_date, :paid)
  end
end
