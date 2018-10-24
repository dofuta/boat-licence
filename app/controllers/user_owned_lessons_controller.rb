class UserOwnedLessonsController < ApplicationController

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @user = User.find(params[:user_id])
    @user_owned_lesson = @lesson.user_owned_lessons.new
  end

  def create
    @user_owned_lesson = UserOwnedLesson.new(user_owned_lesson_params)
    if @user_owned_lesson.save
      redirect_to user_path(params[:user_id])
      flash.delete(:notice)
      flash[:notice] = "講習に登録しました！"
    else
      redirect_to user_path(params[:user_id])
      flash.delete(:notice)
      flash[:alert] = "登録できませんでした！"
    end
  end

  def update
    @user_owned_lesson = UserOwnedLesson.find(params[:id])
    if @user_owned_lesson.update(user_owned_lesson_params)
      render json: @user_owned_lesson
    else
      flash.delete(:notice)
      flash[:alert] = "更新できませんでした"
    end
  end

  def destroy

  end

  private
  def user_owned_lesson_params
    params.require(:user_owned_lesson).permit(:user_id, :lesson_id, :payment_confirmation, :remark, :updated_at).merge({user_id: params[:user_id], lesson_id: params[:lesson_id]})
  end
end
