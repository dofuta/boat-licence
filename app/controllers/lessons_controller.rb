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
    @boats    = Boat.all
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to new_lesson_path
      flash.delete(:notice)
      flash[:notice] = "新規講習を保存しました！"
    else
      # バリデーションに合わせてエラーをjsonで返す
      if @lesson.errors
        errors = []
        @lesson.errors.messages.each do |key, value|
          error = key.to_s + value[0]
          errors << error
        end
      end
      flash.delete(:alert)
      flash[:alert] = errors
      # redirect_to new_lesson_path
      @places   = Place.all
      @teachers = User.where(teacher: 1)
      @boats    = Boat.all
      render "new"
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

  def edit
    @lesson   = Lesson.find(params[:id])
    @places   = Place.all
    @teachers = User.where(teacher: 1)
    @boats    = Boat.all
    @users    = @lesson.users
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to search_lessons_path
    else
      flash.delete(:alert)
      flash[:alert] = "保存できませんでした! 日付, 講習タイプ, 会場 を正しく入力してください。"
      redirect_to edit_lesson_path
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit(:place_id, :type_number, :date, :gg_event_id, :remark, teacher_ids:[], boat_ids:[])
  end
end
