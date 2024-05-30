"""
Nested objects correspond to usage of dictionary, hence this is a dictionary specific code.
"""

def retrieve_data(obj, key):
    current_obj = obj
    if type(obj) == dict:
        for i in key.split("."): #because every nested object item has to be split in order to access
            if i not in current_obj:
                return None
            else:
                current_obj = current_obj[i]
        return current_obj
    else:
        print("It is not a dictionary")


data = {"a":
        {"b":
         {"c":"d"}}}
data1 = [1,2,3]

value = retrieve_data(data, "a.b.c")
print(value)

answer = retrieve_data(data1, 1)
print(answer)