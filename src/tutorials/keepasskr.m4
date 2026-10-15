divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Using KeePassXC as the Linux Desktop Keyring])
define([iwz_section], [tutorials])
divert(0)include([header.m4])

iwz_sect([Introduction])

iwz_p([Rather than using gnome-keyring or kwallet, it's possible to use KeePassXC as your system keyring. Why would you want to do this? It's more secure and convenient than any of the aforementioned services, because:])

iwz_list(
   iwz_li([You can synchronize one keyring between multiple computers using e.g. SyncThing!])
   iwz_li([You can use a hardware token like a YubiKey to secure the keyring!])
   iwz_li([You can configure it to display a dialog and ask whenever something asks for a credential!])
)

iwz_p([In theory, you can also use it to store browser passwords, but we use VaultWarden for this and a flatpak-sandboxed browser, so this is outside of the scope of this article. Regardless, hopefully this can help you make your desktop and scripts much more secure without an undue amount of inconvenience.])

iwz_p([This article was developed on Debian GNU/Linux. An attempt was made to get this working on NetBSD 11, but the included KeePassXC port does not seem to include Secret Service integration, and the YubiKey seems to not currently be functional on NetBSD.])

iwz_sect([Setting Up a YubiKey])

iwz_p([Before setting up KeePassXC, you can setup your YubiKey to enable an additional layer of security, if you have one. This isn't required, but it's nice to have! On Debian: ])

iwz_diff(
   [],
   iwz_diffl([x], [], [sudo apt install yubikey-manager-qt])
)

<!--
iwz_p([Or, on NetBSD:])

iwz_diff(
   [],
   iwz_diffl([x], [], [sudo pkgin install yubikey-manager-qt])
)
-->

iwz_p([Once the YubiKey Manager is installed, ensure your YubiKey is plugged in and open YubiKey Manager from your applications menu.])

