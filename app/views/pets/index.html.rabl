collection @pets
attributes :id, :name, :age, :human
node(:is_even) { |pet| pet.id % 2 == 0 }
