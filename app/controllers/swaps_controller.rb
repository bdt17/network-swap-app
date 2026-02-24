class SwapsController < ApplicationController
  def eol
    @eol_swaps = [
      {id: 2001, device: "Cisco Catalyst 9300", site: "PHX-DC21", due: "2026-03-01"},
      {id: 2002, device: "Aruba AP-515", site: "PHX-DC21", due: "2026-03-15"}
    ]
    render layout: false
  end
end
