
Base perl container with specific CPAN modules installed
for a project.

To add a module to this image, add the module name to 
the modules.txt file.

As good practice, before pushing up a commit to add a
perl module to this image, try that it installs first.

In doppler-dev:

  # make shell
  # cpanm Module::Name

When you exit that shell, your changes will be lost,
but this is how modules are instlled when the image is
built, so you will know right away if there will be 
issues.

