package com.alternova.domain

internal class LoginDataBuilder {
    private var email: String = "test@test.com"
    private var password: String = "Test1234."

    fun withEmail(email: String): LoginDataBuilder = apply { this.email = email }

    fun withPassword(password: String): LoginDataBuilder = apply { this.password = password }

    fun build(): Login = Login(email, password)
}
