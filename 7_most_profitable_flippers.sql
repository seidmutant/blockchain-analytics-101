WITH trades AS (
    SELECT block_time, seller, buyer, original_amount, token_id
    FROM  nft."trades"
    CROSS JOIN UNNEST(nft_token_ids_array) AS token_id
    WHERE 
        nft_contract_address ='\xbCe3781ae7Ca1a5e050Bd9C4c77369867eBc307e'
        AND block_time >= '2022-05-19'
        AND number_of_items = 1
        AND original_currency IN ('ETH', 'WETH')   
        AND erc_standard = 'erc721'
),

flips AS (
    SELECT 
        A.block_time AS block_time_buy, 
        B.block_time AS block_time_sell, 
        A.token_id, 
        A.original_amount AS amount_buy, 
        B.original_amount AS amount_sell, 
        B.original_amount - A.original_amount AS amount_profit,
        A.buyer, 
        A.seller,
        B.block_time - A.block_time AS time_diff
    FROM trades AS A
    JOIN trades AS B
    ON 
        A.token_id = B.token_id
        AND A.buyer = B.seller
        AND A.block_time < B.block_time
)

SELECT 
    seller, 
    SUM(amount_profit) AS amount_profit,
    COUNT(*) AS num_flips,
    MAX(amount_profit) AS max_amount_profit,
    AVG(time_diff) AS avg_time_to_flip
FROM flips
GROUP BY 1
ORDER BY 2 DESC