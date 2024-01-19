'use strict';

/**
 * Auth
 */
if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'customToken') {
    exports.customToken = require('./src/auth/custom').customToken;
}