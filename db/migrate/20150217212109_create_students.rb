class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :user_name,  null: false
      t.string :password_digest,  null: false
    end
  end
end
