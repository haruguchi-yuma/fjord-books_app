# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '今日の天気'
    fill_in '内容', with: '晴れ'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text '今日の天気'
    assert_text '晴れ'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集'

    fill_in 'タイトル', with: '昨日の天気'
    fill_in '内容', with: '雨'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text '昨日の天気'
    assert_text '雨'
  end

  test 'destroying a Report' do
    visit reports_url
    assert_text '今日の晩ごはん'
    page.accept_confirm do
      click_on '削除'
    end
    assert_no_text '今日の晩ごはん'
    assert_text '日報が削除されました。'
  end
end
