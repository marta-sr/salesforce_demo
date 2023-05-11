connection: "salesforce"
include: "/views/**/*.view"


datagroup: salesforce_demo_marta_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: salesforce_demo_marta_default_datagroup



explore: opportunity {
  join: contact {
    type: left_outer
    sql_on: ${opportunity.contact_id} = ${contact.id} ;;
    relationship: many_to_one
  }

  join: account {
    type: left_outer
    sql_on: ${contact.account_id} = ${account.id} ;;
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
