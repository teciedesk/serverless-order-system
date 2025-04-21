resource "aws_codepipeline" "pipeline" {
  name     = "order-system-pipeline"
  role_arn = var.pipeline_role_arn

  artifact_store {
    location = var.artifact_bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        Owner      = var.repo_owner
        Repo       = var.repo_name
        Branch     = var.repo_branch
        OAuthToken = var.github_token
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = var.codebuild_project_name
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Invoke"
      owner           = "AWS"
      provider        = "Lambda"
      input_artifacts = ["build_output"]
      version         = "1"

      configuration = {
        FunctionName = var.lambda_function_name
      }
    }
  }
}
