terraform {
  
required_providers {
terratowns= {
  source = "local.providers/local/terratowns"
  version = "1.0.0"
}  
}
}
provider "terratowns" {
  endpoint = "http://localhost:4567/api"
  user_uuid="e328f4ab-b99f-421c-84c9-4ccea042c7d1" 
  token="9b49b3fb-b8e9-483c-b703-97ba88eef8e0"
  
}
# module "terrahouse_aws"{
#   source = "./modules/terrahouse_aws"
#   user_uuid = var.user_uuid
#   bucket_name = var.bucket_name
#   index_html_filepath = var.index_html_filepath
#   error_html_filepath = var.error_html_filepath
#   content_version = var.content_version
#   assets_path = var.assets_path
# }

resource "terratowns_home" "home" {
  name = "How to win at warcraft 3 ROC"
  description = <<DESCRIPTION
Warcraft III is a real-time strategy game developed by Blizzard Entertainment. It was released in 2002 and is set in the high fantasy universe of Warcraft. The game features four playable factions: Humans, Orcs, Undead, and Night Elves, each with unique units and abilities. Players must gather resources, build bases, and command armies to defeat their opponents. Warcraft III introduced several innovative features, including hero units with RPG-like progression and a powerful map editor that spawned the popular custom game scene. The game is highly regarded for its deep gameplay, compelling story, and influential impact on the strategy genre.
DESCRIPTION
  #domain_name = module.terrahouse_aws.cloudfront_url
  domain_name = "abc123.cloudfront.net"
  town = "gamers-grotto"
  content_version = 1
}
