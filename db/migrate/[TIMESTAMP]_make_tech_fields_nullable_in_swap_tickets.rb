class MakeTechFieldsNullableInSwapTickets < ActiveRecord::Migration[8.1]
  def change
    change_column_null :swap_tickets, :assigned_tech_id, true
    change_column_null :swap_tickets, :assigned_tech_type, true
  end
end
