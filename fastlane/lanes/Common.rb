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

def get_gradle_property(property_key, gradle_properties_path)
    properties = File.read(gradle_properties_path)
    property_line = properties.split("\n").find { |line| line.strip.start_with?("#{property_key}=") }
    property_line ? property_line.split('=', 2).last.strip : ""
end