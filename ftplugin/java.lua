local is_work, work_jdtls = pcall(require, "work.jdtls")
if not is_work or not work_jdtls.setup() then require("lspconfig").jdtls.setup() end