iwz_list([
   iwz_li([In the YubiKey Manager window, select the iwz_func(Applications) menu and, from there, select iwz_func(OTP).])
   iwz_li([Select the iwz_func(Configure) button under iwz_func(Long Touch (Slot 2)).])
   iwz_li([Select iwz_func(Challenge-response) and click iwz_func(Next).])
   iwz_li([Click the iwz_func(Generate) button next to the iwz_func(Secret key) field to generate a key. You can also uncheck the iwz_func(Require touch) checkbox here if you would just like the keyring to require the presence of the YubiKey in a USB port, but not actually require interaction to unlock. This is justifiable if you use a password as well, but the choice is up to you. Click iwz_func(Finish) when you're done.])
])

iwz_p([You can close YubiKey Manager after this.])

iwz_sect([Disabling GNOME Keyring])

iwz_p([You may wish to purge iwz_filename(gnome-keyring) so that it does not start on login. KDE Wallet may similarly interfere, but on our test system it does not start itself automatically, the way GNOME keyring does, and removing it also removings other KDE programs. Your Mileage May Vary. In theory, this should be as simple as:])

iwz_diff(
   [],
   iwz_diffl([x], [], [sudo apt purge gnome-keyring])
)

iwz_p([Depending on your distribution and desktop environment, you may have to resort to more... dramatic means. As a rough example:])

iwz_diff(
   [],
   iwz_diffl([x], [], [sudo systemctl --global disable gnome-keyring-daemon.service])
   iwz_diffl([x], [], [sudo systemctl --global disable gnome-keyring-daemon.socket])
   iwz_diffl([x], [], [systemctl --user stop gnome-keyring-daemon.socket])
   iwz_diffl([x], [], [systemctl --user stop gnome-keyring-daemon.service])
)

iwz_sect([Setting Up a KeePassXC Database])

iwz_p([Obviously, KeePassXC must be installed. For example, to do this on Debian, use:])

iwz_diff(
   [],
   iwz_diffl([x], [], [sudo apt install keepassxc-full])
)

<!--
iwz_p([To install it on NetBSD, try:])

iwz_diff(
   [],
   iwz_diffl([x], [], [sudo pkgin install keepassxc])
)
-->

iwz_p([When KeePassXC is installed, open it select the iwz_func(New Database) option from iwz_func(Database) menu to begin the database creation process:])

iwz_list([
   iwz_li([The optimal parameters for encryption are probably variable as time goes on, so the defaults are probably fine. Click iwz_func(Continue) when you are done.])
   iwz_li([Enter a sufficiently long password and click iwz_func([Add Additional Protection]) button.])
   iwz_li([If you have a iwz_a_anchor([#Setting-Up-a-YubiKey], [YubiKey]), click the iwz_func([Add Challenge-Response]) button and then select your YubiKey from the drop-down that appears.])
   iwz_li([Finally, click the iwz_func(Done) button.])
])

iwz_sect([Setting Up KeePassXC Keyring Integration])

iwz_img(
   [/images/keepasskr/kpsettingsssi.png],
   [Screenshot of the KeePassXC settings window Secret Service Integration dialog with the following steps highlighted by number.])

iwz_olist([
   iwz_li([Open the the iwz_func(Settings) item on the iwz_func(Tools) menu in KeePassXC, or the iwz_func(Settings) button.])
   iwz_li([Select the iwz_func([Secret Service Integration]) on the left bar in the options window (you may need to scroll down to see it).])
   iwz_li([Enable secret service integration with the labelled checkbox. If there is an error indicating that a keyring is running, iwz_a_anchor([#Disabling-GNOME-Keyring], [This must be resolved, first]).])
   iwz_li([Here, too, is where you may opt to iwz_func(Confirm When Passwords Are Retrieved By Clients).])
   iwz_li([Click on the pencil icon under iwz_func([Exposed Database Groups]).])
])

iwz_img(
   [/images/keepasskr/kpsettingsdbssi.png],
   [Screenshot of the KeePassXC database settings window Secret Service Integration dialog with the following steps highlighted by number.])

iwz_p([At this point, the window will change to a very-similar-yet-distinct settings dialog for your database.])

iwz_olist([
   iwz_li([Again, select the iwz_func([Secret Service Integration]) on the left bar.])
   iwz_li([Select the iwz_func([Expose Entries Under This Group]) radio button.])
   iwz_li([Select the folder in the database to expose as the keyring service.])
])

iwz_sect([Using The Keyring With Scripts])

iwz_p([This section should work with any keyring service and without using KeePassXC, specifically, but we include it here for completeness as many may not be aware.])

iwz_p([Do you hard-code passwords into scripts? Does this feel icky? There is a solution: keep the password in the keyring and have the script ask the keyring when it needs it! This is possible with iwz_filename(python-keyring) and iwz_filename(libsecret). On debian, these are found in these packages:])

iwz_diff(
   [],
   iwz_diffl([x], [], [sudo apt install python3-keyring libsecret-1-0])
)

<!--
iwz_p([Or, on NetBSD:])

iwz_diff(
   [],
   iwz_diffl([x], [], [sudo pkgin install py313-keyring libsecret])
)
-->

iwz_p([Here is a rough example of the pattern to retrieve a password from the keyring in a shell script (in this case, to provide the password to encfs):])

iwz_diff(
   [],
   iwz_diffl([x], [], [# Make an attempt to get the password for dest_dir.])
   iwz_diffl([x], [], [_pw="`keyring get encfs $_dest_dir`"])
   iwz_diffl([x], [], [if [ -z "$_pw" ]; then])
   iwz_diffl([x], [], [   # No password was found in the keyring. Make one!])
   iwz_diffl([x], [], [   keyring set encfs $_dest_dir])
   iwz_diffl([x], [], [   # Grab the password that was just entered.])
   iwz_diffl([x], [], [   _pw="`keyring get encfs $_dest_dir`"])
   iwz_diffl([x], [], [fi])
   iwz_diffl([x], [], [# Mount the encfs directory using the password.])
   iwz_diffl([x], [], [echo "$_pw" | encfs -S $_src_dir $_dest_dir])
)

iwz_p([Of course, libsecret is a C library, so you can also retrieve passwords in a C program you write with something like:])

iwz_diff(
   [],
   iwz_diffl([x], [], [[#include <libsecret/secret.h>]])
   iwz_diffl([x], [], [[/* Setup a schema to use with libsecret. */]])
   iwz_diffl([x], [], [[static const SecretSchema schema = {]])
   iwz_diffl([x], [], [[   "com.example.program",]])
   iwz_diffl([x], [], [[   SECRET_SCHEMA_NONE,]])
   iwz_diffl([x], [], [[   {]])
   iwz_diffl([x], [], [[      { "account", SECRET_SCHEMA_ATTRIBUTE_STRING },]])
   iwz_diffl([x], [], [[      { NULL, 0 }]])
   iwz_diffl([x], [], [[   }]])
   iwz_diffl([x], [], [[};]])
   iwz_diffl([x], [], [[ ]])
   iwz_diffl([x], [], [[/* Simple function to get a password from the vault. */]])
   iwz_diffl([x], [], [[char* use_password( char* account ) {]])
   iwz_diffl([x], [], [[   /* Lookup the password for account synchronously. */]])
   iwz_diffl([x], [], [[   char *password = secret_password_lookup_sync(]])
   iwz_diffl([x], [], [[      &schema, NULL, &error, "account", account, NULL );]])
   iwz_diffl([x], [], [[   if( password ) {]])
   iwz_diffl([x], [], [[      /* We found a password, so return it! */]])
   iwz_diffl([x], [], [[      return password;]])
   iwz_diffl([x], [], [[   } else {]])
   iwz_diffl([x], [], [[      /* No password, so ask for one! */]])
   iwz_diffl([x], [], [[      password = prompt_for_password(parent);]])
   iwz_diffl([x], [], [[   }]])
   iwz_diffl([x], [], [[   if( !password ) {]])
   iwz_diffl([x], [], [[      /* No password even after asking... */]])
   iwz_diffl([x], [], [[      return NULL;]])
   iwz_diffl([x], [], [[   }]])
   iwz_diffl([x], [], [[   /* Store the password we asked for! */]])
   iwz_diffl([x], [], [[   secret_password_store_sync(]])
   iwz_diffl([x], [], [[      &schema, SECRET_COLLECTION_DEFAULT, "Example Password",]])
   iwz_diffl([x], [], [[      password, NULL, &error, "account", "default", NULL );]])
   iwz_diffl([x], [], [[}]])
)

iwz_p([This is a *very* stripped-down example, with no error checking or prompt implementation (something that would go into the you-provided iwz_func(prompt_for_password()), but hopefully it gives an idea of the process. More information can be found in the iwz_a([https://gnome.pages.gitlab.gnome.org/libsecret/], [libsecret documentation]).])

iwz_p([When combined with using KeePassXC for the keyring, either of these should cause KeePassXC to display a dialog box, prompting you to allow or deny access to the requested password. This provides the convenience of not having to enter the password every time with a modicum of security by letting you know when something requests it.])



include([footer.m4])

