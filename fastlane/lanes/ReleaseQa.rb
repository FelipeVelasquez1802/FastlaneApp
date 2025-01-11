desc "Check QA branch"
lane :check_qa_branch do
    begin
        sh("git fetch")
        sh("git checkout qa")
        UI.success("QA branch is checked")
    rescue => exception
        UI.error("QA branch is not checked")
        UI.error(exception)
    end
end