#' Mortality (causes of death) in South African provinces
#'
#' A dataset from Statistics South Africa on causes of death in South African
#' provinces. A number of deaths is reported for a variety of causes (from HIV
#' to diabetes to a total of all deaths) for all provinces in South Africa for
#' the years 2008 to 2013.
#'
#' @format A data frame with 698 rows and 4 variables:
#' \describe{
#'  \item{province}{One of the nine provinces of South Africa: Eastern Cape,
#'  Free State, Gauteng, KwaZulu-Natal, Limpopo, Mpumalanga, North West,
#'  Northern Cape, or Western Cape.}
#'  \item{indicator}{A cause of death as reported by Statistics South Africa.
#'  Some options include "Cerebrovascular diseases (I60-I69)", "Non-natural
#'  causes", and "Influenza and pneumonia (J10-J18)". Not every cause of death
#'  is reported in every province and year.}
#'  \item{year}{The year, from 2008 to 2013.}
#'  \item{deaths}{The number of deaths due to the given cause, in the specified
#'  province and year.}
#' }
#'
#' @source \url{http://southafrica.opendataforafrica.org/cmsybyf/mortality-and-causes-of-death-in-south-africa-2008}
"mortality_zaf"
