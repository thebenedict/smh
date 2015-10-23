if Rails.env.development? || Rails.env.test?
  require "factory_girl"

  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods

      create(:user,
        email: "thebenedict@gmail.com",
        password: "staffmyhouse",
        password_confirmation: "staffmyhouse",
        confirmed_at: DateTime.now
      )

      irini = create(:employee,
        full_name: "Irini Thompson",
        common_name: "Irini",
        primary_phone: "+255 785 504 348",
        roles: ["Cook", "Housekeeper", "Nanny"],
        english_proficiency: 2,
        availability: ["Full time", "Part time"],
      )

      susna = create(:employer,
        first_name: "Susna",
        other_names: "De",
        organization: "U.S. Embassy"
      )

      michael = create(:employer,
        first_name: "Michael",
        other_names: "Benedict",
        organization: "Kept Man"
      )

      irini.employments.create(employer_id: susna.id,
        start_date: Date.today - 2.years,
        comments: "Available in September: Irini Thompson has worked for us for 3 years. During this time she has been responsible for housekeeping (cleaning, vacuuming, ironing etc.) as well as watching over our two sons (now aged 12 and 10). She is an incredibly fast and follows direction well. She is honest, dedicated and a reliable individual who has good judg- ment. She cooks Ethiopian food! She does windows! We wish we could take her with us but alas... Irini understands and speaks English and can be reached directly at +255 785 504 348. "
      )

      irini.employments.create(employer_id: michael.id,
        start_date: Date.today - 4.years,
        end_date: Date.today - 30.months,
        comments: "Available in September: Irini Thompson has worked for us for 3 years. During this time she has been responsible for housekeeping (cleaning, vacuuming, ironing etc.) as well as watching over our two sons (now aged 12 and 10). She is an incredibly fast and follows direction well. She is honest, dedicated and a reliable individual who has good judg- ment. She cooks Ethiopian food! She does windows! We wish we could take her with us but alas... Irini understands and speaks English and can be reached directly at +255 785 504 348. "
      )

      create(:employee,
        full_name: "Leticia Dai",
        common_name: "Leticia",
        primary_phone: "+255 655 282 513",
        roles: ["Cook", "Housekeeper"],
        english_proficiency: 2,
        availability: ["Full time", "Part time"]
      )

      create(:employee,
        full_name: "Sophie Kashamba",
        common_name: "Sophie",
        primary_phone: "+255 784 259 583",
        roles: ["Cook", "Housekeeper", "Nanny"],
        english_proficiency: 3,
        availability: ["Full time", "Part time"]
      )
    end
  end
end