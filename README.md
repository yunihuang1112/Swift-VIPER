# Swift-VIPER

This is a example for **VIPER** design pattern in Swift 4.

## VIPER 

```mermaid
graph LR
A(View) -- Sends user actions--> B(Presenter)
B -- Update UI --> A
C(Router) -- Navigation between views --> B
B -- User actions or data fetching actoins --> D(Interactor)
D -- Output the data from business logic --> B
D --> E(Entity)
```

- V :  View
	-  Send user actions to the presenter and then show whatever the presenter fetched.
- I :  Interactor
	-  Create use case to handle the business logic.
- P : Presenter
	- Provide the view logic for preparing datas for display, and  reacting to user actions.
- E :  Entity
	- The basic model for objects.
- R :  Router
	- Provide logic for routing views.