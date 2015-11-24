require "spec_helper"

feature "user views vacation destination list" do
  scenario "sees vacation destinations" do
    db_connection do |conn|
      sql_query = "INSERT INTO vacations (destination) VALUES ($1)"
      data = ["toronto"]
      conn.exec_params(sql_query, data)
    end

    visit "/vacations"
    expect(page).to have_content("toronto")
  end
end
