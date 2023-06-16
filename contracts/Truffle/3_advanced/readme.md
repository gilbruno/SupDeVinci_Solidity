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

