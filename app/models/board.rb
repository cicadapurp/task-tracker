class Board < ApplicationRecord
  has_many :tasks

  #methods
def self.all_board(id)
  Board.find_by_sql("

    SELECT *
    FROM boards AS b
    WHERE b.id = #{id}

    ")

end


end
