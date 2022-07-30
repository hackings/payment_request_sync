class PaymentRequestsController < ApplicationController
  before_action :set_payment_request, only: %i[show edit update destroy approve reject]

  # GET /payment_requests or /payment_requests.json
  def index
    @payment_requests = PaymentRequest.all
  end

  # GET /payment_requests/1 or /payment_requests/1.json
  def show
  end

  # GET /payment_requests/1/edit
  def edit
  end

  # PATCH/PUT /payment_requests/1 or /payment_requests/1.json
  def update
    respond_to do |format|
      if @payment_request.update(payment_request_params)
        format.html { redirect_to payment_request_url(@payment_request), notice: "Payment request was successfully updated." }
        format.json { render :show, status: :ok, location: @payment_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_requests/1 or /payment_requests/1.json
  def approve
    respond_to do |format|
      if @payment_request.accepted!
        format.html { redirect_to payment_request_url(@payment_request), notice: "Payment request was successfully approved." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_requests/1 or /payment_requests/1.json
  def reject
    respond_to do |format|
      if @payment_request.rejected!
        format.html { redirect_to payment_request_url(@payment_request), notice: "Payment request was successfully rejected." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payment_request
    @payment_request = PaymentRequest.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def payment_request_params
    params.require(:payment_request).permit(:description, :status)
  end
end
