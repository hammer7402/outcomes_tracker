class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :cohort, null: false
      t.date   :ends_on, null: false
      t.references :course
    end
  end
end
