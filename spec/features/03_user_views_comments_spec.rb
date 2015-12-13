require "spec_helper"

feature "user views comments" do
  scenario "see name of vacation on vacation destination show page" do
    db_connection do |conn|
      sql_query_1 = "INSERT INTO vacations (destination) VALUES ($1)"
      data_1 = ["toronto"]
      conn.exec_params(sql_query_1, data_1)
    end

    binding.pry
    visit "/vacations"
    click_link "toronto"

    expect(page).to have_content("toronto")
  end

  scenario "see comments on vacation destination show page" do
    db_connection do |conn|
      sql_query_1 = "INSERT INTO vacations (destination) VALUES ($1)"
      data_1 = ["toronto"]
      conn.exec_params(sql_query_1, data_1)

      sql_query_2 = "SELECT * FROM vacations WHERE destination = $1"
      data_2 = ["toronto"]
      vacation_id = conn.exec_params(sql_query_2, data_2).first["id"]

      sql_query_3 = "INSERT INTO comments (body, vacation_id) VALUES ($1, $2)"
      data_3 = ["i heart metropolises, eh?", vacation_id]
      conn.exec_params(sql_query_3, data_3)
    end

    visit "/vacations"
    click_link "toronto"

    expect(page).to have_content("i heart metropolises, eh?")
  end
end
