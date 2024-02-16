require 'rails_helper'

RSpec.describe Book, type: :model do
    subject do
        described_class.new(title: 'harry potter')
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is not valid without a name' do
        subject.title = nil
        expect(subject).not_to be_valid
    end

    it 'should set and get author' do
        book = Book.new(author: 'Test author')
        assert_equal "Test author", book.author
    end

    it 'should set and get published date' do
        book = Book.new(published_date: "2022-01-01")
        assert_equal Date.new(2022,1,1), book.published_date
    end

    it 'should set and get price' do
        book = Book.new(price: 19.99)
        assert_equal 19.99, book.price
    end
end