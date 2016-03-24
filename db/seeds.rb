class Seed
  def self.start
    new.generate
  end

  def generate
    create_users
  end

  def create_users
    User.create(first_name: "Toni", last_name: "Rib", username: "tonirib",
                password: "password", email: "toni@example.com")
    User.create(first_name: "Dan", last_name: "Rib", username: "danrib",
                password: "password", email: "dan@example.com")
    User.create(first_name: "Alia", last_name: "Atreides", username: "aliarib",
                password: "password", email: "alia@kitten.com")
    User.create(first_name: "Ender", last_name: "Wiggen", username: "ender",
                password: "password", email: "ender@battleschool.com")
  end
end

Seed.start
