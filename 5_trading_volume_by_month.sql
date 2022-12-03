SELECT 
    DATE_TRUNC('month', block_time) as evt_month,
    SUM(original_amount) AS trade_volume
FROM nft."trades"
WHERE 
    nft_contract_address ='\xbCe3781ae7Ca1a5e050Bd9C4c77369867eBc307e'
    AND block_time >= '2022-05-19'
    -- this is to simplify analysis
    AND number_of_items = 1
    AND original_currency IN ('ETH', 'WETH')
    AND erc_standard = 'erc721'
GROUP BY 1
ORDER BY 2 DESC