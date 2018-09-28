class UserOwnedExamsController < ApplicationController
  def new
    @exam = Exam.find(params[:exam_id])
    @user = User.find(params[:user_id])
    @user_owned_exam = @exam.user_owned_exams.new
  end

  def create
    @user_owned_exam = UserOwnedExam.new(user_owned_exam_params)
    if @user_owned_exam.save
      redirect_to user_path(params[:user_id])
      flash[:notice] = "講習に登録しました！"
    else
      redirect_to user_path(params[:user_id])
      flash[:alert] = "登録できませんでした！"
    end
  end

  def update
    @user_owned_exam = UserOwnedExam.find(params[:id])
    if @user_owned_exam.update(user_owned_exam_params)
      render json: @user_owned_exam
    else
      flash[:alert] = "更新できませんでした"
    end
  end

  def destroy

  end

  private
  def user_owned_exam_params
    params.require(:user_owned_exam).permit(:user_id, :exam_id, :exam_number, :exam_ticket, :payment_confirmation, :announcement_date, :remark).merge({user_id: params[:user_id], exam_id: params[:exam_id]})
  end
end
