resource "azurerm_servicebus_namespace" "sbn" {
  name                = var.asb_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.sku
  tags                = var.tags
}

resource "azurerm_servicebus_topic" "topics" {
  for_each = { for topic in var.topics : topic => topic }

  name         = each.key
  namespace_id = azurerm_servicebus_namespace.sbn.id
}

resource "azurerm_servicebus_queue" "queues" {
  for_each     = { for queue in var.queues : queue => queue }

  name         = each.key
  namespace_id = azurerm_servicebus_namespace.sbn.id
}

#resource "azurerm_servicebus_subscription" "subscriptions" {
  #for_each = {
    #for sub in var.subscriptions :
    #"${sub.topic}-${sub.name}" => sub
  #}

  #name               = each.value.name
  #topic_id           = azurerm_servicebus_topic.topics[each.value.topic].id
  #max_delivery_count = each.value.max_delivery_count
#}



#resource "azurerm_servicebus_topic_subscription_rule" "rules" {
  #for_each = {
    #for rule in var.subscription_rules :
    #"${rule.subscription}-${rule.name}" => rule
  #}

  #name                = each.value.name
  #rule_type           = each.value.rule_type
  #subscription_name   = each.value.subscription
  #topic_name          = each.value.topic
  #namespace_name      = azurerm_servicebus_namespace.sbn.name
  #resource_group_name = var.resource_group_name
  #filter_type         = each.value.filter_type
  #sql_filter          = each.value.sql_filter
#}
