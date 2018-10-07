class ExamsController < ApplicationController

  def index
    @exams = Exam.order(updated_at: :desc).limit(20)
    #jbuilderを返す
    respond_to do |format|
      format.html
      format.json do
        # user_owned_examを作成する際に必要なuser_idをjbuilderへ受け渡す
        @user_id = params[:user_id]
        #date and type 検索
        if    params[:date] != "" && params[:type_number] != "" && params[:announcement_date] != ""
          @exams = Exam.where(date: params[:date]).where(type_number: params[:type_number]).where(announcement_date: params[:announcement_date])
        elsif params[:date] != "" && params[:type_number] != "" && params[:announcement_date] == ""
          @exams = Exam.where(date: params[:date]).where(type_number: params[:type_number])
        elsif params[:date] != "" && params[:type_number] == "" && params[:announcement_date] != ""
          @exams = Exam.where(date: params[:date]).where(announcement_date: params[:announcement_date])
        elsif params[:date] == "" && params[:type_number] != "" && params[:announcement_date] != ""
          @exams = Exam.where(type_number: params[:type_number]).where(announcement_date: params[:announcement_date])
        elsif params[:date] != "" && params[:type_number] == "" && params[:announcement_date] == ""
          @exams = Exam.where(date: params[:date])
        elsif params[:date] == "" && params[:type_number] != "" && params[:announcement_date] == ""
          @exams = Exam.where(type_number: params[:type_number])
        else
          @exams = Exam.where(announcement_date: params[:announcement_date])
        end
      end
    end
  end

  def create
    Exam.create()
  end

  private
  def exam_params
    params.require[:exam].permit(:user_id, :place_id, :type_number, :date, :gg_event_id)
  end
end
