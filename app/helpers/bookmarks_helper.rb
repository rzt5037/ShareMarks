module BookmarksHelper
  def allowed_to_see?(bookmark)
    current_user.id == bookmark.user_id
  end
end
