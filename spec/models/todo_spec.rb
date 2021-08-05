require 'rails_helper'

RSpec.describe Todo, type: :model do
  it "titleのないtodoは保存できない" do
    t = Todo.new(title: "")
    expect(t).not_to be_valid
  end

  it "開始した日は終了した日よりも後には設定できません" do
    t = Todo.new(title: "test", start_at: Time.now, completed_at: Time.now - 600)
    expect(t).not_to be_valid
  end
end
