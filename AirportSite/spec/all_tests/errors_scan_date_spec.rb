# frozen_string_literal: true

RSpec.describe 'Авиабилеты', type: :feature do
  before(:example) do
    Capybara.app = Sinatra::Application.new
  end

  it 'ошибка при поиске рейса' do
    visit('/')
    click_on('Поиск рейса')
    click_on('Найти')

    expect(page).to have_content('В поле ГОРОД ОТПРАВЛЕНИЯ используются только символы алфавита и-.')
    expect(page).to have_content('В поле ГОРОД ПРИБЫТИЯ используются только символы алфавита и-.')
    expect(page).to have_content('ДАТА должна быть в формате DD-MM-YYYY')
  end
end
