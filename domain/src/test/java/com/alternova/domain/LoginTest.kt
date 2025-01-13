package com.alternova.domain

import kotlin.test.Test
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

internal class LoginTest {

    @Test
    fun `Given empty email When validating Login Then throw BaseException`() {
        val exception = assertFailsWith(IllegalArgumentException::class) {
            val emptyEmail = ""
            LoginDataBuilder().withEmail(emptyEmail).build()
        }
        assertTrue(exception.message.orEmpty().isNotEmpty())
    }

    @Test
    fun `Given empty password When validating Login Then throw BaseException`() {
        val exception = assertFailsWith(IllegalArgumentException::class) {
            val emptyPassword = ""
            LoginDataBuilder().withPassword(emptyPassword).build()
        }
        assertTrue(exception.message.orEmpty().isNotEmpty())
    }
}
