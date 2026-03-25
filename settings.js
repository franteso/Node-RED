module.exports = {
    adminAuth: {
        type: "credentials",
        users: [{
            username: "admin",
            password: "$2b$10$6.172G8B.m76FzzS7paO9u.D7v.l15yO6.6D2hI2y0zV.66mZ.f1.", // Esto es: admin123
            permissions: "*"
        }]
    },
    uiPort: 1880,
    userDir: '/data',
    flowFile: 'flows.json',
    credentialSecret: "clave-utn-2026",
    functionGlobalContext: { },
    editorTheme: {
        projects: { enabled: false }
    }
};
