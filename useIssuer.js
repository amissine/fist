const StellarSdk = require('stellar-sdk')
const server = new StellarSdk.Server('https://horizon-testnet.stellar.org')
const issuingKeys = StellarSdk.Keypair.fromSecret(process.argv[2])
const assetAmount = process.argv[3]
const assetName = process.argv[4]

const assetToIssue = new StellarSdk.Asset(assetName, issuingKeys.publicKey())

const receivingKeys = StellarSdk.Keypair.fromSecret(process.argv[5])
const amountToReceive = process.argv[6]

StellarSdk.Network.useTestNetwork()

server.loadAccount(receivingKeys.publicKey()) // load receiving account
.then(receiver => { // receiving account must trust the asset
  var transaction = new StellarSdk.TransactionBuilder(receiver, { fee: 111 })
  .addOperation(StellarSdk.Operation.changeTrust({ // create/alter a trustline
    asset: assetToIssue,
    limit: assetAmount
  }))
  .setTimeout(100) // required for a transaction
  .build()

  transaction.sign(receivingKeys)
  return server.submitTransaction(transaction)
})
.then(() => { // load issuing account
  return server.loadAccount(issuingKeys.publicKey())
})
.then(issuer => { // issuer sends the asset to receiver
  var transaction = new StellarSdk.TransactionBuilder(issuer, { fee: 111 })
  .addOperation(StellarSdk.Operation.payment({
    destination: receivingKeys.publicKey(),
    asset: assetToIssue,
    amount: amountToReceive
  }))
  .setTimeout(100) // required for a transaction
  .build()

  transaction.sign(issuingKeys)
  return server.submitTransaction(transaction)
})
.catch(e => console.error('=== Error! ===', 
  e.response.data.extras.result_codes? e.response.data.extras.result_codes : e))
