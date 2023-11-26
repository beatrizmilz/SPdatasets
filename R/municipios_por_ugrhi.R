#' Municípios por UGRHI
#'
#' @description
#' Apresenta dados sobre os municípios que compõem cada Unidade de Gerenciamento
#' de Recursos Hídricos (UGRHI).
#' Dados extraídos do Portal SigRH-SP, arrumados e disponibilizados para uso.
#' Dados extraídos usando raspagem de dados, em 26/11/2023.
#'
#' @format ## `municipios_por_ugrhi`
#' Uma tibble com 645 observações e 3 colunas:
#' \describe{
#'   \item{municipio}{Nome do município}
#'   \item{id_municipio}{Código IBGE do município}
#'   \item{n_ugrhi}{Número da UGRHI}
#'   ...
#' }
#' @source <https://sigrh.sp.gov.br/municipios>
"municipios_por_ugrhi"
