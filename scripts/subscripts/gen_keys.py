import secrets
import csv

num_values = 8000
filename = "../../data/keys.txt"


with open(filename, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)

    for _ in range(num_values):
        hex_string = secrets.token_hex(4)
        verilog_hex = f"8'h{hex_string}"
        writer.writerow([verilog_hex])

print(f"Successfully generated {num_values} random 32-bit hex numbers and saved to {filename}")