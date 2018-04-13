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
User.create!([
  {login: nil, first: "Andres", last: "Howard", password: "123456789", email: "aihoward@miuandes.cl", role: "Admin", phone: "912345678", description: "I'm learning programming on rails yeah!", avatar_file_name: nil, birthdate: "1987-10-22", gender: "male"},
  {login: nil, first: "Carlos", last: "Diaz", password: "123456789", email: "cdiaz1@miuandes.cl", role: "Admin", phone: "912345678", description: "I'm learning programming on rails, and I love it!", avatar_file_name: nil, birthdate: "1992-05-02", gender: "male"},
  {login: nil, first: "Jose Luis", last: "Assadi", password: "123456789", email: "jlassadi@miuandes.cl", role: "User", phone: "912345678", description: "I don't like Rails", avatar_file_name: nil, birthdate: "1995-01-04", gender: "male"},
  {login: nil, first: "Sebastian", last: "Pinera", password: "123456789", email: "sebastian@pinera.cl", role: "User", phone: "758697830", description: "I am the president", avatar_file_name: nil, birthdate: nil, gender: "male"},
  {login: nil, first: "Benjamin", last: "Corvalan", password: "123456789", email: "baconraval@miuandes.cl", role: "User", phone: "912345678", description: "...", avatar_file_name: nil, birthdate: nil, gender: "male"},
  {login: nil, first: "Luis Rodrigo", last: "Pena", password: "123456789", email: "lrpena@miuandes.cl", role: "User", phone: "912345678", description: "Single, over 6'1", avatar_file_name: nil, birthdate: "1995-08-02", gender: "male"}
])
