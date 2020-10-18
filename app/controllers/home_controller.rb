class HomeController < ApplicationController
  def dashboard

    @last_12_months = Sale.where(created_at: 11.months.ago..Date.today)
                      .group("strftime('%m-%Y', created_at)")
                      .order(created_at: :asc)
                      .sum(:amount)

    @quantity_12_month = Sale.where(created_at: 11.months.ago..Date.today)
                        .group("strftime('%m-%Y', created_at)")
                        .order(created_at: :asc)
                        .count

    @average_12_month = Sale.where(created_at: 11.months.ago..Date.today)
                        .group("strftime('%m-%Y', created_at)")
                        .order(created_at: :asc)
                        .average(:amount)

    @pie_chart_12_month = Sale.where(created_at: 11.months.ago..Date.today)
                          .group(:origin)
                          .count

    @pie_chart_6_month = Sale.where(created_at: 5.months.ago..Date.today)
                          .group(:origin)
                          .count

    @pie_chart_3_month = Sale.where(created_at: 2.months.ago..Date.today)
                          .group(:origin)
                          .count

    @pie_chart_last_month = Sale.where(created_at: 30.days.ago..Date.today)
                          .group(:origin)
                          .count

    @pie_12_month_by_blend = Sale.where(created_at: 11.months.ago..Date.today)
                          .group(:origin)
                          .count

    @pie_6_monthby_by_blend = Sale.where(created_at: 5.months.ago..Date.today)
                          .group(:origin)
                          .count

    @pie_3_month_by_blend = Sale.where(created_at: 2.months.ago..Date.today)
                          .group(:origin)
                          .count

    @pie_last_month_by_blend = Sale.where(created_at: 30.days.ago..Date.today)
                          .group(:origin)
                          .count
  end
end
