require 'rails_helper'

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
      invalid_isbn = [""],["asda1"],["123456790"],["082047267-X"],["0112112425"],["082047267"],["9887401392"],["074324382"]

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
  end
end
