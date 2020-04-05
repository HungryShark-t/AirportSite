# frozen_string_literal: true

RSpec.describe 'Авиабилеты', type: :feature do
  before(:example) do
    Capybara.app = Sinatra::Application.new
  end

  it 'удаление заявки' do
    visit('/')
    click_on('Список заявок')
    find_button('Удалить', match: :first).click
    expect(page).not_to have_content('13:24')
    expect(page).not_to have_content('2019-06-17')
    expect(page).not_to have_content('Артем')
    expect(page).not_to have_content('Червяков')

    # expect(page).not_to have_content('21:33')
    # expect(page).not_to have_content('2019-01-30')
    # expect(page).not_to have_content('Bim')
    # expect(page).not_to have_content('Rich')
  end
end
