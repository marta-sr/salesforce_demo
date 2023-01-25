# Define the database connection to be used for this model.
connection: "salesforce"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: salesforce_demo_marta_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: salesforce_demo_marta_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Salesforce Demo Marta"


explore: opportunity {
  join: contact {
    type: left_outer
    sql_on: ${opportunity.contact_id} = ${contact.jigsaw_contact_id} ;;
    relationship: many_to_one
  }

  join: campaign {
    type: left_outer
    sql_on: ${opportunity.campaign_id} = ${campaign.id} ;;
    relationship: many_to_one
  }
  }
# explore: account {


#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: operating_hours {
#     type: left_outer
#     sql_on: ${account.operating_hours_id} = ${operating_hours.id} ;;
#     relationship: many_to_one
#   }
# }
