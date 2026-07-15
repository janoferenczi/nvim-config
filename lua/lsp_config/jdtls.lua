vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
    local root_dir = vim.fs.root(0, root_markers) or vim.fn.getcwd()
    local project_name = vim.fs.basename(root_dir) or "default-workspace"
    local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/workspace/" .. project_name
    local lombok_jar = "/home/jano/develop/tools/lombok.jar"
	local jdtsl_cmd = "/home/jano/develop/tools/jdtls/bin/jdtls"

    vim.lsp.start({
      name = "jdtls",
      cmd = {
		jdtsl_cmd,
        "-data", workspace_dir,
        "--jvm-arg=-javaagent:" .. lombok_jar,
      },
      root_dir = root_dir,
      settings = {
        java = {
          home = "/home/jano/develop/tools/jdk-17.0.19",
          import = {
            generatesMetadataFilesAtProjectRoot = false,
          },
          configuration = {
            runtimes = {
              {
                name = "JavaSE-17",
                path = "/home/jano/develop/tools/jdk-17.0.19",
                default = true,
              },
            },
          },
        },
      },
    })
  end,
})
