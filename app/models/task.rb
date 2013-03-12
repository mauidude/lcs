class Task < ActiveRecord::Base
  attr_accessible :cost_code, :description

  validates :cost_code,
            presence: true,
            length: { maximum: 10 },
            uniqueness: { case_sensitive: false },
            format: { with: /\d{2}\-\d{3}/, message: 'must be in the format of ##-###' }

  validates :description,
            presence: true,
            length: { maximum: 256 }

  def to_param
    cost_code
  end
end
