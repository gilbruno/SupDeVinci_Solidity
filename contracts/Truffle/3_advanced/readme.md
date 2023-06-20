1. Get funds from users
2. Withdraw funds
3. Set a minimum funding value in USD

4. Notions abordées

    - require : comment on l'écrit
    - revert : comment ça fonctionne => annule toutes les instructions avant le require qui a revert 
             Par contre, meme si la Tx est annulée, ça nous oute du Gas
    - oracles : Pb non interaction native on-chain <==> off-chain car la BC est deterministe et l'appel à une API est non déterministe 
              Donc, pb de consensus entre noeuds.
              On doit utiliser un Oracke pour le pont on-chain <==> off-chain.
              Le leader est Chainlink (Cf https://docs.chain.link) pour voir les contrats des différentes "price feed"
              Chaque paire (ex : ETH/USD) a son propre contrat de price feed (https://docs.chain.link/docs/ethereum-addresses)

    - Oracles : VRF = Verifable Randomness Functions 
            Du fait du caractère déterministe de la BC, on ne peut pas voir de nb aléatoire (car on doit avoir un consensus entre chaque noeud)
            Ceci est utilisé par exemple dans les Dapps de loterie
            C.f. https://docs.chain.link/docs/get-a-random-number

    - Chainlink Keepers : Decentralized Event-Driven Execution


## Cours 3.1

        - Utilisation de msg.value pour envoyer des fonds à un smart contract
        - Test dans Remix

## Cours 3.2
        - Utilisation d'un Oracle pour connaitre le prix d'un ETH en USD (data off-chain)
        - Si on veut importer un contrat externe ==> Import via NPM + modifier settings de solidity 
        afin d'ajouter l'option "solidity.packageDefaultDependenciesDirectory": "node_modules"

         
## Cours 3.3
        - Utilisation de 'msg.sender' pour avoir une trace des users qui envoient des fonds au SC

## Cours 3.4        
        - Refacto du code de calcul du prix ETH/USD dans une "library" 
                Libraries are similar to contracts, but you can't declare any state variable and you can't send ether.
                A library is embedded into the contract if all library functions are internal.
                Otherwise the library must be deployed and then linked before the contract is deployed.

## Cours 3.5
        - On aborde les 3 manières d'envoyer de l'argent à l'extérieur du smart contract : 
                - transfer
                - send
                - call
