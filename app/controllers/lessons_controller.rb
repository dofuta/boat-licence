class LessonsController < ApplicationController

  def index
    @lessons = Lesson.order(updated_at: :desc).limit(20)
    #jbuilderを返す
    respond_to do |format|
      format.html
      format.json do
        # user_owned_lessonを作成する際に必要なuser_idをjbuilderへ受け渡す
        @user_id = params[:user_id]
        #date and type 検索
        if    params[:date] != "" && params[:type_number] != ""
          @lessons = Lesson.where(date: params[:date]).where(type_number: params[:type_number])
        elsif params[:date] != "" && params[:type_number] == ""
          @lessons = Lesson.where(date: params[:date])
        else
          @lessons = Lesson.where(type_number: params[:type_number])
        end
      end
    end
  end

  def create
    Lesson.create()
  end

  private
  def lesson_params
    params.require[:lesson].permit(:user_id, :place_id, :type_number, :date, :gg_event_id, :input_date, :input_type)
  end
end
