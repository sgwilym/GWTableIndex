# GWTableIndex
It's easy enough to give your UITableView a navigation index like the one found in iOS' Contacts app, but if you'd like a little more customisation — like custom icons instead of initials, for example — you're out of luck. What to do?!

GWTableIndex helps you make a UITableView Index where:
- Each navigation item can be represented with an initial or 15x15pt icon
- Each navigation item can be sorted into seperate groups
- Each group can be given a decorative 15x15pt icon as a header

Have your UITableView's datasource implement GWTableIndexDataSource and GWTableIndexDelegate protocol methods, and you're good to go. Still plenty of room for improvement!