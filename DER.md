erDiagram

    CLIENTE ||--o{ PEDIDO : realiza

    PEDIDO ||--o{ ITEM_PEDIDO : possui

    PRODUTO ||--o{ ITEM_PEDIDO : compoe

    CATEGORIA ||--o{ PRODUTO : classifica

    FORNECEDOR ||--o{ PRODUTO : fornece

    PEDIDO ||--|| PAGAMENTO : gera

    PEDIDO ||--|| ENTREGA : possui

    CLIENTE {
        int id_cliente PK
        string nome
        string email
        string telefone
    }

    CATEGORIA {
        int id_categoria PK
        string nome_categoria
    }

    FORNECEDOR {
        int id_fornecedor PK
        string nome
        string telefone
    }

    PRODUTO {
        int id_produto PK
        string nome
        decimal preco
        int estoque
        int id_categoria FK
        int id_fornecedor FK
    }

    PEDIDO {
        int id_pedido PK
        date data_pedido
        decimal valor_total
        int id_cliente FK
    }

    ITEM_PEDIDO {
        int id_item PK
        int quantidade
        decimal subtotal
        int id_pedido FK
        int id_produto FK
    }

    PAGAMENTO {
        int id_pagamento PK
        string forma_pagamento
        decimal valor
        date data_pagamento
        int id_pedido FK
    }

    ENTREGA {
        int id_entrega PK
        string endereco
        string status
        date data_entrega
        int id_pedido FK
    }
