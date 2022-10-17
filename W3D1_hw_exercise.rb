# def return_number(a)
#     ((a / 2)**2) * (65 - (a / 2))
# end

# Calculate how much money they'll have by multiplying by the number of years they have left until retirement.
# Estimate your child's current bank account by squaring their age.
# Estimate your child's age by dividing your age by two.
# Calculate how many years your child has left until they retire at age 65


def child_retirement_amt(your_age)

    est_child_age = your_age / 2
    yrs_til_retire = 65 - est_child_age
    est_current_bank_acct = est_child_age**2

    est_current_bank_acct * yrs_til_retire

end    

p child_retirement_amt(30)