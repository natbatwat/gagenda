class RemoveStartTimeFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :start_time, :time
  end
end
