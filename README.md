## Data Engineering DBT Project
This project that connects to a Postgres database and builds models for transforming from three tables:

- **new_members:** This table maps past and present members to a cohort. Cohort membership is defined by the month the member joined the program, and the type of product they purchased.


- **subscriptions:** This table catalogs all subscription plans purchased by members.


- **active_members:** This table defines the months for which a member is active, where active is defined by having a successful charge for a qualifying product or program. 

### Database schema:
![Untitled Diagram-3](https://user-images.githubusercontent.com/41656028/230805815-2545dfcc-8ed6-40d5-a337-8c6f07d124d4.png)


### The models are organized into two main directories:

- **staging:** This directory contains models, which bring raw data from the source database and which are used to build more complex and useful models into the project.


- **warehouse:** This directory contains models, which transform the models from the staging layer into more complex and useful models for business use cases.

### Snapshot

The project contains a dbt snapshot on the subscriptions table. Snapshots provide a way to take a point-in-time copy of a table and make it available for use in dbt models. In this project, a snapshot of the subscriptions table was created.

### Limitations/Missing pieces
- Information on the products or programs that define "qualifying" purchases in the active_members table.


- Information on the currency used for charges and subscriptions.


- Information on the geographic location of members. This could be important for analyzing customer behavior and trends in different regions.


- Information on the marketing channels used to acquire new members. This could provide valuable insights into which channels are most effective at attracting and retaining members.


### Getting Started

To run this project, you will need to have dbt installed on your local machine. You can find instructions for installing dbt [here](https://docs.getdbt.com/docs/core/installation).

Once you have dbt installed, you can clone this repo and configure your credentials in the profiles.yml file. The profiles.yml file should include your Postgres database credentials and any other necessary configuration information.


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
