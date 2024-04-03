# Environment to build jupyter RISE slides

In this repo, you find a RISE template consisting of 

* two columns
* lists
* manim animation
* fragments
* subslides
* notes
* hidden input cells
* highlights

Please find more slide examples at [my lecture notes repo](https://github.com/thomasliebig/jupyterlite)

## Initialization

Build virtual machine

```bash
vagrant up
```

Take snapshot of the virtual machine

```bash
vagrant snapshot save jupyter
```

## Start of the Session

```bash
vagrant snapshot restore jupyter
```

* point your browser to http://localhost:8000/ or http://localhost:8000/notebooks/Template.ipynb for a slide template to get started

## End of the Session

```bash
vagrant halt
```

## Reprovision (In case something went wrong)

```bash
vagrant provision
```

