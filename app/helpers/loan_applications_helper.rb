module LoanApplicationsHelper


  #
  # Build a SocialMediaPresence object by invoking Facebook API
  # to fetch number of friends (num_connections)
  #
  def build_social_media_presence_for_business(omniauth_hash, business)

    oauth_access_token = omniauth_hash['credentials']['token']
    provider = omniauth_hash['provider']
    uid = omniauth_hash['uid']
    num_connections = get_facebook_friends(oauth_access_token).size

    # For simplicity, just consider provider as social_media_site field
    social_media_site = provider

    presence = SocialMediaPresence.new(
      provider: provider,
      uid: uid,
      num_connections: num_connections,
      social_media_site: social_media_site,
      business_id: business.id)
    presence
  end

  #
  # Base credit_mini_score on percentile of num_connections. If Business has no
  # associated social_media_presence, just report 0.
  #
  def compute_credit_mini_score(business)
    social_media_presences = business.social_media_presences

    credit_mini_score = 0
    unless social_media_presences.nil? || social_media_presences.size == 0
      credit_mini_score = (social_media_presences[0].calculate_num_connections_percentile / 10)
    end
    credit_mini_score
  end

  #
  # Using the specified oauth_access_token, invoke Facebook API using
  # Koala Gem. Return friends.
  #
  def get_facebook_friends(oauth_access_token)
    @graph = Koala::Facebook::API.new(oauth_access_token)
    friends = @graph.get_connections("me", "friends")
    friends
  end
end
