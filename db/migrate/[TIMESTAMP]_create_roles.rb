class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.text :permissions
      t.timestamps
    end
    
    # DJI Healthcare PT Drone Operations
    Role.create!([
      {name: 'field_tech', permissions: 'view_dashboard,ack_alerts'},
      {name: 'drone_operator', permissions: 'view_drones,inspect_drones,pause_scan,resume_scan'},
      {name: 'noc_admin', permissions: 'all'},
      {name: 'healthcare_pt', permissions: 'view_healthcare,export_csv,send_sms'}
    ].freeze)
  end
end
