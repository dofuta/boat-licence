# README
 - Ruby 2.3.1
 - rails 5.2.1

<br>

# DB 設計

## users table
> userモデルと結びつく

|Column|Type  |Options                   |Remark       |
|------|----  |-------                   |------       |
|email |string|null: false, uniquer: true|メールアドレス
|name  |string|index: true               |氏名
|name_furigana|string|index: true|ふりがな|
|former_name|string||旧姓|
|former_name_furigana|string||旧姓ふりがな|
|gender|integer|null: false|男: 0  女:1|
|birth|date|null: false|生年月日|
|nationality|string||国籍|
|permanent_address |string||本籍地|
|former_permanent_address|string||旧本籍地|
|license_number|integer||免許番号|
|license_expiration_date|date||有効期限|
|license_status|integer||1: 一級, 2: 二級, 4: 特殊（合計で表す。6なら、二級と特殊）
|phone_number|integer|null: false|電話番号1|
|phone_number2|integer||電話番号2|
|postal_code|integer|null: false|郵便番号|
|address|string|null: false|住所|
|postal_code2|integer||郵便番号2|
|address2|string||住所2|
|admin|integer||1 or null 管理者|
|teacher|integer|| 1 or null 講師|

>name, name_furiganaは検索に使用するので、indexを追加
>emailは一意なものにする

#### Association
- has_many :user_owned_lessons, dependent: :destroy
> user_owned_lessonを所有する。

- has_many :user_owned_exams, dependent: :destroy
> user_owned_examを所有する。

- has_many :user_teaching_lessons, dependent: :destroy
> user_teaching_lessonを所有する。

- has_many :taken_lessons, through: :user_owned_lessons, source: :lesson
> lessonをtaken_lessonとして、user_owned_lessonを通じて多数所有する。

- has_many :taken_exams, through: :user_owned_exams, source: :exam
> examをtaken_examとして、user_owned_examを通じて多数所有する。

- has_many :teaching_lessons, through: :user_teaching_lessons, source: :lesson
> lessonをteaching_lessonとして、user_teaching_lessonを通じて多数所有する。

- has_many :holidays, dependent: :destroy
> holidayを所有する

- has_and_belongs_to_many :friendships, class_name: “User”, join_table: :friendships, foreign_key: :user_id, association_foreign_key: :friend_user_id
> 友達をユーザーモデル内で定義（friendshipsテーブル（モデルなし）を別途作成、利用）

<br>
<br>

## friendships table
> userの友達関係を記録する。モデルは存在しない！

|Column|Type  |Options                   |Remark       |
|------|----  |-------                   |------       |
|user_id|integer||※注|
|friend_user_id|integer||※注|
> ※user_id と friend_user_idの組み合わせにunique制約をかける

<br>
<br>

## user_owned_lessons table
> ユーザー固有の講習情報を保存するuser_owned_lessonモデルと結びつく

|Column|Type  |Options                   |Remark       |
|------|----  |-------                   |------       |
|user_id|references|:user, null: false, foreign_key true||
|lesson_id|references|:lesson, null: false, foreign_key: true||
|payment_confirmation|integer||1 or null 領収|
|remark|text||備考|

#### Association
- belongs_to :user
> userに従属

- belongs_to :lesson
> lessonに従属



## user_owned_exams tabel
> ユーザー固有の試験情報を保存するuser_owned_examモデルと結びつく

|Column|Type  |Options                   |Remark       |
|------|----  |-------                   |------       |
|user_id|references|:user, null: false, foreign_key: true||
|exam_id|references|:exam, null: false, foreign_key: true||
|payment_confirmation|integer||未収: null, 領収: 1|
|re-exam_by_cancel|integer|| 1 or null 再試験（キャンセルによるもの）|
|re-exam_by_fail|integer||1 or null 再試験（不合格によるもの）|
|shintaikensa|integer||1 or null 身体検査の要不要|
|syoumeisyo|integer||1 or null 身体検査証明書の有無|
|exam_ticket|integer||1 or null 受験票受け渡し|
|text_book|integer||1 0r null 教材の発送|
|exam_number|integer||受験番号|
|pass_or_fail|integer||0 or 1, 合否|
|remark|text||備考|

#### Association
- belongs_to :user
> userへの従属

- belongs_to :exam
> examへの従属

<br>
<br>


## lessons table
> 各講習を保存するlessonモデルと結びつく

|Column|Type  |Options                   |Remark       |
|------|----  |-------                   |------       |
|user_id|references|:user||
|lesson_place_id|references|:lesson_place, null: false, foreign_key: true||
|type|integer|null: false|実技: 0, 初級: 1, 上級: 2, 特殊: 3|
|date|date|null: false|日付|
|gg_event_id|integer||Googleカレンダーのイベントid. GASによってイベントが作成された後、ここにidを保存しておく|

#### Association
- has_many :user_owned_lessons
> user_owned_lessonを複数持つ

- has_many :users, through: :user_owned_lessons
> user_owned_lessonを通してuserを複数持つ

- has_one :lesson_place
> lesson_placeを１つ持つ

- has_many :users, through: :user_teaching_lessons
> teacherを複数持つ

- has_many :users, through: :user_teaching_lessons
> teacherを通してuserを複数持つ

<br>
<br>

## lesson_places table
> lesson_placeモデルと結びつく

|Column|Type  |Options                   |Remark       |
|------|----  |-------                   |------       |
|facility_name|string|null: false, index: true|施設名|
|address|string|null: false| 住所|
|map_image|text||地図画像|
|url|string||url|

#### Association
- belongs_to :lesson
> lessonに従属する

<br>
<br>

## exams table
> 試験日程を保存するexamモデルと結びつく

|Column|Type  |Options                   |Remark       |
|------|----  |-------                   |------       |
|exam_place_id|references|:exam_place, null: false, foreign_key: true|
|date|date|null: false|日付|
|type|integer|null: false|一二級: 0, 特殊: 1|
|announcement_date|date|null: false|合格発表日|
|gg_event_id|integer||GoogleカレンダーのイベントID|

#### Association
- has_many :user_owned_exams
> user_owned_examを複数持つ

- has_many :users, through: :user_owned_exam
> userを通じてuser_owned_examを複数持つ

- has_one :exam_place
> exam_placeを１つ持つ

<br>
<br>

## exam_places table
> exam_placeモデルと結びつく

|Column|Type  |Options                   |Remark       |
|------|----  |-------                   |------       |
|facility_name|string|null: false|施設名|
|address|string|null: false|住所|
|map_image|text||地図画像|
|url|string||url|

#### Association
- belongs_to :exam
> examに従属する

<br>
<br>

## user_teaching_lessons table
> user_teaching_lessonモデルと結びつく。user_teaching_lessonモデルは、userが講師を担当するlessonと結びつける中間テーブル

|Column|Type  |Options                   |Remark       |
|------|----  |-------                   |------       |
|user_id|references|:user, null: false, foreign_key: true||
|lesson_id|references|:user, null: false, foreign_key: true|||

#### Association
- belongs_to :user
> userモデルに従属する

- belongs_to :lesson
> lessonモデルに従属する

<br>
<br>

## holidays table
> holidayモデルと結びつく。holidayモデルは、講師の休みの日を保存するモデル。

|Column|Type  |Options                   |Remark       |
|------|----  |-------                   |------       |
|user_id|references|:user, null: false, foreign_key: true||
|date|date|null: false|日付|


#### Association
- belongs_to :user
> userモデルに従属する
