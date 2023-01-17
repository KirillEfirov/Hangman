class Game
    def initialize(obj1, obj2)
        @objects = [obj1, obj2]
    end

    def to_yaml
        YAML.dump(@objects)
    end 

    def self.from_yaml(info_in_yaml)
        YAML.unsafe_load(info_in_yaml)
    end
end