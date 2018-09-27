class UsersController < ApplicationController
  def index
    set_page_name("受講生検索")
    @users = User.order(updated_at: :desc).limit(20)
  end

  def search
    if params[:keyword] == "all"
      @users = User.all
    else
      #漢字 or ふりがな 検索
      @users = User.where('name LIKE ?',"%#{params[:keyword]}%").or(User.where('name_furigana LIKE ?',"%#{params[:keyword]}%")).reverse_order
    end
    #jbuilderを返す
    render json: @users
  end

  def show
    # 選択したuserを表示
    @user = User.find(params[:id])
    @user_owned_lessons = @user.user_owned_lessons.includes(:lesson)
    @user_owned_exams   = @user.user_owned_exams.includes(:exam)
    set_page_name(@user.name)
  end

  def update
    @user = User.find(params[:id])
    # updateできたら
    if @user.update(user_params)
      render json: @user
    else
      flash[:alert] = "更新できませんでした"
    end
  end

  private
  def set_page_name(page_name)
    @page = page_name
  end

  def user_params
    params.require(:user).permit(:email, :name, :name_furigana, :former_name, :former_name_furigana, :gender, :birth, :nationality, :permanent_address, :former_permanent_address, :license_number, :license_expiration_date, :license_status, :phone_number, :phone_number2, :postal_code, :address, :postal_code2, :address2, :remark)
  end
end
