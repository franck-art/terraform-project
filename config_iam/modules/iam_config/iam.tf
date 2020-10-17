resource "google_project_iam_custom_role" "my-custom-role" {
count = length("${var.authorization}")
  role_id     = "${var.role_name[count.index]}"
  //role_id     = "roleName"
  //title       = "titleName"
  title       = "${var.titre_name[count.index]}"
  description = "To assign permissions to users"

  permissions = "${var.authorization[count.index]}"

}

resource "google_project_iam_binding" "project1" {
  project = "phonic-command-291302"
  count = length("${var.role_binding}")

    role    = "${google_project_iam_custom_role.my-custom-role[count.index].id}"
    members = "${var.role_binding[count.index]}"

}
