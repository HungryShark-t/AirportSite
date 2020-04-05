# frozen_string_literal: true

RSpec.describe 'Авиабилеты', type: :feature do
  before(:example) do
    Capybara.app = Sinatra::Application.new
  end

  it 'добавление рейса' do
    visit('/')
    click_on('Список рейсов')
    click_on('Добавить рейс')

    fill_in('number', with: 1231)
    fill_in('where_from', with: 'Pol')
    fill_in('where_to', with: 'Bol')

    fill_in('time_from', with: '21:33')
    fill_in('date_from', with: '2019-01-30')
    fill_in('time_to', with: '22:55')
    fill_in('date_to', with: '2019-02-03')
    select('ИЛ-64', from: 'type')
    fill_in('cost', with: 12_000)

    click_on('Добавить')

    expect(page).to have_content('1231')
    expect(page).to have_content('Pol')
    expect(page).to have_content('Bol')
    expect(page).to have_content('21:33')
    expect(page).to have_content('2019-01-30')
    expect(page).to have_content('22:55')
    expect(page).to have_content('2019-02-03')
    expect(page).to have_content('ИЛ-64')
    expect(page).to have_content('12000')
  end
end
