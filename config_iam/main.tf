
module "iam_config" {
  source = "./modules/iam_config"


  # --------------#
  # Role Name #
  #----------------#

role_name = ["MyfirstRole","MysecondRole","MythirdRole","BigqueryRole"]

# --------------#
# Title Name #
#----------------#

titre_name = ["Myfirsttitre","Mysecondtitre","Mythirdtitre","Bigquery Role"]

  # --------------#
  # List of type authorization #
  #----------------#
 // Respectez scrupuleusement cet ordre
  authorization = [

     ["iam.roles.list","iam.roles.create","iam.roles.delete"], // root authorization
     ["iam.roles.list", "iam.roles.create"],  // owner authorization
     ["iam.roles.list"],  // viewer authorization
     ["bigquery.jobs.list","bigquery.jobs.get","bigquery.connections.list","bigquery.datasets.create"] // bigquery authorization
  ]

  # --------------#
  # match role with users #
  #----------------#
  role_binding = [
   // root users authorization
     ["user:abdulrahim@gmail.com",

       "user:helene.patrigeon@easyence.com"],
  // owner users authorization
     ["user:franck.junior.tchounzou@easyence.com",
       "user:rouambabrahima1@gmail.com"
        ],
  // viewer users authorization
     ["user:barry2abdulrahim@gmail.com",
       "user:marianne.vannini@easyence.com"
     ],
 // Bigquery users authorization
     ["user:clement.tricart@ysance.com"]
  ]

}
