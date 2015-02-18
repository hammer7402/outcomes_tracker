class CreateCoursesLocationsJoinTable < ActiveRecord::Migration
  def change
    create_table :courses_locations, id: false do |t|
      t.integer :course_id
      t.integer :location_id
    end

    add_index :courses_locations, :course_id
    add_index :courses_locations, :location_id
  end
end
