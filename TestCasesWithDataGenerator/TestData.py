# Basic Test Data Generator


from faker import Faker

data = Faker()

def getFakerUserName():
    return data.user_name()

def getFakerPassword():
    return data.password()
