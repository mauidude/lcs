class ProjectTask < ActiveRecord::Base
  attr_accessible :week, 
                  :hours, 
                  :task_id

  belongs_to :project
  belongs_to :task

  delegate :description, :cost_code, to: :task

  validates :week,
            presence: true

  validates :hours,
            presence: true,
            numericality: { greater_than_or_equal_to: 0 }

  validates :project,
            presence: true

  validates :task,
            presence: true

  scope :by_year, group('date_part(\'year\', "week")')
                  .select('sum("hours") as "hours", date_part(\'year\', "week") as "year", null as week')
                  .order('"year" DESC')
end
