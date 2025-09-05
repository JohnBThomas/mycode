terraform { 
  cloud { 
    
    organization = "JBT" 

    workspaces { 
      name = "my-example" 
    } 
  } 
}
