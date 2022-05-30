class ReportJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @number_week = Order.where('week = ?', week)
    @week_disbursements = @number_week.where.not(completed_at: nil)
                                    .where('week = ?', @number_week.first.week)
    puts "Report finished"
    @week_disbursements
  end
end
