class ArOverlayService
  def self.overlay_for_rack(rack_id)
    {
      rack: rack_id,
      devices: Device.where(rack_id: rack_id),
      drone_scan: DroneFleet.last&.issues || [],
      instructions: "Replace EOL Cisco 9300 in slot B2",
      ar_markers: ["rack_3u", "switch_b2", "cable_tray"]
    }
  end
end
