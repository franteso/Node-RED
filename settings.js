module.exports = {
    adminAuth: {
        type: "credentials",
        users: [{
            username: "admin",
            password: "$2b$10$6.172G8B.m76FzzS7paO9u.D7v.l15yO6.6D2hI2y0zV.66mZ.f1.", // Clave: admin123
            permissions: "*"
        }]
    },
    uiPort: process.env.PORT || 1880,
    userDir: '/data',
    flowFile: 'flows.json',
    credentialSecret: "utn-sistemas-2026",
    functionGlobalContext: { },
    editorTheme: {
        projects: { enabled: false }
    }
}
