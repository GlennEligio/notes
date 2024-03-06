#!/bin/bash

# recreate temporary file to store data
rm -rf ./temp.env
touch temp.env

# Read each line in .env file
# Each line represents key=value pairs
while read -r line || [[ -n "$line" ]];
do
  echo $line
  # Split env variables by character `=`
  if printf '%s\n' "$line" | grep -q -e '='; then
    varname=$(printf '%s\n' "$line" | sed -e 's/=.*//')
    varvalue=$(printf '%s\n' "$line" | sed -e 's/^[^=]*=//')
	echo $varname 
	echo $varvalue
  fi

  # Read value of current variable if exists as Environment variable
  value=$(printf '%s\n' "${!varname}")
  echo "Value in env"
  echo $value
  # Otherwise use value from .env file
  [[ -z $value ]] && value=${varvalue}
  
  # Append configuration property to temporary .env file
  echo "$varname=$value" >> ./temp.env
done < .env

# remove and recreate the .env file after using it
rm -rf .env
touch .env

# copy the contents of temporary file to the .env file
echo "Contents of the temp file"
cat ./temp.env
cat ./temp.env >> .env

# remove temp file
rm -rf ./temp.env