class LessonsController < ApplicationController

  def index
    @lessons = Lesson.order(date: :desc).limit(20)
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

  def new
    @lesson   = Lesson.new
    @places   = Place.all
    @teachers = User.where(teacher: 1)
  end

  def create
    lesson = Lesson.new(lesson_params)
    if lesson.save
      redirect_to lessons_path
      flash.delete(:notice)
      flash[:notice] = "新規講習を保存しました！"
    else
      flash.delete(:alert)
      flash[:alert] = "保存できませんでした! 日付, 講習タイプ, 会場 を正しく入力してください。"
      redirect_to new_lesson_path
    end
  end

  def search
    @lessons = Lesson.order(date: :desc).limit(20)
    #jbuilderを返す
    respond_to do |format|
      format.html
      format.json do
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

  def show

  end

  private
  def lesson_params
    params.require(:lesson).permit(:place_id, :type_number, :date, :gg_event_id, :remark, teacher_ids:[])
  end
end
