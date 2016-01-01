require "administrate/base_dashboard"

class EmployeeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    employments: Field::HasMany,
    employers: Field::HasMany,
    id: Field::Number,
    full_name: Field::String,
    common_name: Field::String,
    primary_phone: Field::String,
    alternate_phone: Field::String,
    availability: Field::Text,
    roles: Field::Text,
    english_proficiency: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :employments,
    :employers,
    :id,
    :full_name,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :employments,
    :employers,
    :full_name,
    :common_name,
    :primary_phone,
    :alternate_phone,
    :availability,
    :roles,
    :english_proficiency,
  ]

  # Overwrite this method to customize how employees are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(employee)
  #   "Employee ##{employee.id}"
  # end
end
