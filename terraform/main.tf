resource "github_repository" "github_repository" {
  name            = var.github_repository_name
  description     = var.github_repository_description
  visibility      = var.github_repository_visibility
  has_discussions = false
  has_downloads   = false
  has_issues      = false
  has_projects    = false
  has_wiki        = false
  auto_init       = true
}


resource "github_repository_file" "settings" {
  depends_on = [github_repository.github_repository]
  repository = var.github_repository_name
  branch     = "main"
  file       = ".github/settings.yml"
  content = templatefile("${path.module}/settings.tftpl", {
    github_repository_name        = var.github_repository_name
    github_repository_description = var.github_repository_description
  })
  commit_message      = "Creating Settings File"
  commit_author       = "bcovieswex"
  commit_email        = "120387348+bcovieswex@users.noreply.github.com"
  overwrite_on_create = true
}

resource "github_repository_environment" "repo_environment" {
  depends_on  = [github_repository.github_repository]
  repository  = var.github_repository_name
  environment = "dev"
}

resource "github_actions_environment_secret" "github_secret" {
  depends_on      = [github_repository_environment.repo_environment]
  repository      = var.github_repository_name
  environment     = "dev"
  secret_name     = "TOKEN_GITHUB"
  plaintext_value = var.github_token
}

resource "github_actions_environment_secret" "docker_secret" {
  depends_on      = [github_repository_environment.repo_environment]
  repository      = var.github_repository_name
  environment     = "dev"
  secret_name     = "TOKEN_DOCKER"
  plaintext_value = var.github_token
}
