class ApplicationController < ActionController::Base

  def blank_square_form

    render({ :template => "calculation_templates/square_form.html.erb" })

  end

  def calculate_square
    
    @num = params.fetch("number").to_f
    @sqaure_of_num = (@num ** 2)

    render({ :template => "calculation_templates/square_results.html.erb" })

  end

  def blank_square_root_form
    
    render({ :template => "calculation_templates/square_root_form.html.erb"})

  end

  def calculate_square_root

    @user_num = params.fetch("user_number").to_f
    @square_root_of_user_num = Math.sqrt(@user_num)

    render({ :template => "calculation_templates/square_root_results.html.erb"})

  end

  def blank_payment_form

    render({ :template => "calculation_templates/payment_form.html.erb"})

  end

  def calculate_payment

    @apr = params.fetch("user_apr").to_f
    @apr_clean = params.fetch("user_apr").to_f.round(4)
    @apr_yearly_perc = @apr/100
    @apr_monthly_perc = @apr_yearly_perc/12
    @num_years = params.fetch("user_years").to_f
    @periods = @num_years * 12
    @principal = params.fetch("user_pv").to_f
    @payment_numerator = @apr_monthly_perc * @principal
    @payment_discount = (1 + @apr_monthly_perc) ** (@periods * -1)
    @payment_denominator = 1 - @payment_discount
    @payment_amount = @payment_numerator / @payment_denominator

    render({ :template => "calculation_templates/payment_results.html.erb"})

  end

  def blank_random_form

    render({ :template => "calculation_templates/random_form.html.erb"})

  end

  def calculate_random

    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)

    render({ :template => "calculation_templates/random_results.html.erb"})

  end

end
