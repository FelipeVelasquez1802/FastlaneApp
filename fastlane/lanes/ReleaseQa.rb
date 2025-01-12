desc "Check QA branch"
lane :check_qa_branch do
    begin
        sh("git fetch")
        sh("git checkout qa")
        UI.success("QA branch is checked")
    rescue => exception
        UI.user_error!("QA branch is not checked")
        UI.user_error!(exception)
    end
end

def get_gradle_property(property_key, gradle_properties_path)
    properties = File.read(gradle_properties_path)
    property_line = properties.split("\n").find { |line| line.strip.start_with?("#{property_key}=") }
    property_line ? property_line.split('=', 2).last.strip : ""
end

def update_gradle_property(property_key, new_value, gradle_properties_path)
    properties = File.read(gradle_properties_path)
    updated_properties = properties.split("\n").map do |line|
        line.strip.start_with?("#{property_key}=") ? "#{property_key}=#{new_value}" : line
    end

    unless updated_properties.any? { |line| line.start_with?("#{property_key}=") }
        updated_properties << "#{property_key}=#{new_value}"
    end

    File.write(gradle_properties_path, updated_properties.join("\n"))
end

desc "Increment the version code and version name"
lane :increment_version do
    gradle_properties_path = "../gradle.properties"

    version_name_key = "versionName"
    current_version_name = get_gradle_property(version_name_key, gradle_properties_path)
    new_version_name = prompt(
        text: "Enter the new version name (Current version is #{current_version_name}):",
        ci_input: current_version_name
    )
    update_gradle_property(version_name_key, new_version_name, gradle_properties_path)

    bundle_version_key = "bundleVersion"
    current_bundle_version = get_gradle_property(bundle_version_key, gradle_properties_path)
    new_bundle_version = prompt(
        text: "Enter the new bundle version (Current bundle is #{current_bundle_version}):",
        ci_input: current_bundle_version
    )
    update_gradle_property(bundle_version_key, new_bundle_version, gradle_properties_path)

    UI.success("Version name updated to #{new_version_name}")
    UI.success("Bundle version updated to #{new_bundle_version}")
end

desc "Create a new branch with the name of the version"
lane :create_release_qa_branch do
    version_name = get_gradle_property("versionName", "../gradle.properties")
    bundle_version = get_gradle_property("bundleVersion", "../gradle.properties")
    sh("git checkout -b release-qa/#{version_name}-#{bundle_version}")
end

desc "Add all changes to the branch"
private_lane :add_changes do
    git_add
end

desc "Commit the changes to the branch"
private_lane :commit_changes do |options|
    version_name = options[:version_name]
    bundle_version = options[:bundle_version]
    git_commit(
        path: ".",
        message: "Release QA #{version_name}-#{bundle_version}"
    )
end

desc "Push the branch to the remote"
lane :push_release_qa_branch do |config|
    add_changes
    version_name = get_gradle_property("versionName", "../gradle.properties")
    bundle_version = get_gradle_property("bundleVersion", "../gradle.properties")
    commit_changes(version_name: config['version_name'], bundle_version: config['bundle_version'])
    git_url = "https://#{config['git_domain']}/#{config['git_remote']}"
    branch_name = "release-qa/#{version_name}-#{bundle_version}"
    push_to_git_remote(
        remote: git_url,
        local_branch: branch_name,
        remote_branch: branch_name,
        force: true,
        tags: false
    )
end