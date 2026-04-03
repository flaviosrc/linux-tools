# Github ssh setput

## Generating a key

```
$ ssh-keygen -t ed25519 -C "your_email@example.com"
or
$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

## Adding to agent
```
$ ssh-add ~/.ssh/id_ed25519
```

## Connect using ssh private key

```
ssh -i privateKeyFileName "username@address"
```
