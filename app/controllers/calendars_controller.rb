class CalendarsController < ApplicationController
  def index
    # ナブバーのタイトル設定
    set_page_name("カレンダー")
    # 今日の日付を取得する
    @today = Date.today
    # params[:current_date]に値があればそれを採用、なければ今日の月をcurrent_dateに採用する
    @current_date = params[:current_date] != nil ? params[:current_date].to_date : @today
    # 翌月、前月のボタンに合わせてcurrent_dateを更新する
    @current_date = updated_month(@current_date)
    # 1ヶ月の日付の配列
    @days = []
    # 1日めの日付
    beginning_of_month = @current_date.beginning_of_month
    # 月の終わりの日付の日のみ（つまり数字）
    last_day = @current_date.end_of_month.day - 1
    # 配列に日付を一日ずつ入れる
    for i in 0..last_day do
      date   = beginning_of_month + i.day
      # 各日のremarkを取得する
      day_detail = DayDetail.find_by(date: date) ? DayDetail.find_by(date: date) : DayDetail.new(date: date)
      # 各講習の情報を、ユーザー情報を含めてとってくる
      jitugi  = Lesson.where(type_number: 0).where(date: date).includes(:users)
      syokyuu = Lesson.where(type_number: 1).where(date: date).includes(:users)
      joukyuu = Lesson.where(type_number: 2).where(date: date).includes(:users)
      tokusyu = Lesson.where(type_number: 3).where(date: date).includes(:users)
      kosen   = Lesson.where(type_number: 3).where(date: date).includes(:users)
      # 講習の情報をまとめる
      lessons = jitugi + syokyuu + joukyuu + tokusyu + kosen
      # boatを１つのリストにまとめる
      boat_list = []
      lessons.each do |lesson|
        boat_list << lesson.boat.id
      end
      day = {date:      date,
            day_detail: day_detail,
            boat_list:  boat_list.empty? ? nil : boat_list,
            jitugi:     jitugi,
            syokyuu:    syokyuu,
            joukyuu:    joukyuu,
            tokusyu:    tokusyu,
            kosen:      kosen
            }
      @days << day
    end

# day_details_tableを作って、そこに日付を保存して備考とかを保持させたら良い。
# このコントローラで検索して、一致したら{date: 日付, remark: nul もしくは 値}のハッシュの構造で渡せないだろうか？
# CalenderDateモデルは作りたくない。365日全て生成するのはなんだか冗長な気がするのだ。Date_Remarkとか、Day_Detailモデルというのを作成したらどうだろう。

  end

  def updated_month(current_date)
    # 翌月、前月のボタンが押されていたら、params[:next_or_ago]に値が入るので、それに合わせて分岐
    current_date =
    case params[:next_or_ago]
    when "prev"
      current_date.prev_month
    when "next"
      current_date.next_month
    else
      current_date
    end
    return current_date
  end
end





#
#
# # current_monthに値がなければ今日の月をcurrent_monthに採用する
# @current_month = params[:current_month] != nil ? @params[:current_month] : @today.month
# # current_yearに値がなければ今日の年をcurrent_yearに採用する
# @current_year  = params[:current_year]  != nil ? @params[:current_year]  : @today.year
#
#
# # 現在の表示されている月が12月で、かつ翌月ボタンが押されたら
# if @current_month == 12 && params[:next_month] == 1
#   # 年を一年増やして
#   @current_year += 1
#   # 月を1月にする
#   @current_month = 1
# # 翌月ボタンが押されたら
# elsif params[:next_month] = 1
#   # 月を1増やす
#   @current_month += 1
# end
