desc "Clean the project"
lane :clean do
    gradle(task: "clean")
end

desc "Build the app"
lane :build do
    gradle(task: ":presentation:assembleDebug")
end

desc "Runs all the tests"
lane :test do
    gradle(task: ":presentation:testDebugUnitTest")
end

desc "Lint the app"
lane :lint do
    gradle(task: "ktlintFormat")
    gradle(task: "ktlintCheck")
end