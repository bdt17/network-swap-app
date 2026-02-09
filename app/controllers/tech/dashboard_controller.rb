class Tech::DashboardController < ApplicationController
  def index
    @my_tickets = SwapTicket.where.not(tech_id: nil).order(scheduled_at: :desc).limit(10)
    @open_tickets = SwapTicket.where(status: 'scheduled').where(tech_id: nil).limit(10)
    @stats = {
      assigned: SwapTicket.where.not(tech_id: nil).count,
      open: SwapTicket.where(status: 'scheduled').where(tech_id: nil).count,
      completed: SwapTicket.where(status: 'completed').count
    }
  end

  def claim_ticket
    ticket = SwapTicket.find(params[:id])
    ticket.update!(tech_id: 1, tech_status: 'claimed', tech_name: 'John Doe (Phoenix)')
    head :ok
  end

  def complete_ticket
    ticket = SwapTicket.find(params[:id])
    ticket.update!(status: 'completed', tech_status: 'completed')
    head :ok
  end
end
