# == Schema Information
#
# Table name: employments
#
#  id          :integer          not null, primary key
#  employee_id :integer
#  employer_id :integer
#  start_date  :date
#  end_date    :date
#  comments    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Employment < ActiveRecord::Base
  default_scope { order(start_date: :desc) }
  
  belongs_to :employer, inverse_of: :employments
  belongs_to :employee, inverse_of: :employments

  validates :employer, presence: true
  validates :employee, presence: true

  after_initialize :set_start_date

  def employer_name
    employer.full_name
  end

  def employer_organization
    employer.organization
  end

  def employee_full_name
    employee.full_name
  end

  def date_range_string
    [format_date(start_date), format_date(end_date)].join(" - ")
  end

  def end_date_or_now
    end_date.present? ? end_date : Date.today
  end

  private
    def format_date(date)
      if date.present?
        str = date.strftime("%B %Y")
      else
        str = "present"
      end
    end

    def set_start_date
      self.start_date = Date.today if start_date.blank?
    end
end
