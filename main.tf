resource "github_repository" "github_repository" {
  name            = var.github_repository_name
  description     = var.github_repository_description
  visibility      = var.github_repository_visibility
  has_discussions = false
  has_downloads   = false
  has_issues      = false
  has_projects    = false
  has_wiki        = false
}

