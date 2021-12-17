# FreeDNS Updater
FreeDNS Updater is a Docker container for keeping afraid.org FreeDNS up to date with your current IP address.

The app will update your FreeDNS domains to the public IP address of the server running the container.

Includes example docker-compose.yml

## Installation
Before starting, get your randomized update tokens from the [FreeDNS Dynamic Update Interface v2](https://freedns.afraid.org/dynamic/v2/).
* Go to the update interface, select "Randomized Update Token" from the style types.
* Choose the domains that you would like to keep dynamically updated by checking the boxes to the left of the domain, and Applying the Enable Dynamic DNS option.
* Copy the Randomized Update Tokens from the generated urls in the table. The urls will be in the form http://sync.afraid.org/u/{{token}}/

To install the container
* Copy the included example docker-compose.yml file into a directory.
* Replace the example Randomized Update Tokens with your own in the new docker-compose.yml file.
* use docker-compose in terminal to bring up the container.
```bash
docker-compose up -d
```

## License
[GNU GPLv3](https://www.gnu.org/licenses/)
