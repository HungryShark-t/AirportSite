# frozen_string_literal: true

RSpec.describe 'Авиабилеты', type: :feature do
  before(:example) do
    Capybara.app = Sinatra::Application.new
  end

  it 'добавление заявки' do
    visit('/')
    click_on('Список заявок')
    click_on('Добавить заявку')

    fill_in('num', with: 1231)
    fill_in('where_from', with: 'Pol')
    fill_in('where_to', with: 'Bol')
    fill_in('time', with: '21:33')
    fill_in('date', with: '2019-01-30')
    fill_in('name', with: 'Bim')
    fill_in('surname', with: 'Rich')

    click_on('Добавить')

    expect(page).to have_content('1231')
    expect(page).to have_content('Pol')
    expect(page).to have_content('Bol')
    expect(page).to have_content('21:33')
    expect(page).to have_content('2019-01-30')
    expect(page).to have_content('Bim')
    expect(page).to have_content('Rich')
  end
end
