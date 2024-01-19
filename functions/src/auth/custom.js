const { onCall, HttpsError } = require('firebase-functions/v2/https')
const { initializeApp } = require('firebase-admin/app')
const { getAuth } = require('firebase-admin/auth')
const { setGlobalOptions } = require('firebase-functions/v2')

setGlobalOptions({ maxInstances: 2 })
initializeApp()

const auth = getAuth()

exports.customToken = onCall(async (req) => {
    if (req.auth) {
        throw new HttpsError('failed-precondition', 'You can not be signed in')
    }

    console.log(req.data)

    const { address } = req.data

    const token = await auth.createCustomToken(address)
    return token
})