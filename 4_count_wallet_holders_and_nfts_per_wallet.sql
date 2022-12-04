WITH transactions AS (
    SELECT 
        "tokenId" AS token_id,
        "to" AS to_address,
        ROW_NUMBER() OVER (PARTITION BY contract_address, "tokenId" ORDER BY evt_block_time DESC) AS transction_rank
    FROM erc721."ERC721_evt_Transfer"
    WHERE 
        contract_address = '\xbCe3781ae7Ca1a5e050Bd9C4c77369867eBc307e'
        AND evt_block_time >= '2022-05-19'
)

SELECT 
    COUNT(DISTINCT to_address) AS count_wallet_holders,
    COUNT(*)*1.0 / COUNT(DISTINCT to_address)*1.0 AS avg_nft_per_wallet
FROM transactions
WHERE transction_rank = 1