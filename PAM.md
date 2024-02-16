# PAM : Pluggable Authentication Modules
- Provides dynamic authentication support that sits between Linux applications and the Linux native authentication system
- Main purpose is to allow system administrators to integrate services or programs with different authentication mechanisms without changing the code for the service.

### Configuration
- You can put everything in the /etc/pam.conf file.
- Or you can split the configuration by service in the directory /etc/pam.d
- /etc/pam.conf will be ignored if /etc/pam.d directory exists.
- If a service does not have a config file then it will use /etc/pam.d/other

### Logging
- /var/log/messages
- var/log/secure

## PAM File Configuration
**First Column**  : Management Group [Module Interface, Module Type]
**Second Column** : Control Flags - How behavior should be handled. Instructions. 'This has to pass before you do that' or 'If that does not work, go through this'.
**Third Column**  : Module (SO Files) used. Located in /lib/security or /lib64/security.
**Fourth Column** : Arguments for the modules.

### Module Interface or Type (first column). 4 Types. These must always be in the following sequence.
- **Authentication** or **Auth** : Verifies the Users Identity.
  - E.g. : Username/Password = OK
- **Account** : Checks the specified account is valid. 
  - E.g. : User Account = Enabled, Not locked, Not expired, Allowed to login at this time, has service access.
- **Password** : Responsible for updating password. Enforce strong passwords.
  - E.g. : Password Update = Only when password is changed, enforces password policies like pw length, retries, etc.
- **Session** : Manages actions performed at beginning and end of session.
  - E.g. : Establish session, making sure home directory is created if needed, setting up user environments, etc.

### Control Flags (second column). 4 Main Control Flags. They need to be in the following sequence.
- **Requisite** : Strongest. If this fails then PAM will return to the calling application and report the failure.
- **Required** : If failure, execution is not stopped but continues to the next module. If, after all of the modules have been executed, or or more has failed, PAM will return failure to the calling application.
- **Sufficient** : If it returns OK, the processing of modules will be stopped.
- **Optional** : In case of failure, the stack of modules continues to execution and the return code is ignored.
Also:
- **include** : Include all lines of given type from the configuration file specified as an argument to this control.
  - E.g. : @include common-auth
- **substack** : Same as include.

### Modules (third colum)
- PAM loadable object files (modules) located at /lib/security or /lib64/security
- Most modules are pre-built and pre-installed. New modules can be written based on an application need.
- Main module is pam_unix.so which is responsible to verify authentication. You can use the man pages for so files (.so not required when searching)