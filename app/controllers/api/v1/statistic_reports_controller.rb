module Api
  module V1
    class StatisticReportsController < ApplicationController

      def index
        send(params[:type])
      end

      private

      def general_reports
        today_receipts = Receipt.where(date_time: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
        today_revenue = Receipt.joins(receipt_details: :product)
          .where(date_time: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
          .sum('products.sale_price * receipt_details.quantity')

        yesterday_revenue = Receipt.joins(receipt_details: :product)
          .where(date_time: Time.zone.yesterday.beginning_of_day..Time.zone.yesterday.end_of_day)
          .sum('products.sale_price * receipt_details.quantity')
          diff_divider = today_revenue > yesterday_revenue ? today_revenue : yesterday_revenue

          today_yesterday_diff = diff_divider > 0 ? ((today_revenue - yesterday_revenue) * 100 / diff_divider) : 0

          today_lastmonth_revenue = Receipt.joins(receipt_details: :product)
          .where(date_time: (Time.zone.now - 1.month).beginning_of_day..(Time.zone.now - 1.month).end_of_day)
          .sum('products.sale_price * receipt_details.quantity')

          diff_divider = today_revenue > today_lastmonth_revenue ? today_revenue : today_lastmonth_revenue
          today_month_diff = diff_divider > 0 ? ((today_revenue - today_lastmonth_revenue) * 100 / diff_divider) : 0

        today_sale_by_hour = Receipt.joins(receipt_details: :product)
          .where(date_time: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
          .group("HOUR(CONVERT_TZ(date_time, '+00:00', '+7:00'))")
          .sum('products.sale_price * receipt_details.quantity')

        yesterday_sale_by_hour = Receipt.joins(receipt_details: :product)
          .where(date_time: Time.zone.yesterday.beginning_of_day..Time.zone.yesterday.end_of_day)
          .group("HOUR(CONVERT_TZ(date_time, '+00:00', '+7:00'))")
          .sum('products.sale_price * receipt_details.quantity')

        sale_by_seven_day = Receipt.joins(receipt_details: :product)
          .where(date_time: (Time.zone.now - 7.day)..Time.zone.now)
          .group("DATE(CONVERT_TZ(date_time, '+00:00', '+7:00'))")
          .sum('products.sale_price * receipt_details.quantity')

        sale_by_month = Receipt.joins(receipt_details: :product)
          .where("MONTH(CONVERT_TZ(date_time, '+00:00', '+7:00')) = ? AND YEAR(CONVERT_TZ(date_time, '+00:00', '+7:00')) = ?", Time.zone.now.month, Time.zone.now.year)
          .group("DAY(CONVERT_TZ(date_time, '+00:00', '+7:00'))")
          .sum('products.sale_price * receipt_details.quantity')

        sale_by_last_month = Receipt.joins(receipt_details: :product)
          .where("MONTH(CONVERT_TZ(date_time, '+00:00', '+7:00')) = ? AND YEAR(CONVERT_TZ(date_time, '+00:00', '+7:00')) = ?", Time.zone.now.month - 1 , Time.zone.now.year)
          .group("DAY(CONVERT_TZ(date_time, '+00:00', '+7:00'))")
          .sum('products.sale_price * receipt_details.quantity')

        today_ten_product_sale = Receipt.joins(receipt_details: :product)
          .where(date_time: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
          .group('products.name')
          .limit(10)
          .sum('receipt_details.quantity')

        yesterday_ten_product_sale = Receipt.joins(receipt_details: :product)
          .where(date_time: Time.zone.yesterday.beginning_of_day..Time.zone.yesterday.end_of_day)
          .group('products.name')
          .limit(10)
          .sum('receipt_details.quantity')

        seven_day_ten_product_sale = Receipt.joins(receipt_details: :product)
          .where(date_time: (Time.zone.now - 7.day)..Time.zone.now)
          .group('products.name')
          .limit(10)
          .sum('receipt_details.quantity')

        this_month_ten_product_sale = Receipt.joins(receipt_details: :product)
          .where("MONTH(CONVERT_TZ(date_time, '+00:00', '+7:00')) = ? AND YEAR(CONVERT_TZ(date_time, '+00:00', '+7:00')) = ?", Time.zone.now.month, Time.zone.now.year)
          .group('products.name')
          .limit(10)
          .sum('receipt_details.quantity')

        last_month_ten_product_sale = Receipt.joins(receipt_details: :product)
          .where("MONTH(CONVERT_TZ(date_time, '+00:00', '+7:00')) = ? AND YEAR(CONVERT_TZ(date_time, '+00:00', '+7:00')) = ?", Time.zone.now.month - 1 , Time.zone.now.year)
          .group('products.name')
          .limit(10)
          .sum('receipt_details.quantity')

        today_sale_by_hour_graph = [];
        today_sale_by_hour.each do |key, value|
          today_sale_by_hour_graph.push({time: key, revenue: value});
        end

        yesterday_sale_by_hour_graph = [];
        yesterday_sale_by_hour.each do |key, value|
          yesterday_sale_by_hour_graph.push({time: key, revenue: value});
        end

        sale_by_seven_day_graph = [];
        sale_by_seven_day.each do |key, value|
          sale_by_seven_day_graph.push({time: key, revenue: value});
        end

        sale_by_month_graph = [];
        sale_by_month.each do |key, value|
          sale_by_month_graph.push({time: key, revenue: value});
        end

        sale_by_last_month_graph = [];
        sale_by_last_month.each do |key, value|
          sale_by_last_month_graph.push({time: key, revenue: value});
        end

        today_ten_product_sale_graph = [];
        today_ten_product_sale.each do |key, value|
          today_ten_product_sale_graph.push({name: key, quantity: value});
        end

        yesterday_ten_product_sale_graph = [];
        yesterday_ten_product_sale.each do |key, value|
          yesterday_ten_product_sale_graph.push({name: key, quantity: value});
        end

        seven_day_ten_product_sale_graph = [];
        seven_day_ten_product_sale.each do |key, value|
          seven_day_ten_product_sale_graph.push({name: key, quantity: value});
        end

        this_month_ten_product_sale_graph = [];
        this_month_ten_product_sale.each do |key, value|
          this_month_ten_product_sale_graph.push({name: key, quantity: value});
        end

        last_month_ten_product_sale_graph = [];
        last_month_ten_product_sale.each do |key, value|
          last_month_ten_product_sale_graph.push({name: key, quantity: value});
        end

        json_response data: {
            receipt_count: today_receipts.count, today_revenue: today_revenue, today_yesterday_diff: today_yesterday_diff.round(2),
            today_month_diff: today_month_diff.round(2), today_sale_by_hour_graph: today_sale_by_hour_graph,
            yesterday_sale_by_hour_graph: yesterday_sale_by_hour_graph, sale_by_seven_day_graph: sale_by_seven_day_graph,
            sale_by_month_graph: sale_by_month_graph, sale_by_last_month_graph: sale_by_last_month_graph,
            today_ten_product_sale_graph: today_ten_product_sale_graph, yesterday_ten_product_sale_graph: yesterday_ten_product_sale_graph,
            last_month_ten_product_sale_graph: last_month_ten_product_sale_graph, seven_day_ten_product_sale_graph: seven_day_ten_product_sale_graph,
            this_month_ten_product_sale_graph: this_month_ten_product_sale_graph,
          },
          status: 200
      end
    end
  end
end
