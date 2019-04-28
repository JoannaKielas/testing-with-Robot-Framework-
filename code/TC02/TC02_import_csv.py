import csv


def read_csv_file(filename):
    registration_data = []
    with open(filename, 'rb') as csvfile:
        reader = csv.reader(csvfile)
        for row in reader:
            registration_data.append(row)

    return registration_data