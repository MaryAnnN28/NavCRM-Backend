# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(first_name: "Mary Ann", last_name: "Navarrete", email: "maryann.navarrete@gmail.com", password: "maryann12345")

customer1 = Customer.create(first_name: "Judy", last_name: "Quattrone", company: "eGlobalTech", job_title: "Manager", industry: "Information Technology", email: "jquattrone@egt.com", phone: "904-382-9938", notes: "Judy is new prospect. May need website.")
customer2 = Customer.create(first_name: "Jon", last_name: "Wilson", company: "Wilson and Partners", job_title: "Owner", industry: "Consulting", email: "jwilson@gmail.com", phone: "802-456-9000", notes: "Needs website update")
customer3 = Customer.create(first_name: "Maureen", last_name: "Mackey", company: "Crescent Hotels", job_title: "VP of Global Sales", industry: "Hospitality", email: "mmackey@crescent.com", phone: "202-782-7898", notes: "Needs single page site for event")

Task.create(title: "Intro email to Judy", task_type: "Send Email", description: "initial email to Judy. May need website due to company growth", due_date: "03/15/2021", time_due: "10:00am", notes: "Sent email, awaiting reply", user_id: user1.id, customer_id: customer1.id)
Task.create(title: "Send Proposal", task_type: "Proposal", description: "requested proposal with pricing for website", due_date: "03/12/2021", time_due: "5:00pm", notes: "Needs Home/About/Services/ContactUs page. Budget of $5000", user_id: user1.id, customer_id: customer2.id)
Task.create(title: "Call to review needs", task_type: "Phone Call", description: "discuss needs for event page", due_date: "03/12/2021", time_due: "5:00pm", notes: "Proposal detail: Needs Home/About/Services/ContactUs page. Budget of $5000", user_id: user1.id, customer_id: customer3.id)
