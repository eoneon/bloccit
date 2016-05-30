require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) {
    Question.create!(
      title: "New Title",
      body: "New Question Body"
      )
  }

  describe "attributes" do
    it "has a title and a body" do
      expect(question).to have_attributes(title: "New Title", body: "New Question Body")
    end
  end
end
