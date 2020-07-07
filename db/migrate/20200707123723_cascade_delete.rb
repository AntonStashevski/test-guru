class CascadeDelete < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key "answers", "questions"
    remove_foreign_key "gists", "questions"
    remove_foreign_key "gists", "users"
    remove_foreign_key "questions", "tests"
    remove_foreign_key "test_passages", "tests"
    remove_foreign_key "test_passages", "users"
    remove_foreign_key "tests", "categories"
    remove_foreign_key "tests", "users"

    add_foreign_key "answers", "questions", on_delete: :cascade
    add_foreign_key "gists", "questions", on_delete: :cascade
    add_foreign_key "gists", "users", on_delete: :cascade
    add_foreign_key "questions", "tests", on_delete: :cascade
    add_foreign_key "test_passages", "tests", on_delete: :cascade
    add_foreign_key "test_passages", "users", on_delete: :cascade
    add_foreign_key "tests", "categories", on_delete: :cascade
    add_foreign_key "tests", "users", on_delete: :cascade
  end
end
