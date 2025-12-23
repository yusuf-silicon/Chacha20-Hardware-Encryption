import secrets
import csv

num_values = 1600
filename = "../../data/value.txt"


with open(filename, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)

    for i in range(num_values):

        #hex_string = secrets.token_hex(4)   #random value generator
        hex_string = i                       #sequential number generation till 8000
        #verilog_hex = f"8'h{hex_string}"
        writer.writerow([hex_string])

print(f"Successfully generated {num_values} sequentially generated numbers to {filename}")