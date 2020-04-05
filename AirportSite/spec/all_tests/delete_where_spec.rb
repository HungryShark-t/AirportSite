# frozen_string_literal: true

RSpec.describe 'Авиабилеты', type: :feature do
  before(:example) do
    Capybara.app = Sinatra::Application.new
  end

  it 'удаление заявки по отправлению' do
    visit('/')
    click_on('Список заявок')
    click_on('По месту отправления')

    fill_in('where_f', with: 'Орел')
    click_on('Подтвердить')

    expect(page).to have_content('Заявки')
  end

  it 'удаление заявки по прибытию' do
    visit('/')
    click_on('Список заявок')
    click_on('По месту прибытия')

    fill_in('where_t', with: 'Мантурово')
    click_on('Подтвердить')

    expect(page).to have_content('Заявки')
  end
end
