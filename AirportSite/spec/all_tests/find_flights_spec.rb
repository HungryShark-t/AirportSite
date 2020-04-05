# frozen_string_literal: true

RSpec.describe 'Авиабилеты', type: :feature do
  before(:example) do
    Capybara.app = Sinatra::Application.new
  end

  it 'поиск рейсов' do
    visit('/')
    click_on('Поиск рейса')

    fill_in('where_from', with: 'Москва')
    fill_in('where_to', with: 'Шарья')
    fill_in('date_from', with: '2019-04-10')

    click_on('Найти')

    expect(page).to have_content('Результаты поиска')
    expect(page).to have_content('Москва')
    expect(page).to have_content('Шарья')
    expect(page).to have_content('2019-04-10')

    click_on('Вернуться к списку')
  end
end
