class Project < ActiveRecord::Base

  has_many :tasks, 
            class_name: 'ProjectTask',
            order: 'week DESC',
            include: :task

  attr_accessible :name

  validates :name,
            presence: true,
            length: { maximum: 100 },
            uniqueness: { case_sensitive: false }

end
