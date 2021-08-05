class Todo < ApplicationRecord
  validate :valid_start_at
  validates :title, length: { in: 1..32 }

  belongs_to :category, required: false

  # 開始した日は終了した日よりも後には設定できません
  def valid_start_at
    return true if !self.start_at || !self.completed_at
    if self.start_at > self.completed_at then
      errors.add(:start_at, "開始した日は終了した日よりも後には設定できません")
    end
  end
end
