s='root 15818 15811 0 14:18 pts/11 00:00:00 /home/alec/.nvm/versions/node/v6.9.1/bin/node https-proxy.js'
s=${s#* } # from the beginning of s, drop the shortest part that ends with ' ';
          # keep the rest in s
pid2kill="${s%% *}" # from the end of s, drop the longest part that starts with ' ';
                    # keep the rest in pid2kill
echo "length of pid2kill: ${#pid2kill}"
echo "Killing pid $pid2kill"
