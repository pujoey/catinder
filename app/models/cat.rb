class Cat < ActiveRecord::Base

  def upvote!
    update(votes: self.votes + 1)
  end
end
