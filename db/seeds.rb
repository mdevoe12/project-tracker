
admin = User.create(first_name: "admin", last_name: "admin",
                    email: "admin@admin.com", username: "admin",
                    password: "admin", role: 1)

user = User.create(first_name: "Matt", last_name: "DeVoe",
                  email: "matthew.devoe@gmail.com", username: "mdevoe12",
                  password: "user")


project_1 = Project.create(name: "Build App of Awesome", user_id: user.id)

project_1.tags.create(name: "Turing")
project_1.tags.create(name: "project")
project_1.tags.create(name: "rails")
project_1.tags.create(name: "mod 2")

status_name = ["In process", "Incubated", "Waiting For", "Next Actions", "Scheduled",
"Archived", "Reference", "Completed"]

status_name.each do |name|
  Status.create(name: name)
end

note_1 = Note.create(title: "CRUD", content: "CRUDness to be built",
                     project_id: project_1.id, status_id: Status.first.id)
note_2 = Note.create(title: "Demo", content: "Demo is necessary",
                     project_id: project_1.id, status_id: Status.first.id)
note_3 = Note.create(title: "Add Graphs API", content: "Use gem, rock out",
                     project_id: project_1.id, status_id: Status.last.id)
note_3 = Note.create(title: "Demo", content: "Demo is necessary",
                    project_id: project_1.id, status_id: Status.last.id)

project_2 = Project.create(name: "Little Shop", user_id: user.id)

project_2.tags.create(name: "Turing")
project_2.tags.create(name: "project")
project_2.tags.create(name: "rails")
project_2.tags.create(name: "mod 2")

note_1 = Note.create(title: "CRUD", content: "CRUDness to be built",
                     project_id: project_2.id, status_id: Status.first.id)
note_2 = Note.create(title: "Demo", content: "Demo is necessary",
                     project_id: project_2.id, status_id: Status.first.id)
note_3 = Note.create(title: "Add Graphs API", content: "Use gem, rock out",
                     project_id: project_2.id, status_id: Status.last.id)
note_3 = Note.create(title: "Demo", content: "Demo is necessary",
                    project_id: project_2.id, status_id: Status.last.id)
