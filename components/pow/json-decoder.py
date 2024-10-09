import json

filename = input("Indicate file: ")
file = open(f"./{filename}", "r")

json_input = json.loads(file.read())
file.close()


binary_string = ""
count = 0
while True:
    try:
        binary_string += json_input["instructions_binary"][count]["loaded"]
        count += 1

    except:
        break


print(bin(int(binary_string, 2)))
