require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
    scenario 'valid inputs' do
        visit new_book_path
        fill_in "book[title]", with: 'harry potter'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('harry potter')
    end

    scenario 'invalid inputs' do
        visit new_book_path
        click_on 'Create Book'
        expect(page).to have_content('Title cannot be blank')
    end

    scenario 'author' do
        visit new_book_path
        fill_in "book[title]", with: 'test title'
        fill_in "book[author]", with: 'Test author'
        click_on 'Create Book'
        book = Book.order("id").last
        expect(book.author).to eq('Test author')
    end

    scenario 'price' do
        visit new_book_path
        fill_in "book[title]", with: 'test title'
        fill_in "book[price]", with: 19.99
        click_on 'Create Book'
        book = Book.order("id").last
        expect(book.price).to eq(19.99)
    end

    scenario 'published date' do
        visit new_book_path
        fill_in "book[title]", with: 'test title'
        select "2022", from: "book_published_date_1i"
        select "January", from: "book_published_date_2i"
        select "1", from: "book_published_date_3i"
        click_on 'Create Book'
        book = Book.order("id").last
        expect(book.published_date).to eq(Date.new(2022,1 ,1))
    end
        
end