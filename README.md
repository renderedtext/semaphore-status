# Semaphore-status

Command-line interface for checking projects status on Semaphore.

## Installation

```
  $ gem install semaphore-status
```

## Usage
  
  Running 'sst' in project repository that is on Semaphore, Semaphore-status will list only that project, otherwise sst will list you all projects you have on Semaphore.
  To list all projects in any directorium, simply provide flag -a 'sst -a'.

  To check only one project, you can provide project name like 'sst <project_name>'.

  Semaphore-status have interactive mood, in which you can see live status of your build (refresh rate 5sec).

  To change authentication token you run 'sst -t <your_token_>'.

  Running 'sst' in interactive mode you will see live status of your build (updates every 5sec).

```
  sst                     - Show build status for projects in which repo you are (otherwise shows all projects)
  sst <project_name>      - Show build status for project with name <project_name>
  sst -a                  - Show all projects
  sst -i                  - Interactive mode
  sst -i <project_name>   - Run Semaphore-status in interactive mode for project with name <project_name>
  sst -t <your_token>     - Sets authentication token
  sst -h                  - Shows help
```


##  Options:

```
  -i    - Interactive mode
  -a    - All projects
  -t    - Set authentication token
  -h    - Prints help
```

## Screenshots

![semaphore status first run](https://dl.dropbox.com/u/5802579/semaphore-status-1.png '')
![semaphore status usage](https://dl.dropbox.com/u/5802579/semaphore-status-2.png '')

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

Semaphore-status is released under the MIT License.
Developed by [rastasheep](https://github.com/rastasheep).