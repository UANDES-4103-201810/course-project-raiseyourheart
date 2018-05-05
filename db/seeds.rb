User.create!([
  {login: nil, first: "Andres", last: "Howard", password: 123456789, password_confirmation: 123456789, email: "aihoward@miuandes.cl",admin: true, phone: "912345678", description: "I'm learning programming on rails yeah!", birthdate: "1987-10-22", gender: "male", encrypted_password: "$2a$11$Y1CgmYk6sHkDVksgb.g22eNlV4AULLWTlPrU5gTmfrsRHJ3vzxk3.", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {login: nil, first: "Carlos", last: "Diaz", password: 123456789, password_confirmation: 123456789, email: "cdiaz1@miuandes.cl", admin: true, phone: "912345678", description: "I'm learning programming on rails, and I love it!", birthdate: "1992-05-02", gender: "male", encrypted_password: "$2a$11$zPsTEUBabJ9brt2x7KU8ZOUgdI0wHU8yhHau.pTC.kFNgTwDgfHB2", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {login: nil, first: "Jose Luis", last: "Assadi", password: 123456789, password_confirmation: 123456789, email: "jlassadi@miuandes.cl", admin: false, phone: "912345678", description: "I don't like Rails", birthdate: "1995-01-04", gender: "male", encrypted_password: "$2a$11$CfrxK5VBnYGoZiKXlIpm1.KJtlTpGffzv9w0Y1vqbazgsU2kXMcwK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {login: nil, first: "Sebastian", last: "Pinera", password: 123456789, password_confirmation: 123456789, email: "sebastian@pinera.cl", admin: false, phone: "758697830", description: "I am the president", birthdate: nil, gender: "male", encrypted_password: "$2a$11$y5AvasRGQ4J7pVtoMx6IbeeJzD8jaU0OIUKkRZNJCgGtMWVRfY7lW", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {login: nil, first: "Benjamin", last: "Corvalan", password: 123456789, password_confirmation: 123456789, email: "baconraval@miuandes.cl", admin: false, phone: "912345678", description: "...",  birthdate: nil, gender: "male", encrypted_password: "$2a$11$4quOOmr7dgpdzD0pul9kN.4JQacfUcLE7H8oe4S1rpwpi.ngyrN7i", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {login: nil, first: "Luis Rodrigo", last: "Pena", password: 123456789, password_confirmation: 123456789, email: "lrpena@miuandes.cl", admin: false, phone: "912345678", description: "Single, over 6'1", birthdate: "1995-08-02", gender: "male", encrypted_password: "$2a$11$NLC3g.k3czpj/W437VhqDOBMs7DcBXuhQWiuiKLUgeZlpN6xrq7oW", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil}
])
Category.create!([
  {name: "Useless", description: "Useless projects belong here in this category"},
  {name: "Garbage", description: "Garbage projects belong here in this category"},
  {name: "Environmental", description: "Environmental projects belong here in this category"},
  {name: "Cute", description: "Cute projects belong here in this category"}
])
Project.create!([
    {user_id: 1, category_id: 1},
    {user_id: 2, category_id: 2},
    {user_id: 3, category_id: 3},
    {user_id: 4, category_id: 4},
    {user_id: 5, category_id: 3}
])
Medium.create!([
  {project_id: 1, multimedia_kind: "Video", path: ""},
  {project_id: 1, multimedia_kind: "Video", path: ""},
  {project_id: 3, multimedia_kind: "Photo", path: ""},
  {project_id: 4, multimedia_kind: "Photo", path: ""},
  {project_id: 4, multimedia_kind: "Photo", path: ""}
])
ProjectDatum.create!([
  {amount_raised: "340.0", visible: true, goal: "3500.0", category_id: 1, deadline: "2018-04-27", estimated_delivery_time: "2018-04-28", description: "This is the description of project number 1, it has to be at least of 50 characters", project_id: 1, website: "www.project1.com" , name: "Project 1"},
  {amount_raised: "300.0", visible: true, goal: "4500.0", category_id: 2, deadline: "2018-04-28", estimated_delivery_time: "2018-04-29", description: "This is the description of project number 1, it has to be at least of 50 characters", project_id: 2, website: "www.project2.com", name: "Project 2"},
  {amount_raised: "0.0", visible: true, goal: "500.0", category_id: 3, deadline: "2018-05-05", estimated_delivery_time: "2018-08-03", description: "This is the description of project number 3, it has to be at least of 50 characters", project_id: 3, website: "www.project3.com" , name: "Project 3"},
  {amount_raised: "10.0", visible: true, goal: "5000.0", category_id: 3, deadline: "2018-05-05", estimated_delivery_time: "2018-08-03", description: "This is the description of project number 3, it has to be at least of 50 characters", project_id: 3, website: "www.project3.com", name: "Entity Pictur"},
  {amount_raised: "0.0", visible: true, goal: "20000.0", category_id: 4, deadline: "2018-05-05", estimated_delivery_time: "2018-08-03", description: "This is the description of project number 4, it has to be at least of 50 characters", project_id: 4, website: "www.project4.com", name: "Project 4"},
  {amount_raised: "0.0", visible: true, goal: "2000.0", category_id: 4, deadline: "2018-05-05", estimated_delivery_time: "2018-08-03", description: "This is the description of project number 5, it has to be at least of 50 characters", project_id: 5, website: "www.project5.com", name: "Project 1"}
])
Promise.create!([
  {description: "This is the description of the first promise", amount: "59.0", delivery_time: "2018-04-26", user_id: 1, project_id: 1},
  {description: "This is the description of the second promise", amount: "999.0", delivery_time: "2018-04-26", user_id: 1, project_id: 1},
  {description: "This is the description of the third promise", amount: "150.0", delivery_time: "2018-04-27", user_id: 2, project_id: 2},
  {description: "This is the description of a promise", amount: "15.0", delivery_time: "2018-04-28", user_id: 2, project_id: 2},
  {description: "This is the description of a promise", amount: "35.0", delivery_time: "2018-04-28", user_id: 2, project_id: 2},
  {description: "This is the description of a promise", amount: "50.0", delivery_time: "2018-04-28", user_id: 3, project_id: 3},
  {description: "This is the description of a promise", amount: "500.0", delivery_time: "2018-04-28", user_id: 4, project_id: 4}
])
Good.create!([
   {description: "This is the description of the current good", name: "Good 1", promise_id: 1},
   {description: "This is the description of the current good", name: "Good 2", promise_id: 1},
   {description: "This is the description of the current good", name: "Good 2", promise_id: 2},
   {description: "This is the description of the current good", name: "Good 4", promise_id: 3}
])
UserBuyPromise.create!([
  {user_id: 1, promise_id: 1},
  {user_id: 1, promise_id: 3},
  {user_id: 3, promise_id: 4},
  {user_id: 4, promise_id: 2}
])
UserFundProject.create!([
  {user_id: 1, project_id: 1, amount: "100.0"},
  {user_id: 1, project_id: 2, amount: "10.0"},
  {user_id: 2, project_id: 3, amount: "1.0"},
  {user_id: 4, project_id: 4, amount: "130.0"},
  {user_id: 5, project_id: 5, amount: "99.0"}
])
Wishlist.create!([
  {user_id: 1, project_id: 1},
  {user_id: 2, project_id: 3},
  {user_id: 1, project_id: 5},
  {user_id: 2, project_id: 5},
  {user_id: 4, project_id: 3}
])
