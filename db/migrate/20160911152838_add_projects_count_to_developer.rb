class AddProjectsCountToDeveloper < ActiveRecord::Migration
  def change
    change_table :developers do |t|
      t.integer :projects_count, default: 0
    end

    reversible do |dir|
      dir.up { data }
    end
  end

  def data
    execute <<-SQL.squish
        UPDATE developers
           SET projects_count = (SELECT count(1)
                                   FROM projects
                                  WHERE projects.developer_id = developers.id)
    SQL
  end
end
