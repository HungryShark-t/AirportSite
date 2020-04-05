# frozen_string_literal: true

RSpec.describe 'Авиабилеты', type: :feature do
  before(:example) do
    Capybara.app = Sinatra::Application.new
  end

  it 'ошибка при составление маршрута' do
    visit('/')
    click_on('Маршрут')
    click_on('Найти')

    expect(page).to have_content('В поле ГОРОД ОТПРАВЛЕНИЯ используются только символы алфавита и-.')
    expect(page).to have_content('В поле ГОРОД ПРИБЫТИЯ используются только символы алфавита и-.')
  end
end
