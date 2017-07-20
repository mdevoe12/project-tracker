
admin = User.create(first_name: "admin", last_name: "admin",
                    email: "admin@admin.com", username: "admin",
                    password: "admin")

user = User.create(first_name: "Matt", last_name: "DeVoe",
                  email: "matthew.devoe@gmail.com", username: "mdevoe12",
                  password: "user")

project = Project.create(name: "Build App of Awesome", user_id: user.id)


note_1 = Note.create(title: "CRUD", content: "CRUDness to be built",
                     project_id: project.id)
note_2 = Note.create(title: "Demo", content: "Demo is necessary",
                     project_id: project.id)
