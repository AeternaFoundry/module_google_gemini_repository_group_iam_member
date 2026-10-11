variable "gemini_repository_group_iam_members" {
  description = <<EOT
Map of gemini_repository_group_iam_members, attributes below
Required:
    - code_repository_index
    - member
    - repository_group_id
    - role
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    code_repository_index = string
    member                = string
    repository_group_id   = string
    role                  = string
    location              = optional(string)
    project               = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

