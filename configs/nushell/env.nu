$env.ANDROID_HOME = ($env.HOME | path join "Android" "Sdk")

$env.PATH = ($env.PATH
  | append ($env.ANDROID_HOME | path join "emulator")
  | append ($env.ANDROID_HOME | path join "platform-tools")
  | append ($env.ANDROID_HOME | path join "tools")
  | append ($env.ANDROID_HOME | path join "tools" "bin")
)