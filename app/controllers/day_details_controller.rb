class DayDetailsController < ApplicationController
  def create
    daydetail = DayDetail.new(day_detail_params)
    if daydetail.save(day_detail_params)
      redirect_to calendar_path(params[:current_date],0)
      flash[:notice] = "更新しました！"
    else
      flash[:alert] = "更新できませんでした！"
    end
  end
  def update
    DayDetail.create(day_detail_params)
  end

private

  def day_detail_params
    params[:daydetail].permit(:date, :remark)
  end
end
