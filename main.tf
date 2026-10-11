resource "google_gemini_repository_group_iam_member" "gemini_repository_group_iam_members" {
  for_each = var.gemini_repository_group_iam_members

  code_repository_index = each.value.code_repository_index
  member                = each.value.member
  repository_group_id   = each.value.repository_group_id
  role                  = each.value.role
  location              = each.value.location
  project               = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

