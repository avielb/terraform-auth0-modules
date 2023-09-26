resource "auth0_guardian" "my_guardian" {
  policy        = var.policy
  email         = var.email
  otp           = var.otp
  recovery_code = var.recovery_code

  dynamic "webauthn_roaming" {
    for_each = var.webauthn_roaming
    content {
      enabled           = true
      user_verification = webauthn_roaming.value["user_verification"]
    }
  }

  dynamic "phone" {
    for_each = var.phone
    content {
      enabled       = true
      provider      = phone.value["provider"]
      message_types = phone.value["message_types"]

      options {
        enrollment_message   = phone.value["enrollment_message"]
        verification_message = phone.value["verification_message"]
      }
    }
  }

  dynamic "push" {
    for_each = var.push
    content {
      enabled  = true
      provider = "sns"
      amazon_sns {
        aws_access_key_id                 = push.value["aws_access_key_id"]
        aws_region                        = push.value["aws_region"]
        aws_secret_access_key             = push.value["aws_secret_access_key"]
        sns_apns_platform_application_arn = push.value["sns_apns_platform_application_arn"]
        sns_gcm_platform_application_arn  = push.value["sns_gcm_platform_application_arn"]
      }

      custom_app {
        app_name        = push.value["app_name"]
        apple_app_link  = push.value["apple_app_link"]
        google_app_link = push.value["google_app_link"]
      }
    }
  }

  dynamic "duo" {
    for_each = var.duo
    content {
      enabled         = true
      integration_key = duo.value["integration_key"]
      secret_key      = duo.value["secret_key"]
      hostname        = duo.value["hostname"]
    }
  }
}
