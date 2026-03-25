module.exports = {
    // Seguridad obligatoria
    adminAuth: {
        type: "credentials",
        users: [{
            username: process.env.NODE_RED_USERNAME || "franesp",
            password: process.env.NODE_RED_PASSWORD,
            permissions: "*"
        }]
    },
    // Configuración básica para Railway
    uiPort: process.env.PORT || 1880,
    mqttReconnectTime: 15000,
    debugMaxLength: 1000,
    userDir: '/data',
    flowFile: 'flows.json',
    credentialSecret: process.env.NODE_RED_CREDENTIAL_SECRET || "utn-sistemas-2026",
    functionGlobalContext: { },
    // Forzamos el uso de la autenticación
    editorTheme: {
        projects: { enabled: false },
        tours: false
    }
};
