const StellarSdk = require('stellar-sdk')
const fetch = require('node-fetch')
const server = new StellarSdk.Server('https://horizon-testnet.stellar.org')
const accountPubKey = process.argv[2]

var e

StellarSdk.Network.useTestNetwork()
server.loadAccount(accountPubKey)
  .catch(error => createAccount(error))
  .then(() => e || console.log('Found Stellar account', accountPubKey))

function createAccount (error) {
  console.error(e = error, '=== The account is now being created ===')

  const addr =
    `https://friendbot.stellar.org?addr=${encodeURIComponent(accountPubKey)}`

  fetch(addr)
    .then(res => res.json())
    .then(json => console.log(json))
}
