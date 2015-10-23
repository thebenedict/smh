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
  belongs_to :employer
  belongs_to :employee

  def employer_name
    employer.full_name
  end

  def employer_organization
    employer.organization
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
end
