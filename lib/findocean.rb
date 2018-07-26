require 'byebug'
class World

  def initialize(map, x, y)
    @x = x
    @y = y
    @map = map
    @spots = []
    self.process
  end

  def process
    switch_to_ocean(@x, @y)
    seek([[@x, @y]])
  end

  def map
    @map
  end

  def is_water?(cell)
    cell == 'W' ? true : false
  end

  def check_cell?(cell)
    return true if cell.nil?
    @spots.include?(cell)
  end

  def number_of_rows
    @map.size
  end

  def switch_to_ocean(x, y)
    @map[x][y] = 'O'
    [x, y]
  end

  def scrub_cells(cells)
    cells.compact!
  end

  def seek(locs)
    locs.each do |l|
      x, y = l.first, l.last
      new_cells = []
      new_cells << check_left(x, y)
      new_cells << check_right(x, y)
      new_cells << check_top(x, y)
      new_cells << check_bottom(x, y)
      new_cells = self.scrub_cells new_cells
      next unless new_cells.any?
      @spots << l
      seek(new_cells)
    end
  end

  def check_left(x, y)
    new_cell = [x, y - 1] if y != 0 && self.is_water?(@map[x][y - 1])
    switch_to_ocean(x, y - 1) unless check_cell?(new_cell)
  end

  def check_right(x, y)
    new_cell = [x, y + 1] if y != @map.first.size - 1 && self.is_water?(@map[x][y + 1])
    switch_to_ocean(x, y + 1) unless check_cell?(new_cell)
  end

  def check_top(x, y)
    new_cell = [x - 1, y] if x != 0 && self.is_water?(@map[x - 1][y])
    switch_to_ocean(x - 1, y) unless check_cell?(new_cell)
  end

  def check_bottom(x, y)
    new_cell = [x + 1, y] if (x != (self.number_of_rows - 1) && self.is_water?(@map[x + 1][y]))
    switch_to_ocean(x + 1, y) unless check_cell?(new_cell)
  end

end

def find_ocean(map,x,y)
   world = World.new(map,x,y)
   world.map
end
