# GPG : OpenPGP encryption and signing tool

## Asymmetric Keys 
### Create public/private key pair
`gpg --gen-key`

### Create the revocation certificate
`gpg --gen-revoke <key id or email associated>`
- This will write out to the screen
`gpg --gen-revoke dirk.kappel@effectual.com > dirk.revoke.gpg`

### Export public key
`gpg --export <uid> > pubkey.gpg`
- Creates a binary file. (use armor to share)
  - Must view the file with hex viewer, e.g. `xxd pubkey.gpg`
- This is key is shared, the private key remains secret.
- **--armor** : Creates a text-encoded file that can be shared e.g. email.
`gpg --armor --export <uid> > pubkey.gpg`

### Send public key to a key server
`gpg --send-key <uid>` 
- This will send to a key server already in your configuration file.
- E.g. keyserver.ubuntu.com

### Acquiring other Public Keys
- Download from a key server.
- Get the fingerprint `gpg --fingerprint <UID>`

### Importing Keys
- From a key server
`gpg --rec-keys <UID>`
- From a file
`gpg --import dirk.pubkey.gpg`

## Key Ring
`gpg --list-keys`
- List all keys in your keyring
`gpg --list-sigs`
- List all keys with signatures
`gpg --delete-key <UID>`
- Delete a key

### Generate random password using gpg
`gpg --gen-random --armor 1 16`
- **gen-random** : Emit random bytes.
- **armor**      : base64 encoded.
- **16**         : Length of password.