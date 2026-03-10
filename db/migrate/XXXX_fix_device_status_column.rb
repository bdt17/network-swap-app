class FixDeviceStatusColumn < ActiveRecord::Migration[7.0]
  def up
    execute "UPDATE devices SET status = 1 WHERE status = 'operational'"
    execute "UPDATE devices SET status = 0 WHERE status = 'down'"
    execute "ALTER TABLE devices ALTER COLUMN status TYPE integer USING status::integer"
  end
  
  def down
    execute "ALTER TABLE devices ALTER COLUMN status TYPE text USING status::text"
  end
end
