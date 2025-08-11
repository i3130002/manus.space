amass enum -passive -d manus.space -o subdomains.txt

cat subdomains.txt | while read url; do
    full_url="https://$url"
    domain=$(echo "$url" | cut -d/ -f1)
    wget -q -O "manus.space/${domain}.html" "$full_url"
done

cat subdomains.txt | xargs -n 1 -P 100 -I {} sh -c '
    full_url="https://{}"
    domain=$(echo "{}" | cut -d/ -f1)
    wget -q -O "manus.space/${domain}.html" "$full_url"
'