# frozen_string_literal: true

RSpec.describe 'Авиабилеты', type: :feature do
  before(:example) do
    Capybara.app = Sinatra::Application.new
  end

  it 'удаление рейса' do
    visit('/')
    click_on('Список рейсов')
    find_button('Удалить', match: :first).click
    expect(page).not_to have_content('Сочи')
    expect(page).not_to have_content('2312')
    expect(page).not_to have_content('Адлер')
    expect(page).not_to have_content('2019-04-11')
    expect(page).not_to have_content('23:00')
    expect(page).not_to have_content('2019-06-11')
    expect(page).not_to have_content('03:30')
    expect(page).not_to have_content('Ту-134')
    expect(page).not_to have_content('1300')
  end
end
