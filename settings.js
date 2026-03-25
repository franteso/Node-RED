module.exports = {
    adminAuth: {
        type: "credentials",
        users: [{
            username: process.env.NODE_RED_USERNAME || "admin",
            password: process.env.NODE_RED_PASSWORD,
            permissions: "*"
        }]
    },
    uiPort: process.env.PORT || 1880,
    mqttReconnectTime: 15000,
    serialReconnectTime: 15000,
    debugMaxLength: 1000,
    userDir: '/data',
    flowFile: 'flows.json',
    credentialSecret: process.env.NODE_RED_CREDENTIAL_SECRET || "facu-utn-2026",
    functionGlobalContext: { },
    exportGlobalContextKeys: false,
    editorTheme: {
        projects: { enabled: false }
    }
};
