# frozen_string_literal: true

RSpec.describe 'Авиабилеты', type: :feature do
  before(:example) do
    Capybara.app = Sinatra::Application.new
  end

  it 'главная страница' do
    visit('/')
    expect(page).to have_content('Что-то о сайте')
  end

  it 'список рейсов' do
    visit('/')
    click_on('Список рейсов')
    expect(page).to have_content('Рейсы')
  end

  it 'список заявок' do
    visit('/')
    click_on('Список заявок')
    expect(page).to have_content('Заявки')
  end

  it 'поиск рейса' do
    visit('/')
    click_on('Поиск рейса')
    expect(page).to have_content('Введите данные для поиска')
  end

  it 'поиск заявки' do
    visit('/')
    click_on('Поиск заявки')
    expect(page).to have_content('Введите данные для поиска')
  end

  it 'маршрут' do
    visit('/')
    click_on('Маршрут')
    expect(page).to have_content('Введите данные для поиска')
  end
end
