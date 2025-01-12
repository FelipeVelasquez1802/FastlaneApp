desc "Clean the project"
lane :clean do
    gradle(task: "clean")
end

desc "Build the app"
lane :build do |options|
    buildType = options[:build_type] || "debug"
    gradle(task: ":presentation:assemble#{buildType}")
end

desc "Runs all the tests"
lane :test do
    gradle(task: ":domain:test")
end

desc "Lint the app"
lane :lint do
    gradle(task: "ktlintFormat")
    gradle(task: "ktlintCheck")
end