require "administrate/base_dashboard"

class EmployerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    employments: Field::HasMany,
    employees: Field::HasMany,
    user: Field::BelongsTo,
    user_email: Field::String,
    id: Field::Number,
    first_name: Field::String,
    full_name: Field::String,
    organization: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :full_name,
    :employments,
    :employees,
    :id,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :employments,
    :employees,
    :user_email,
    :id,
    :first_name,
    :full_name,
    :organization,
    :created_at,
    :updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :first_name,
    :full_name,
    :organization,
  ]

  # Overwrite this method to customize how employers are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(employer)
    "#{employer.full_name} (#{employer.id})"
  end
end
