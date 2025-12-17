--- Return environment variables for the tool
--- @param ctx table Context information
--- @field ctx.path string SDK installation directory
--- @return table Environment variables

local file = require("file")

function PLUGIN:EnvKeys(ctx)
    local version_path = ctx.path

    -- The SDK is in a google-cloud-sdk subdirectory
    local sdk_path = file.join_path(version_path, "google-cloud-sdk")
    local bin_path = file.join_path(sdk_path, "bin")

    return {
        {
            key = "PATH",
            value = bin_path,
        },
        {
            key = "CLOUDSDK_ROOT_DIR",
            value = sdk_path,
        },
    }
end
