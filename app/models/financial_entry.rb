class FinancialEntry < ActiveRecord::Base
  validates :name, presence: true
  validates :amount, presence: true
end
