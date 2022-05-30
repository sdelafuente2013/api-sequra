class Api::V1::WeeksController < ApplicationController

  def show
    @merchants = Merchant.all
    @disbursements = Order.where('week = ?', params[:id]) or not_found
    if @disbursements.count != 0
      @week_disbursements = @disbursements.where.not(completed_at: nil)
                                          .where('week = ?', @disbursements.first.week)
    end

    @weekly_report = ReportJob.set(wait: 1.weeks).perform_later(params[:id])
  end

  def index
    @merchants = Merchant.all

    render :index
  end
end
