class CascadeDeleteForBadges < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key "users_badges", "badges"
    remove_foreign_key "users_badges", "users"

    add_foreign_key "users_badges", "badges", on_delete: :cascade
    add_foreign_key "users_badges", "users", on_delete: :cascade
  end
end
