# frozen_string_literal: true

RSpec.describe 'Авиабилеты', type: :feature do
  before(:example) do
    Capybara.app = Sinatra::Application.new
  end

  it 'поиск заявок' do
    visit('/')
    click_on('Поиск заявки')

    fill_in('date', with: '2019-05-31')
    fill_in('time', with: '08:50')

    click_on('Найти')

    expect(page).to have_content('Результаты поиска')
    expect(page).to have_content('Москва')
    expect(page).to have_content('Самара')
    expect(page).to have_content('2019-05-31')

    click_on('Вернуться к списку')
  end
end
