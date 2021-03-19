class DeliveriesController < ApplicationController
  def create
    status, body = CreateOrder.new(params.permit!.to_h).call

    render json: body, status: status
  end
end
