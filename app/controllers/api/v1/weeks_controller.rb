class Api::V1::WeeksController < ApplicationController

  def show
    @merchants = Merchant.all
    @desembolsos = Order.where('week = ?', params[:id]) or not_found
    if @desembolsos.count != 0
      @week_desembolsos = @desembolsos.where.not(completed_at: nil)
                                      .where('week = ?', @desembolsos.first.week)
    end

    @informe = SayHelloJob.set(wait: 1.minutes).perform_later(params[:id])
  end

  def index
    @merchants = Merchant.all
    render :index
  end
end
