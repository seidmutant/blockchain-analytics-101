SELECT *
FROM nft."trades"
WHERE 
    nft_contract_address ='\x60bb1e2AA1c9ACAfB4d34F71585D7e959f387769'
    AND original_currency in ('ETH','WETH')
    AND block_time >= '2022-10-31'