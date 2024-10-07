class Task < ApplicationRecord
    validates :status, inclusion: { in: ['incomplete', 'complete'] }
  end