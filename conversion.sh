output_file="/root/Desktop/Problem_3/conversion_result.txt"

decimal_to_binary() {
    number=$1
    binary=""
    while [ "$number" -gt 0 ]; do
        remainder=$(( number % 2 ))
        binary="$remainder$binary"
        number=$(( number / 2 ))
    done
    echo "$binary"
}

decimal_to_hexadecimal() {
    number=$1
    hex=""
    hex_map=(0 1 2 3 4 5 6 7 8 9 A B C D E F)
    while [ "$number" -gt 0 ]; do
        remainder=$(( number % 16 ))
        hex="${hex_map[remainder]}$hex"
        number=$(( number / 16 ))
    done
    echo "$hex"
}

echo "Enter a decimal number (less than 100000):"
read -r decimal_number

if ! [[ "$decimal_number" =~ ^[0-9]+$ ]]; then
    echo "Error: Input is not a valid decimal number." | tee "$output_file"
    exit 1
fi

if [[ "$decimal_number" -ge 100000 ]]; then
    echo "Error: Only decimal numbers less than 100000 are allowed!" | tee "$output_file"
    exit 1
fi

binary_result=$(decimal_to_binary "$decimal_number")
hexadecimal_result=$(decimal_to_hexadecimal "$decimal_number")

echo "Decimal: $decimal_number" > "$output_file"
echo "Binary: $binary_result" >> "$output_file"
echo "Hexadecimal: $hexadecimal_result" >> "$output_file"

echo "Conversion results saved to $output_file."
