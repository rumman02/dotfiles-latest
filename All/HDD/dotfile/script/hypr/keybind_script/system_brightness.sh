#!/bin/bash
# increase_brightness() {
#     current_brightness=$(ddcutil getvcp 10 | awk '/current value/ {print $9}' | sed 's/,//')
#     new_brightness=$((current_brightness + 5))
#
#     # Ensure new brightness does not exceed 100
#     if [ "$new_brightness" -gt 100 ]; then
#         new_brightness=100
#     fi
#
#     ddcutil setvcp 10 "$new_brightness"
#     echo "System brightness increased to $new_brightness."
# }
#
# decrease_brightness() {
#     current_brightness=$(ddcutil getvcp 10 | awk '/current value/ {print $9}' | sed 's/,//')
#     new_brightness=$((current_brightness - 5))
#
#     # Ensure new brightness does not go below 0
#     if [ "$new_brightness" -lt 0 ]; then
#         new_brightness=0
#     fi
#
#     ddcutil setvcp 10 "$new_brightness"
#     echo "System brightness decreased to $new_brightness."
# }
#
# # Main logic
# case "$1" in
#     brightness_plus)
#         increase_brightness
#         ;;
#     brightness_minus)
#         decrease_brightness
#         ;;
#     *)
#         # echo "Usage: $0 {border_size_plus|border_size_minus|active_opacity_plus|active_opacity_minus}"
#         ;;
# esac


# init_val=0
# set_brightness() {
# 	get_brightness_val=$(ddcutil getvcp 10 | awk '/current value/ {print $9}' | sed 's/,//')
# 	get_brightness_val=get_brightness_val + init_val
# 	ddcutil setvcp 10 "$get_brightness_val"
# }
#
# increase_brightness() {
# 	init_val=init_val + 1
#     if [ "$init_val" -gt 100 ]; then
#         init_val=100
#     fi
# }
# decrease_brightness() {
# 	init_val=init_val - 1
#     if [ "$init_val" -lt 0 ]; then
#         init_val=0
#     fi
# }
#
# # Main logic
# case "$1" in
#     brightness_plus)
#         increase_brightness
#         ;;
#     brightness_minus)
#         decrease_brightness
#         ;;
#     *)
#         echo ""
#         ;;
# esac
#
#
# sleep 2
# set_brightness
#
#!/bin/bash

# init_val=0
#
# set_brightness() {
#     current_brightness=$(ddcutil getvcp 10 | awk '/current value/ {print $9}' | sed 's/,//')
#     new_brightness=$((current_brightness + init_val))
#
#     # Ensure new brightness is within 0-100
#     if [ "$new_brightness" -gt 100 ]; then
#         new_brightness=100
#     elif [ "$new_brightness" -lt 0 ]; then
#         new_brightness=0
#     fi
#
#     ddcutil setvcp 10 "$new_brightness"
#     echo "Brightness set to $new_brightness."
# }
#
# increase_brightness() {
#     init_val=$((init_val + 1))
#     if [ "$init_val" -gt 100 ]; then
#         init_val=100
#     fi
# }
#
# decrease_brightness() {
#     init_val=$((init_val - 1))
#     if [ "$init_val" -lt 0 ]; then
#         init_val=0
#     fi
# }
#
# # Main logic
# case "$1" in
#     brightness_plus)
#         increase_brightness
#         ;;
#     brightness_minus)
#         decrease_brightness
#         ;;
#     *)
#         echo "Usage: $0 {brightness_plus|brightness_minus}"
#         exit 1
#         ;;
# esac
#
# # Wait for 2 seconds before setting the brightness
# sleep 2
# set_brightness
#!/bin/bash

# Initialize the change variable
# change=0
#
# set_brightness() {
#     current_brightness=$(ddcutil getvcp 10 | awk '/current value/ {print $9}' | sed 's/,//')
#     new_brightness=$((current_brightness + change))
#
#     # Ensure new brightness is within 0-100
#     if [ "$new_brightness" -gt 100 ]; then
#         new_brightness=100
#     elif [ "$new_brightness" -lt 0 ]; then
#         new_brightness=0
#     fi
#
#     ddcutil setvcp 10 "$new_brightness"
#     echo "Brightness set to $new_brightness."
# }



#!/bin/bash

# Initial brightness value
# value=50  # Starting at 50, can be adjusted
# max_value=100
# min_value=0
#
# # Function to set brightness using ddcutil
# set_brightness() {
#     ddcutil setvcp 10 $value
# }
#
# # Increase or decrease brightness based on argument
# if [[ "$1" == "brightness_minus" ]]; then
#     value=$((value - 1))
# else
#     value=$((value + 1))
# fi
#
# # Clamp the value between min_value and max_value
# if [[ $value -gt $max_value ]]; then
#     value=$max_value
# elif [[ $value -lt $min_value ]]; then
#     value=$min_value
# fi
#
# # Wait for 2 seconds before setting the brightness
# sleep 2
# set_brightness
#

#!/bin/bash

BRIGHTNESS_FILE="$HOME/.cache/.myvalue/ddcutil/current_brightness"

temp_val=0

increase_brightness() {
    temp_val=$((temp_val + 1))
}

case "$1" in
    brightness_plus)
        increase_brightness
        ;;
    brightness_minus)
        decrease_brightness
        ;;
    *)
        # echo "Usage: $0 {border_size_plus|border_size_minus|active_opacity_plus|active_opacity_minus}"
        ;;
esac
# Example of calling the function

# Calculate the new brightness value
new_brightness=$((current_brightness + temp_val))

# Write the new brightness value to the file
echo "$new_brightness" > "$BRIGHTNESS_FILE"
