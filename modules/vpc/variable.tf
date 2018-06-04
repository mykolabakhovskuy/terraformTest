variable protocol{
description = "Protocol for firewall"
}
variable ports{
description = "Allow ports for firewall"
type = "list"
}
variable name{
description = "Name for you VPC network"
default = "test"
}
variable namefirewall{
default = "testfirewall"
}

