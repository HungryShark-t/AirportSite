# frozen_string_literal: true

RSpec.describe 'Авиабилеты', type: :feature do
  before(:example) do
    Capybara.app = Sinatra::Application.new
  end

  it 'нахождение рейсов для заявки' do
    visit('/')
    click_on('Список заявок')
    find_button('Найти подходящие рейсы', match: :first).click
    click_on('Вернуться к списку')
    expect(page).to have_content('Заявки')
  end
end
