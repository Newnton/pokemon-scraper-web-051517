class Pokemon
  attr_accessor :name, :type, :db, :id
  def initialize(poke_hash)
    @name = poke_hash[:name]
    @type = poke_hash[:type]
    @db = poke_hash[:db]
    @id = poke_hash[:id]
  end

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon(name, type) VALUES (?, ?)', name, type)
  end

  def self.find(id, db)
    poke_ary = db.execute("SELECT *
    FROM pokemon
    WHERE id = ?;", id)[0]
    Pokemon.new(id: poke_ary[0], name: poke_ary[1], type: poke_ary[2])
  end
end
