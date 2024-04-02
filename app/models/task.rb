class Task < ApplicationRecord
    validates :title, presence: true, length: {maximum: 20}
    validates :start_date, presence: true
    validates :end_date, presence: true
    validate :start_end_check
    validates :memo, length: {maximum: 500}

    def start_end_check
        if self.start_date.present? && self.end_date.present?
            errors.add(:end_date, "は開始日よりも前の日付は登録できません") unless
            self.end_date >= self.start_date
        end
    end
end
