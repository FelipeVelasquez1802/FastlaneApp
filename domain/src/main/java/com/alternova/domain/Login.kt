package com.alternova.domain

class Login(
    val email: String,
    val password: String,
) {
    init {
        validateEmail()
        validatePassword()
    }

    private fun validateEmail() {
        require(email.isNotBlank()) {
            throw IllegalArgumentException("Email is required")
        }
    }

    private fun validatePassword() {
        require(password.isNotBlank()) {
            throw IllegalArgumentException("Password is required")
        }
    }
}
