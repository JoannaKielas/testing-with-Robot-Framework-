import csv

def read_csv_file(filename):
    list_of_countries =[]
    with open(filename) as csvfile:
        reader = csv.reader(csvfile)
        for line in reader:
            list_of_countries.extend(line)
            print(list_of_countries, "line")

            print(list_of_countries)
    return list_of_countries
