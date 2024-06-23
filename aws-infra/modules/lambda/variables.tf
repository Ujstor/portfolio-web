variable "lambda_config" {
  description = "Lambda function configuration"
  type = object({
    work_dir          = string
    bin_name          = string
    archive_bin_name  = string
    function_name     = string
    handler           = string
    runtime           = string
    ephemeral_storage = number
    archive_type      = string
  })
}
