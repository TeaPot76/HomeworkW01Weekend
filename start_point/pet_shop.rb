def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
 return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, add_cash)
 pet_shop[:admin][:total_cash] += add_cash
end

def add_or_remove_cash__remove(pet_shop, remove_cash)
 pet_shop[:admin][:total_cash] -= add_cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
#   assert_equal(0, sold)
end

def increase_pets_sold(pet_shop, num)
  pet_shop[:admin][:pets_sold] += num
end

def stock_count(pet_shop)
  pets_total = 0
  for pets in pet_shop[:pets]
    pets_total += 1
   end
   puts pet_shop[:pets].count # can use this as return rather than for loop
   return pets_total
end

# test 8 and  9
def pets_by_breed(pet_shop, breed)
   types = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      types.push(breed)
     end
  end
  return types
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
  def remove_pet_by_name(pet_shop, name)
    pet_to_delete = find_pet_by_name(pet_shop, name)
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
    return cust[:cash] -= money
  end

  def customer_pet_count(cust)
    return cust[:pets].length
  end


    def add_pet_to_customer(cust, pet)cd
         puts cust
         cust[:pets] << pet
         puts cust
         puts cust[:pets].length
     end
