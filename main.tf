terraform {
  
required_providers {
terratowns= {
  source = "local.providers/local/terratowns"
  version = "1.0.0"
}  
}
}
provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid= var.teacherseat_user_uuid
  token=var.terratowns_access_token
  
}
module "terrahouse_aws"{
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  bucket_name = var.bucket_name
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
}
resource "terratowns_home" "home" {
  name= "how to win in Warcraft 3"
  description = <<DESCRIPTION
    Warcraft III is a real-time strategy game developed by Blizzard Entertainment. It was released in 2002 and quickly became a classic in the genre. The game combines intricate strategy, resource management, and tactical combat set in the world of Azeroth. Players can choose to command one of four factions, each with unique units and abilities, and engage in single-player campaigns or multiplayer battles. Warcraft III is known for its engaging storytelling, memorable characters, and the introduction of the "Hero" unit concept, which greatly influenced the genre. It also features a powerful map editor that enabled the creation of custom games, leading to the birth of the popular multiplayer online battle arena (MOBA) genre.
  DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  # domain_name = "abcd1234.cloudfront.net"
  town = "missingo"
  content_version = 1
}
