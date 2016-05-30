require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) {
  Question.create!(
    title: "New Title",
    body: "New Question Body"
    )
  }

  let(:answer) {Answer.create!(body: "New Question Body")}

  describe "attributes" do
    it "has a body" do
      expect(answer).to have_attributes(body: "New Question Body")
    end
  end
end
