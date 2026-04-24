def calculate_fare(km, vehicle_type, hour):
    # Dictionary mapping
    rates = {
        "Economy": 10,
        "Premium": 18,
        "SUV": 25
    }

    try:
        # Check vehicle type
        if vehicle_type not in rates:
            return "Service Not Available"

        base_fare = km * rates[vehicle_type]

        # Surge logic
        if 17 <= hour <= 20:
            base_fare *= 1.5

        return round(base_fare, 2)

    except Exception as e:
        return f"Error: {e}"


# Taking user input
try:
    km = float(input("Enter distance (km): "))
    vehicle_type = input("Enter vehicle type (Economy/Premium/SUV): ")
    hour = int(input("Enter hour of travel (0-23): "))

    result = calculate_fare(km, vehicle_type, hour)

    print("\n----- Price Receipt -----")
    print(f"Distance: {km} km")
    print(f"Vehicle Type: {vehicle_type}")
    print(f"Hour: {hour}")

    if isinstance(result, str):
        print(result)
    else:
        print(f"Total Fare: ₹{result}")

except ValueError:
    print("Invalid input! Please enter correct values.")