class CreateProjectsLanguages < ActiveRecord::Migration
  def change
    create_table :projects_languages do |t|
      t.references :project, index: true, foreign_key: true
      t.references :language, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
