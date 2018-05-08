object @pet
attributes :id, :name, :age, :human
node(:ok, if: :nil?) { |pet| false }
