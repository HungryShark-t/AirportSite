# frozen_string_literal: true

RSpec.describe 'Авиабилеты', type: :feature do
  before(:example) do
    Capybara.app = Sinatra::Application.new
  end

  it 'ошибка при поиске заявки' do
    visit('/')
    click_on('Поиск заявки')
    click_on('Найти')

    expect(page).to have_content('ДАТА должна быть в формате DD-MM-YYYY')
    expect(page).to have_content('ВРЕМЯ должно быть в формате HH:MM')
  end
end
