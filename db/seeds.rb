DEVELOPER_FIRST_NAMES = %w(Michał Paweł Piotrek Zbigniew Marek Radosław Zbyszek Kamil Stefan)
DEVELOPER_LAST_NAMES = %w(Grabowski Nowicki Adamczyk Dudek Król Jabłoński Wieczorek Jaworski Wróbel)

5.times do
  Developer.create!( first_name: DEVELOPER_FIRST_NAMES.sample,
                     last_name: DEVELOPER_LAST_NAMES.sample)
end

developer = Developer.all

25.times do
  Project.create!(name: Faker::Lorem.sentence,
                  description: Faker::Lorem.paragraph,
                  developer: developer.sample)
end

Language.create!(name: 'English')
Language.create!(name: 'Spanish')
Language.create!(name: 'Polish')
Language.create!(name: 'German')

projects = Project.all
languages = Language.all

projects.each do |project|
  ProjectsLanguage.create!(project: project, language: languages.sample )
end