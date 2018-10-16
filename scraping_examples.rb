driver = Selenium::WebDriver.for :chrome
driver.get 'https://www1.jmra.or.jp/announce2003/'
driver.navigate.to 'http://www.yahoo.co.jp'

# IDが一致する要素を返す
el = driver.find_element(:id, 'some_id')

# クラス名が一致する要素を返す
el = driver.find_element(:class, 'some_class_name')

# HTMLタグの名前が一致する
el = driver.find_element(:tag_name, 'div')

# アンカーテキスト(リンクテキスト)が一致する
el = driver.find_element(:link, 'anchor_text')

# XPath形式で要素を指定する
el = driver.find_element(:xpath, "//a[@href='/login']")

# cssセレクターで要素を指定する
el = driver.find_element(:css, '#some_id')


# 要素のテキストを取得
driver.find_element(:id, 'some_id').text
# 要素の属性値の取得
driver.find_element(:id, 'some_id').attribute('class')


  # ボタンやリンクをクリックする
  driver.find_element(:id, 'some_id').click

  # テキストフィールドに値を入れる
  driver.find_element(:id, 'some_field_id').send_keys 'テキスト入力'
  driver.find_element(:id, 'some_field_id').set 'テキスト入力'

  # テキストフィールドの値を空にする
  # ※ ただし、type=fileの場合はclearメソッドでエラーになるので注意
  driver.find_element(:id, 'some_field_id').clear


  #
  # キーボードの操作
  # キーボードでenterを実行する場合はこちら。

  driver.find_element(:id, '#q_name').native.send_keys(:return)
  driver.find_element(:id, '#q_name').native.send_keys(:enter)
    # チェックボックス・ラジオボタン
  # チェックボックス/ラジオボタンを選択する
  # ラジオボタンがセットされた場合にのみ、チェックをクリック
  unless driver.find_element(:id, 'some_radio_id').selected?
    driver.find_element(:id, 'some_radio_id').click
  end

  # チェックボックス/ラジオボタンの選択を解除する
  driver.find_element(:id, 'some_check_box').clear


  # 1件以上あれば要素が存在すると判定
  driver.find_elements(:id, 'some_id').size >= 1

  def has_some_id?
    driver.find_element(:id, 'some_id')
    true
  rescue
    false
  end

  driver.execute_script('return window.location.pathname')
