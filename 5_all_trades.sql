SELECT *
FROM nft."trades"
WHERE 
    nft_contract_address ='\xbCe3781ae7Ca1a5e050Bd9C4c77369867eBc307e'
    AND block_time >= '2022-05-19'
    AND number_of_items = 1
    AND original_currency IN ('ETH', 'WETH')
    AND erc_standard = 'erc721'