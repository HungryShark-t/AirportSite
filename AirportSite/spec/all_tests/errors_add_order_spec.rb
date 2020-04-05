# frozen_string_literal: true

RSpec.describe 'Авиабилеты', type: :feature do
  before(:example) do
    Capybara.app = Sinatra::Application.new
  end

  it 'ошибка при добавление заявки' do
    visit('/')
    click_on('Список заявок')
    click_on('Добавить заявку')
    click_on('Добавить')

    expect(page).to have_content('В поле ГОРОД ОТПРАВЛЕНИЯ используются только символы алфавита и-.')
    expect(page).to have_content('В поле ГОРОД ПРИБЫТИЯ используются только символы алфавита и-.')
  end
end
