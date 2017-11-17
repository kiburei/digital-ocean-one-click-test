ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end

      column do
        panel "Recent Facilities" do
          ul do
            Facility.last(5).map do |facility|
              li link_to(facility.name, admin_facility_path(facility))
            end
          end
        end
      end

      column do
        panel "Recent Bookings" do
          ul do
            Booking.last(5).map do |booking|
              li link_to(booking.facility.name, admin_booking_path(booking))
            end
          end
        end
      end

    end
  end # content
end
