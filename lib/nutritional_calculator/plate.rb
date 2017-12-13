
module NutritionalCalculator

  # Esta clase representa al plato Harvard
  # Este plato tiene partes diferenciadas
  # Además es capaz de calcular el valor nutricional respecto a una base de datos

  class Plate

    # Fichero donde se encuentra la base da datos de alimentos
    DATABASE_FILE = "lib/files/food_database.config"

    # Atributos que podremos leer
    attr_reader :name, :food_database, :vegetables, :fruits, :cereals, :proteins, :oils, :drinks

    # Constructor de la clase
    # @param name [string] nombre que tendrá el plato
    def initialize(name)
      @name = name
      @food_database = read_food_database(DATABASE_FILE)

      @vegetables = {}
      @fruits = {}
      @cereals = {}
      @proteins = {}
      @oils = {}
      @drinks = {}
    end

    # Métodos para añadir elementos a las partes del plato.

    def vegetable(food_name, quantity = {})
        add_food_to_plate("vegetable", food_name, quantity[:amount]) if(quantity[:amount])
    end

    def fruit(food_name, quantity = {})
        add_food_to_plate("fruit", food_name, quantity[:amount]) if(quantity[:amount])
    end

    def cereal(food_name, quantity = {})
        add_food_to_plate("cereal", food_name, quantity[:amount]) if(quantity[:amount])
    end

    def protein(food_name, quantity = {})
        add_food_to_plate("protein", food_name, quantity[:amount]) if(quantity[:amount])
    end

    def oil(food_name, quantity = {})
        add_food_to_plate("oil", food_name, quantity[:amount]) if(quantity[:amount])
    end

    def drink(food_name, quantity = {})
        add_food_to_plate("drink", food_name, quantity[:amount]) if(quantity[:amount])
    end

    private

    # Método que lee la base da datos desde el fichero
    def read_food_database(database_file)

      food_database = Hash.new

      File.open(database_file, "r") do |f|
        f.each_line do |line|
          food_elements = line.split(" ")

          food_name = food_elements[0]
          current_pos = 1

          while food_elements[current_pos].to_f == 0.0 && food_elements[current_pos] != "#{food_elements[current_pos].to_f}"
            food_name += " " + food_elements[current_pos]
            current_pos += 1
          end

          food_attributes = food_elements[current_pos...food_elements.length].map {|element| element.to_f}
          food_database[food_name] = Food.new(food_name, food_attributes[0], food_attributes[1], food_attributes[2])
        end
      end

      food_database
    end

    def add_food_to_plate(food_kind, food_name, str_amount)
      case food_kind
      when "vegetable"
        @vegetables[food_name] = str_amount
      when "fruit"
        @fruits[food_name] = str_amount
      when "cereal"
        @cereals[food_name] = str_amount
      when "protein"
        @proteins[food_name] = str_amount
      when "oil"
        @oils[food_name] = str_amount
      when "drink"
        @drinks[food_name] = str_amount
      end
    end
  end
end