# Get names of all structs

STRUCTS=$(~/go/bin/zek server1_min.xml  | grep struct | sed -e 's|\t||g' | tr A-Z  a-z | cut -d " " -f 1)
array=$(echo $STRUCTS | tr "\n" "\n")

# Generate one struct for each name

for STRUCT in $array ; do
  ~/go/bin/zek -t "$STRUCT" -m server1_min.xml >> generated.go
  echo "" >> generated.go
done

# Then, by hand, delete the structs that are nested in other structs