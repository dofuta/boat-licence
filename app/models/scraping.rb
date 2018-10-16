class Scraping
  def self.search(month)
    driver = Selenium::WebDriver.for :chrome
    driver.manage.timeouts.implicit_wait = 5 # 5seconds待っても要素が現れなければ終了するようにする初期設定
    driver.get 'https://www1.jmra.or.jp/announce2003'
    driver.navigate.to 'https://www1.jmra.or.jp/announce2003'
    # アンカーテキスト(リンクテキスト)が一致する
    kantou  = driver.find_element(:link, '関東')
    kantou.click

    # frameを選択
    frame_naiyo = driver.find_element(:name, 'naiyo')
    driver.switch_to.frame(frame_naiyo)
    # そのframeの中のframeを選択
    frame_siken = driver.find_element(:name, 'siken')
    driver.switch_to.frame(frame_siken)

    # アンカーテキスト(リンクテキスト)が一致するものを取得
    gakka  = driver.find_element(:partial_link_text, '学科試験')
    jitugi = driver.find_element(:partial_link_text, '実技試験')
    # リンクを取得する
    gakka_link  = gakka.attribute('href')
    jitugi_link = jitugi.attribute('href')

    puts "学科試験を取得開始します"
    # まずは学科試験へ移動する
    gakka.click
    # 大元のframeに移動
    driver.switch_to.default_content
    # framwを取得、移動
    frame_naiyo = driver.find_element(:name, 'naiyo')
    driver.switch_to.frame(frame_naiyo)
    # frameを取得、移動
    frame_result = driver.find_element(:name, "result")
    driver.switch_to.frame(frame_result)
    # frameを取得、移動
    frame_result2 = driver.find_element(:name, "result2")
    driver.switch_to.frame(frame_result2)
    # aタグを取得する
    gakka_kensaku_page = driver.find_element(:partial_link_text, "合格発表日から検索")
    # 合格発表日で検索するページへ
    gakka_kensaku_page.click
    # 合格発表日の検索窓を取得する
    frame_naiyo = driver.find_element(:name, 'naiyo')
    # frame移動
    driver.switch_to.frame(frame_naiyo)
    select_month  = driver.find_element(:name, "cbogmonth")
    #セレクトタグの要素を指定してSelectクラスのインスタンスを作成
    select_month  = Selenium::WebDriver::Support::Select.new(select_month)
    # URLを入れておく配列
    links = []
    # 月を指定(monthはこのclassメソッドの引数)
    month = month - 1
    select_month.select_by(:index, month)
    for i in 0..30 do
      select_day = driver.find_element(:name, "cbogday")
      #セレクトタグの要素を指定してSelectクラスのインスタンスを作成
      select_day = Selenium::WebDriver::Support::Select.new(select_day)
      select_day.select_by(:index, i)
      search_button = driver.find_element(:name, "cmdSrc0")
      # 検索実行（ボタンをクリック）
      search_button.click
      # 検索結果一覧の取得
      result_links_el = driver.find_elements(:tag_name, "a")
      if result_links_el.size > 1
        # 最後のaタグは"戻る"ボタンなので、配列から削除する
        result_links_el.pop
        # 合格発表のリンク１つ１つを配列処理してlinkに入れる
        result_links_el.each do |link_el|
          links << link_el.attribute('href')
        end
      end
    end
    puts "取得した各試験のURL一覧"
    puts links

    links.each do |link|
      driver.get link
      driver.navigate.to link
      # 試験IDの要素の取得
      siken_id = driver.find_element(:css, "body > center > table:nth-child(1) > tbody > tr:nth-child(2) > td:nth-child(1)")
      # textのみ取り出す
      siken_id = siken_id.text
      # 取り出したtextの中の数字だけ取り出す
      siken_id = siken_id.match(/[0-9]{6}/)
      puts "試験ID #{siken_id} を取得しました"

      exam_number_table = driver.find_element(:css, "body > center > table:nth-child(3) > tbody")
      exam_number_line  = exam_number_table.find_elements(:tag_name, "tr")
      exam_number_line.each do |line|
        # 各行から１つずつの受験番号を取り出す
        exam_numbers = line.find_elements(:tag_name, "td")
        exam_numbers.each do |exam_number|
          # textを取り出す
          exam_number = exam_number.text
          # numが"以下余白"や"該当者なし"でなければ、
          if exam_number != "以下余白" && exam_number != "該当者なし" && exam_number != ""
            # PassedNumberのインスタンスを生成する
            GakkaPassedNumber.create(exam_number: exam_number, exam_id: siken_id)
            puts "受験番号 #{exam_number} のインスタンスを生成しました"
          end
        end
      end
    end

    puts "ここから実技試験を取得開始します"
    # 次は実技試験へ移動する
    jitugi.click
    # 大元のframeに移動
    driver.switch_to.default_content
    # framwを取得、移動
    frame_naiyo = driver.find_element(:name, 'naiyo')
    driver.switch_to.frame(frame_naiyo)
    # frameを取得、移動
    frame_result = driver.find_element(:name, "result")
    driver.switch_to.frame(frame_result)
    # frameを取得、移動
    frame_result2 = driver.find_element(:name, "result2")
    driver.switch_to.frame(frame_result2)
    # aタグを取得する
    gakka_kensaku_page = driver.find_element(:partial_link_text, "合格発表日から検索")
    # 合格発表日で検索するページへ
    gakka_kensaku_page.click
    # 合格発表日の検索窓を取得する

    frame_naiyo = driver.find_element(:name, 'naiyo')
    driver.switch_to.frame(frame_naiyo)
    select_month  = driver.find_element(:name, "cbogmonth")

    #セレクトタグの要素を指定してSelectクラスのインスタンスを作成
    select_month  = Selenium::WebDriver::Support::Select.new(select_month)

    # URLを入れておく配列
    links = []
    # 月を指定(monthはこのclassメソッドの引数)
    month = month - 1
    select_month.select_by(:index, month)
    for i in 0..30 do
      select_day = driver.find_element(:name, "cbogday")
      #セレクトタグの要素を指定してSelectクラスのインスタンスを作成
      select_day = Selenium::WebDriver::Support::Select.new(select_day)
      select_day.select_by(:index, i)
      search_button = driver.find_element(:name, "cmdSrc0")
      # 検索実行（ボタンをクリック）
      search_button.click
      # 検索結果一覧の取得
      result_links_el = driver.find_elements(:tag_name, "a")
      if result_links_el.size > 1
        # 最後のaタグは"戻る"ボタンなので、配列から削除する
        result_links_el.pop
        # 合格発表のリンク１つ１つを配列処理してlinkに入れる
        result_links_el.each do |link_el|
          links << link_el.attribute('href')
        end
      end
    end
    puts "取得した各試験のURL一覧"
    puts links

    links.each do |link|
      driver.get link
      driver.navigate.to link
      # 試験IDの要素の取得
      siken_id = driver.find_element(:css, "body > center > table:nth-child(1) > tbody > tr:nth-child(2) > td:nth-child(1)")
      # textのみ取り出す
      siken_id = siken_id.text
      # 取り出したtextの中の数字だけ取り出す
      siken_id = siken_id.match(/[0-9]{6}/)
      puts "試験ID #{siken_id} を取得しました"

      exam_number_table = driver.find_element(:css, "body > center > table:nth-child(3) > tbody")
      exam_number_line  = exam_number_table.find_elements(:tag_name, "tr")
      exam_number_line.each do |line|
        # 各行から１つずつの受験番号を取り出す
        exam_numbers = line.find_elements(:tag_name, "td")
        exam_numbers.each do |exam_number|
          # textを取り出す
          exam_number = exam_number.text
          # numが"以下余白"や"該当者なし"でなければ、
          if exam_number != "以下余白" && exam_number != "該当者なし" && exam_number != ""
            # PassedNumberのインスタンスを生成する
            JitugiPassedNumber.create(exam_number: exam_number, exam_id: siken_id)
            puts "受験番号 #{exam_number} のインスタンスを生成しました"
          end
        end
      end
    end

    driver.quit # ブラウザ終了
  end
end
