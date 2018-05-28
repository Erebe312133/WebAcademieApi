# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(
  firstname: "Raymond",
  lastname: "Ricard",
  salary_claims: 33000,
  description: "Je cherche du taff",
  email: "user@test.fr"
)

user2 = User.create(
  firstname: "Rain",
  lastname: "Kenobi",
  salary_claims: 22000,
  description: "Force user",
  email: "user2@test.fr"
)

Skill.create(
  user: user,
  note: 4,
  name: "Php",
  mtype: "technical"
)
Skill.create(
  user: user,
  note: 2,
  name: "Database",
  mtype: "theoric"
)
Skill.create(
  user: user,
  note: 5,
  name: "Ruby",
  mtype: "technical"
)

Skill.create(
  user: user2,
  note: 3,
  name: "Php",
  mtype: "technical"
)

project = Project.create(
  name: "Projet de fou",
  descriptive: "Une description",
  user: user
)

Language.create(
  key: '0',
  value: 'PHP',
  project: project
)

Language.create(
  key: '1',
  value: 'NodeJS',
  project: project
)

Link.create(
  key: '0',
  value: 'ProjetDeFou.dev',
  project: project
)
