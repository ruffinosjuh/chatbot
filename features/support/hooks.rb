

Before do 
Capybara.current_session.driver.browser.manage.delete_all_cookies
  page.reset_session!
  Capybara.current_session.driver.quit
  @login = LoginPage.new
  #current_window.resize_to(1920, 1080)
  current_window.maximize
end
After do |scenario|
  Dir.mkdir("data") unless Dir.exist?("data")
  sufix = ("error" if scenario.failed?) || "success"
  name = scenario.name.tr(" ", "_").downcase
  image_name = "data/img/#{sufix}-#{name}.png"
  temp_shot = page.save_screenshot(image_name)
  embed(temp_shot, "image/png", "Clique aqui para ver a evidência!")
  # Set reset session hook
  page.execute_script("sessionStorage.clear()")
end

at_exit do
    time = Time.now
    data = time.strftime("%d/%m/%Y") #=> "Data 04/09/2011"
    hora = time.strftime("at %I:%M%p") #=> "08:56AM"
    ReportBuilder.configure do |config|
      config.input_path = "data/report.json"
      config.report_path = "data/cucumber_web_report_e2e"
      config.report_types = [:html]
      config.color = "indigo"
      config.report_tabs = %w[Overview Features Scenarios Errors]
      config.report_title = "Automação de Testes - Report"
      config.compress_images = true
      config.additional_info = { "Trilha 3" => "Academia QA", "Funcionalidade" => "Chatbot Unimed Santos", "Canal/Ambiente" => "Unimed Santos", "Data de execução" => "#{data}" " #{hora}", "QA" => "Anna Julia" }
    end
    ReportBuilder.build_report
  end