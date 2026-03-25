
module.exports = {
    adminAuth: {
        type: "credentials",
        users: [{
            username: process.env.NODE_RED_USERNAME || "admin",
            password: process.env.NODE_RED_PASSWORD,
            permissions: "*"
        }]
    },
    disableEditor: false,
    httpAdminRoot: '/',
    projects: { enabled: false },
    credentialSecret: process.env.NODE_RED_CREDENTIAL_SECRET || "una-clave-secreta-cualquiera",
    uiPort: process.env.PORT || 1880,
    userDir: '/data',
    flowFile: 'flows.json',
    functionGlobalContext: { }
};
