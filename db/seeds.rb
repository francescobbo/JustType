# Development Admin
User.create(name: 'Super Master',
            email: 'master@example.com',
            password: 'master',
            password_confirmation: 'master',
            admin: true)

# Development Commenter
User.create(name: 'Hyper User',
            email: 'user@example.com',
            password: '123456',
            password_confirmation: '123456',
            admin: false)
