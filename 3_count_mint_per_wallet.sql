SELECT "to", COUNT(*)
FROM erc721."ERC721_evt_Transfer" 
WHERE 
    contract_address = '\xbCe3781ae7Ca1a5e050Bd9C4c77369867eBc307e' 
    AND "from" = '\x0000000000000000000000000000000000000000'
    AND evt_block_time >= '2022-05-19'    
GROUP BY 1
ORDER BY 2 DESC