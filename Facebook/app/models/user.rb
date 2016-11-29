class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    user = User.where(uid: auth.uid).first_or_initialize do |user|
      user.name             = auth.info.name
      user.email            = auth.info.email
      user.provider         = auth.provider
      user.uid              = auth.uid
      user.oauth_token      = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
    user
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end

end
# @graph.put_wall_post("hey, i'm learning koala")
# # => {"id"=>"2905623_123183957698327"}
# Oops — we misspelled Koala! How embarrassing.

# @graph.delete_object("2905623_123183957698327")
# @graph.put_wall_post("explodingdog!", {:name => "i love loving you", :link => "http://www.explodingdog.com/title/ilovelovingyou.html"}, "tmiley")
#.put_like(id),id.class=String
#@graph.delete_like("7204941866_117111188317384")
#@graph.put_comment("7204941866_117111188317384", "Can't believe Mother's Day's just a week away!  I'd better get on that gift.")