class DayDetailsController < ApplicationController
  def create
    daydetail = DayDetail.new(day_detail_params)
    unless daydetail.save(day_detail_params)
      flash[:alert] = "エラー！備考を保存できませんでした"
    end
  end
  def update
    DayDetail.find(params[:id]).update(day_detail_params)
  end

private

  def day_detail_params
    params[:day_detail].permit(:date, :remark)
  end
end
