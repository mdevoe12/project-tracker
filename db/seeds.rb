
admin = User.create(first_name: "admin", last_name: "admin",
                    email: "admin@admin.com", username: "admin",
                    password: "admin")

user = User.create(first_name: "Matt", last_name: "DeVoe",
                  email: "matthew.devoe@gmail.com", username: "mdevoe12",
                  password: "user")

project_1 = Project.create(name: "Build App of Awesome", user_id: user.id)
project_2 = Project.create(name: "Smoke Pork Butt", user_id: user.id)


note_1 = Note.create(title: "CRUD", content: "CRUDness to be built",
                     project_id: project_1.id)
note_2 = Note.create(title: "Demo", content: "Demo is necessary",
                     project_id: project_1.id)
note_3 = Note.create(title: "Buy Ingredients", content: "Pork, Seasoning, Sauce",
                     project_id: project_2.id)

tag_1 = Tag.create(name: "Turing")
tag_2 = Tag.create(name: "Rails")
tag_3 = Tag.create(name: "Home")
tag_4 = Tag.create(name: "Cooking")

Tagging.create(project_id: project_1.id, tag_id: tag_1.id)
Tagging.create(project_id: project_1.id, tag_id: tag_2.id)
Tagging.create(project_id: project_2.id, tag_id: tag_3.id)
Tagging.create(project_id: project_2.id, tag_id: tag_4.id)
