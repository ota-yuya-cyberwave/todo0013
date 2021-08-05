require 'rails_helper'

RSpec.describe Category, type: :model do
  it "titleのないCategoryは保存できない" do
    c = Category.new(title: "")
    expect(c).not_to be_valid
  end
end
