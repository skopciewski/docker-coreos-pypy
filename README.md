## coreos-pypy

Based on the [coreos-pypy][coreos-pypy].
Installation of PYPY for CoreOS to get Ansible work.

## Usage

### On CoreOS

```bash
    docker run --rm -v /home/core:/tmp/core_volume skopciewski/coreos-pypy
```

### ansible configuration

```
    ansible_python_interpreter: "LD_LIBRARY_PATH=/home/core/pypy/bin /home/core/pypy/bin/pypy"
```

## Entrypoint

Any params passed to the container are ignored (except `escto`). Entrypoint will:
* copies current verion of PyPy to the mounted volume
* creates symbolic link `pypy` to the current PyPy version
* links `/lib64/libncurses.so.5.9` the the PyPy bin dir

### Escape to

If you want to inspect container, run docker with `escto` as first param:

```bash
    docker run -it --rm -v /home/core:/tmp/core_volume skopciewski/coreos-pypy escto sh
```

[coreos-pypy]: https://github.com/SergeyZh/coreos-pypy
