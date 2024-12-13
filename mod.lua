function data()
    return {
        info = {
            minorVersion = 0,
            severityAdd = "NONE",
            severityRemove = "WARNING",
            name = _("mod_name"),
            description = _("mod_desc"),
            authors = {
                {
                    name = "ModWerkstatt",
                    role = "CREATOR",
                },
            },
            params = {
                {
                    key = "snps_fake",
                    name = _("snps_fake"),
                    values = {_("yes"), _("no")},
                    defaultIndex = 0,
                },
            },
            tags = { "europe", "waggon", "sbb", "db", "germany", "switzerland", "flatrack" },
            tfnetId = {},
            minGameVersion = 0,
            dependencies = {},
            url = { "" },
        },

        options = {},

        runFn = function(settings, modParams)
            local params = modParams[getCurrentModId()]

            local function excludeFolderFilter_fake(fileName, data)
                print(fileName)
                if fileName:match("/Snps719/fake/") then
                    return false
                end
                return true
            end

            if modParams[getCurrentModId()] ~= nil then
                local params = modParams[getCurrentModId()]
                -- zugschluss
                if params["snps_fake"] == 1 then
                    addFileFilter("model/vehicle", excludeFolderFilter_fake)
                end
            else
                addFileFilter("model/vehicle", modelFilter)
            end
        end
    }
end
