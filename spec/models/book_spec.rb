require 'rails_helper'
require "minitest/spec"
include BooksHelper

RSpec.describe Book, type: :model do
  let(:publisher) { FactoryBot.create(:publisher) }
  let(:valid_data) { FactoryBot.create(:book, publisher: publisher) }

  describe 'create new book' do
    context "with valid params" do
      it "successful" do
        publisher = create(:publisher)
        b = create(:book_valid, publisher: publisher)
        expect(b.title).to eq(b.title)
      end

      it "returns a valid isbn" do
        publisher = create(:publisher)
        expect {create(
          :invalid_isbn,
          publisher: publisher
        )}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Isbn Please provide correct ISBN")
      end

      it "returns a invalid isbn" do
        publisher = create(:publisher)
        expect {create(
          :invalid_isbn,
          publisher: publisher
        )}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Isbn Please provide correct ISBN")
      end
    end

    context "when isbn input is valid" do
      valid_isbn = ["007462542X"],["0820472670"],["0470196181"],["074324382X"],["0887401392"],["0887401392"],["012781910X"],["3-540-49698-X"],["3-921099-34-X"],["012781910X"]

      valid_isbn.each do |isbn|
        it "this #{isbn} is valid" do
          publisher = create(:publisher)
          b = create(:book_valid, publisher: publisher, isbn: isbn)
          expect(b.isbn).to eq(b.isbn)
        end
      end
    end

    context "when isbn input is invalid" do
      invalid_isbn = [""],["asda1"],["082047267-X"],["0112112425"],["9887401392"]

      invalid_isbn.each do |isbn|
        it "this #{isbn} is invalid" do
          publisher = create(:publisher)
          expect {create(
            :invalid_isbn,
            publisher: publisher,
            isbn: isbn
          )}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Isbn Please provide correct ISBN")
        end
      end
    end

    context "when isbn input is invalid - testing GEM" do
      invalid_isbn = ["123456790"],["082047267"],["074324382"]

      invalid_isbn.each do |isbn|
        it "this #{isbn} is invalid" do
          publisher = create(:publisher)
          expect {create(
            :invalid_isbn,
            publisher: publisher,
            isbn: isbn
          )}.to raise_error(ISBN::Invalid13DigitISBN, "ISBN::Invalid13DigitISBN")
        end
      end
    end

    context "when isbn input is invalid - testing GEM" do
      it "convert 10 to 13" do
        expect(isbn10_13("1250805767")).to eq("9781250805768")
        expect(isbn10_13("007462542X")).to eq("9780074625422")
        expect(isbn10_13("3-540-49698-X")).to eq("9783540496984")
      end

      it "convert 13 to 10" do
        expect(isbn13_10("9781420951301")).to eq("1420951300")
        expect(isbn13_10("9780452284234")).to eq("0452284236")
        expect(isbn13_10("9781292101767")).to eq("1292101768")
        expect(isbn13_10("9780074625422")).to eq("007462542X")
        expect(isbn13_10("978-0986098161")).to eq("0986098167")
      end
    end
  end
end
