module ViewHelper
    def static_path_url(static_file)
        "#{request.scheme}://#{settings.site_assets}#{static_file}"
    end
end