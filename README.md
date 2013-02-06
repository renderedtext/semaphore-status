# Semaphore::Status

Command-line interface for checking projects status on Semaphore.

## Installation

    $ gem install semaphore-status

## Usage
  
  To set authentication token first time you must run `"sst -t \'_your_token_\'"`.
  After that you can simply call "sst" or provide name of project which status you want to see, like "sst <project_name>".

  In interactive mode you will see live status of your build (updates every 5sec).
```
  - sst                     - Show build status for all projects
  - sst <project_name>      - Show build status for project with name <project_name>
  - sst -i                  - Run Semaphore-status in interactive mode for all projects
  - sst -i <project_name>   - Run Semaphore-status in interactive mode for project with name <project_name>
  - sst -t <your_token>     - Sets authentication token
  - sst -h                  - Shows help
```


##  Options:

```
    -i    Interactive mode
    -t    Set authentication token
    -h    Print this help
```
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
