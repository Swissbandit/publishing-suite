#!/usr/bin/env python3

log_file = "log.txt"
output_file = "output.txt"

with open(log_file, "r") as f:
    log_content = f.read()

entries = log_content.split("-----START-----")

identifier_dict = {}  # Dictionary to track processed identifiers

with open(output_file, "w") as out_f:
    for entry in entries:
        lines = entry.strip().split("\n")
        identifier = None
        link = None
        error = False
        
        for line in lines:
            if line.startswith("bteon_vid"):
                identifier = line.strip()
            elif "https://www.brighteon.com" in line:
                link = line.strip()
            elif "Error" in line:
                error = True
            elif line.startswith("PATH type specified"):
                error = False
        
        if identifier and link and not identifier_dict.get(identifier):
            identifier_dict[identifier] = True
            
            if error:
                out_f.write(f"{identifier} | {link}\n")
                print(f"Found Error:\n  Identifier: {identifier}\n  Link: {link}\n")
            else:
                out_f.write(f"{identifier} | {link}\n")
                print(f"Found Identifier and Link:\n  Identifier: {identifier}\n  Link: {link}\n")
        else:
            print("Skipping entry with missing identifier, link, or duplicate identifier.")
            print("Raw entry content:\n", entry.strip())
            print()

print("Extraction complete. Output saved to", output_file)

