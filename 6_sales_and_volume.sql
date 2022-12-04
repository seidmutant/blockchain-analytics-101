----- SALES AND VOLUME ALL TIME
WITH trades AS (
    SELECT tx_hash, original_amount
    FROM  nft."trades"
    CROSS JOIN UNNEST(nft_token_ids_array) AS token_id
    WHERE 
        nft_contract_address ='\xbCe3781ae7Ca1a5e050Bd9C4c77369867eBc307e'
        AND block_time >= '2022-05-19'
        AND number_of_items = 1
        AND original_currency IN ('ETH', 'WETH')   
        AND erc_standard = 'erc721'
)

SELECT 
    COUNT(tx_hash) AS count_sales, 
    SUM(original_amount) AS total_volume
FROM trades

----- SALES AND VOLUME LAST 7 DAYS
WITH trades AS (
    SELECT block_time, tx_hash, original_amount
    FROM  nft."trades"
    CROSS JOIN UNNEST(nft_token_ids_array) AS token_id
    WHERE 
        nft_contract_address ='\xbCe3781ae7Ca1a5e050Bd9C4c77369867eBc307e'
        AND block_time >= '2022-05-19'
        AND number_of_items = 1
        AND original_currency IN ('ETH', 'WETH')   
        AND erc_standard = 'erc721'
)

SELECT 
    COUNT(tx_hash) AS count_sales, 
    SUM(original_amount) AS total_volume
FROM trades
WHERE 
    NOW() - block_time <= INTERVAL '7 days'