municipios_sp_raw <-
  xml2::read_html("https://sigrh.sp.gov.br/municipios") |>
  rvest::html_table(header = TRUE) |>
  purrr::pluck(3) |>
  janitor::clean_names()

# Limpeza
municipios_sp <- municipios_sp_raw |>
  dplyr::mutate(
    n_ugrhi = stringr::str_extract(ugrhi,  "[0-9]{2}"),
    sigla_comite = stringr::str_remove(cbh, "CBH-"),
    sigla_comite = stringr::str_to_lower(sigla_comite),
    n_ugrhi = dplyr::case_when(
      sigla_comite == "ps" ~ 02,
      sigla_comite == "tj" ~ 13,
      TRUE ~ as.double(n_ugrhi)
    ),
    uf = "SP",
    municipio = dplyr::case_when(
      municipio == "Embu" ~ "Embu das Artes",
      municipio == "Arco Íris" ~ "Arco-Íris",
      municipio == "Santana do Parnaíba" ~ "Santana de Parnaíba",
      TRUE ~ municipio
    )
  ) |>
  dplyr::arrange(n_ugrhi)

municipios_por_ugrhi <- municipios_sp |>
  munifacil::limpar_colunas(col_muni = municipio, col_uf = uf) |>
  munifacil::incluir_codigo_ibge() |>
  dplyr::select(municipio, id_municipio, n_ugrhi)

usethis::use_data(municipios_por_ugrhi, overwrite = TRUE)
