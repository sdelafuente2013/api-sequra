class Api::V1::WeeksController < ApplicationController

  def show
    @merchants = Merchant.all
    # Verify that it matches the week chosen by the user
    @disbursements = Order.where('week = ?', params[:id]) or not_found
    # If the week has data, show them in view
    if @disbursements.count != 0
      # The disbursements that are completed and the corresponding week will be selected
      @week_disbursements = @disbursements.where.not(completed_at: nil)
                                          .where('week = ?', @disbursements.first.week)
    end
    # The report will start every time /weeks/:ID is accessed, if it is not available, it will be created in one week
    @weekly_report = ReportJob.set(wait: 1.weeks).perform_later(params[:id])
  end

  def index
    @merchants = Merchant.all

    render :index
  end
end
