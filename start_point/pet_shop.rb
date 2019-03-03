def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
 return pet_shop[:admin][:total_cash]
end
# for some reason does not work
# def add_or_remove_cash(pet_shop, add_cash)
#   total_cash(pet_shop) += add_cash
# end

def add_or_remove_cash(pet_shop, add_cash)
 pet_shop[:admin][:total_cash] += add_cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, num)
  pet_shop[:admin][:pets_sold] += num
end

def stock_count(pet_shop)
  pets_total = 0
  for pets in pet_shop[:pets]
    pets_total += 1
   end
   # puts pet_shop[:pets].count # can use this as return rather than for loop
   return pets_total
end

# test 8 and  9
def pets_by_breed(pet_shop, breed)
    pets_breed = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      pets_breed.push(pet)
     end
    end
  #    print pets_breed
  #    pets_breed = [{:name=>"Sir Percy", :pet_type=>:cat, :breed=>"British Shorthair", :price=>500}, {:name=>"King Bagdemagus",
  #    :pet_type=>:cat, :breed=>"British Shorthair", :price=>500}]
    return pets_breed
 end

# test 10 & 11
def find_pet_by_name(pet_shop, call)
  for pet in pet_shop[:pets]
    if pet[:name] == call
      return pet
    end
   end
  return nil
end
#test 12 loop
  # def remove_pet_by_name(pet_shop, name)
  #   for pet in pet_shop[:pets]
  #     if pet[:name] == name
  #     pet_shop[:pets].delete(pet)
  #    end
  #   end
  # end
# test 12 re-factor
  def remove_pet_by_name(pet_shop, call)
    pet_to_delete = find_pet_by_name(pet_shop, call)
    pet_shop[:pets].delete(pet_to_delete)
  end

  def add_pet_to_stock(pet_shop, new_pet)
    pet_shop[:pets] << new_pet
    # puts pet_shop[:pets]
    return pet_shop[:pets].length
  end

  def customer_cash(customers)
    return customers[:cash]
  end

  def remove_customer_cash(cust, money)
     cust[:cash] -= money
  end

  def customer_pet_count(cust)
    return cust[:pets].length
  end


    def add_pet_to_customer(cust, call)
         # puts cust
         cust[:pets] << call
         # puts cust
         # puts cust[:pets].length
     end


       def customer_can_afford_pet(cust, call)
         if cust[:cash] >= call[:price]
           return true
        else
         false
       end
      end

       # #These are 'integration' tests so we want multiple asserts.
       # #If one fails the entire test should fail


       # def find_pet_by_name(pet_shop, call) copy of method for refence
       #   for pet in pet_shop[:pets]
       #     if pet[:name] == call
       #       return pet
       #     end
       #    end
       #   return nil
       # end




       def sell_pet_to_customer(pet_shop, call, cust)
         if call == nil
          # puts "No pet was passed in"
          return
        end
         customer_can_afford = customer_can_afford_pet(cust, call)
         customer_pets = customer_pet_count(cust)
         if customer_can_afford
           # puts " customer can afford and pet exists"
           add_pet_to_customer(cust, call)
           increase_pets_sold(pet_shop, 1)
           remove_customer_cash(cust, call[:price])
           add_or_remove_cash(pet_shop, call[:price])
          end
       end
