module.exports = {
    adminAuth: {
        type: "credentials",
        users: [{
            username: process.env.NODE_RED_USERNAME || "admin",
            password: process.env.NODE_RED_PASSWORD,
            permissions: "*"
        }]
    },
    // Esto asegura que tus flujos se guarden en el volumen de Railway
    userDir: '/data',
    flowFile: 'flows.json',
    functionGlobalContext: { }
}
