/// <summary>
/// Query ProductionOrders_LDR (ID 50100).
/// </summary>
query 50100 ProductionOrders_LDR
{
    Access = Public;
    APIGroup = 'production';
    APIPublisher = 'liderit';
    APIVersion = 'beta';
    Caption = 'Production Orders', comment = 'ESP="Órdenes de producción"';
    EntityName = 'productionorders';
    EntitySetName = 'productionorders';
    QueryType = API;

    elements
    {
        dataitem(productionorder; "Production Order")
        {
            column(id; SystemId)
            {
            }
            column(codigoof; "No.")
            {
            }
            column(estado; "Status")
            {
            }
            column(codigoarticulo; "Source No.")
            {
            }
            column(descripcionarticulo; Description)
            {
            }
            column(maquina; "Description 2")
            {
            }
            column(cantidad; Quantity)
            {
            }
            column(velocidadteorica; "Description 2")
            {
            }
            column(ancho; "Description 2")
            {
            }
            column(largo; "Description 2")
            {
            }
            column(material; "Description 2")
            {
            }
            column(codigopedido; "Description 2")
            {
            }
            column(lote; "Description 2")
            {
            }
            column(fechavencimiento; "Due Date")
            {
            }
        }
    }
}