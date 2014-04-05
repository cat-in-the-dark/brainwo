class TeamsVictimsCollection
  def initialize(teams, victims_hash = {})
    @teams = teams
    @victims_hash = victims_hash
  end

  def save
    return false if @teams.nil?
    return false if @victims_hash.nil?
    Rails.logger.info "VICTIMS: #{@victims_hash.as_json}"

    @teams.each do |team|
      team.update_attribute :victim_id, @victims_hash[team.id.to_s][:victim_id] unless @victims_hash[team.id.to_s].nil?
    end
  end
end