# frozen_string_literal: true

RSpec.describe 'Авиабилеты', type: :feature do
  before(:example) do
    Capybara.app = Sinatra::Application.new
  end

  it 'маршрут' do
    visit('/')
    click_on('Маршрут')

    fill_in('where_from', with: 'Владивосток')
    fill_in('where_to', with: 'Шарья')

    click_on('Найти')

    expect(page).to have_content('Результаты поиска')

    click_on('Вернуться к списку')
    expect(page).to have_content('Рейсы')
  end
end
