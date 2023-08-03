# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
TechStack.create([
    { title: "Java",desc: "used for backend",tech_type: 1},
    { title: "Python",tech_type: 1},
    { title: "Node.js",tech_type: 1},
    { title: "ROR",tech_type: 1},
    { title: "React",tech_type: 1},
    { title: "HTML",tech_type: 2},
    { title: "CSS",tech_type: 2},
    { title: "JS",tech_type: 2}
        ])
Domain.create([
    {title: "service provider"},
    {title: "ecommerce"},
    {title: "marketing"},
    {title: "social sites"}
])
# Project.create( 
#     title: "GitPod",
#     desc: "Gitpod is an open source developer platform automating the provisioning of ready-to-code developer environments",
#     start_date: Thu, 25 Jun 2020,
#     end_date: Sat, 25 Jun 2022,
#     team_size: 800,
#     core_skill: TechStack.core_skills.first,
#     domain: Domain.first
# )