class InputsController < ApplicationController
  before_action :current_user_must_be_input_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_input_user
    input = Input.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == input.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.inputs.ransack(params[:q])
    @inputs = @q.result(:distinct => true).includes(:user, :notes).page(params[:page]).per(10)

    render("input_templates/index.html.erb")
  end

  def show
    @note = Note.new
    @input = Input.find(params.fetch("id_to_display"))

    render("input_templates/show.html.erb")
  end

  def new_form
    @input = Input.new

    render("input_templates/new_form.html.erb")
  end

  def create_row
    @input = Input.new

    @input.operating_income = params.fetch("operating_income")
    @input.revenues = params.fetch("revenues")
    @input.invested_capital = params.fetch("invested_capital")
    @input.total_assets = params.fetch("total_assets")
    @input.paid_in_capital = params.fetch("paid_in_capital")
    @input.non_performing_loans_to_customers = params.fetch("non_performing_loans_to_customers")
    @input.long_term_debt = params.fetch("long_term_debt")
    @input.perished_inventory = params.fetch("perished_inventory")
    @input.customer_satisfaction = params.fetch("customer_satisfaction")
    @input.customers_acquired_last_month = params.fetch("customers_acquired_last_month")
    @input.total_customers = params.fetch("total_customers")
    @input.number_promotion_activities_last_month = params.fetch("number_promotion_activities_last_month")
    @input.number_promotion_activities_next_month = params.fetch("number_promotion_activities_next_month")
    @input.utilities_expenses = params.fetch("utilities_expenses")
    @input.rent = params.fetch("rent")
    @input.interest_expenses = params.fetch("interest_expenses")
    @input.taxes = params.fetch("taxes")
    @input.consulting_expenses = params.fetch("consulting_expenses")
    @input.other_indirect_costs = params.fetch("other_indirect_costs")
    @input.number_of_employees = params.fetch("number_of_employees")
    @input.yearly_working_days = params.fetch("yearly_working_days")
    @input.monthly_contribution_margin = params.fetch("monthly_contribution_margin")
    @input.last_month_deferred_revenues = params.fetch("last_month_deferred_revenues")
    @input.last_month_total_revenues = params.fetch("last_month_total_revenues")
    @input.total_deliveries = params.fetch("total_deliveries")
    @input.late_deliveries = params.fetch("late_deliveries")
    @input.non_compliant_deliveries = params.fetch("non_compliant_deliveries")
    @input.monthly_employee_suggestions_received = params.fetch("monthly_employee_suggestions_received")
    @input.monthly_revenues_new_products = params.fetch("monthly_revenues_new_products")
    @input.monthly_education_hours_manager = params.fetch("monthly_education_hours_manager")
    @input.monthly_education_hours_all_employees = params.fetch("monthly_education_hours_all_employees")
    @input.reference_period = params.fetch("reference_period")
    @input.date_of_entry = params.fetch("date_of_entry")
    @input.user_id = params.fetch("user_id")

    if @input.valid?
      @input.save

      redirect_back(:fallback_location => "/inputs", :notice => "Input created successfully.")
    else
      render("input_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @input = Input.find(params.fetch("prefill_with_id"))

    render("input_templates/edit_form.html.erb")
  end

  def update_row
    @input = Input.find(params.fetch("id_to_modify"))

    @input.operating_income = params.fetch("operating_income")
    @input.revenues = params.fetch("revenues")
    @input.invested_capital = params.fetch("invested_capital")
    @input.total_assets = params.fetch("total_assets")
    @input.paid_in_capital = params.fetch("paid_in_capital")
    @input.non_performing_loans_to_customers = params.fetch("non_performing_loans_to_customers")
    @input.long_term_debt = params.fetch("long_term_debt")
    @input.perished_inventory = params.fetch("perished_inventory")
    @input.customer_satisfaction = params.fetch("customer_satisfaction")
    @input.customers_acquired_last_month = params.fetch("customers_acquired_last_month")
    @input.total_customers = params.fetch("total_customers")
    @input.number_promotion_activities_last_month = params.fetch("number_promotion_activities_last_month")
    @input.number_promotion_activities_next_month = params.fetch("number_promotion_activities_next_month")
    @input.utilities_expenses = params.fetch("utilities_expenses")
    @input.rent = params.fetch("rent")
    @input.interest_expenses = params.fetch("interest_expenses")
    @input.taxes = params.fetch("taxes")
    @input.consulting_expenses = params.fetch("consulting_expenses")
    @input.other_indirect_costs = params.fetch("other_indirect_costs")
    @input.number_of_employees = params.fetch("number_of_employees")
    @input.yearly_working_days = params.fetch("yearly_working_days")
    @input.monthly_contribution_margin = params.fetch("monthly_contribution_margin")
    @input.last_month_deferred_revenues = params.fetch("last_month_deferred_revenues")
    @input.last_month_total_revenues = params.fetch("last_month_total_revenues")
    @input.total_deliveries = params.fetch("total_deliveries")
    @input.late_deliveries = params.fetch("late_deliveries")
    @input.non_compliant_deliveries = params.fetch("non_compliant_deliveries")
    @input.monthly_employee_suggestions_received = params.fetch("monthly_employee_suggestions_received")
    @input.monthly_revenues_new_products = params.fetch("monthly_revenues_new_products")
    @input.monthly_education_hours_manager = params.fetch("monthly_education_hours_manager")
    @input.monthly_education_hours_all_employees = params.fetch("monthly_education_hours_all_employees")
    @input.reference_period = params.fetch("reference_period")
    @input.date_of_entry = params.fetch("date_of_entry")
    

    if @input.valid?
      @input.save

      redirect_to("/inputs/#{@input.id}", :notice => "Input updated successfully.")
    else
      render("input_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @input = Input.find(params.fetch("id_to_remove"))

    @input.destroy

    redirect_to("/users/#{@input.user_id}", notice: "Input deleted successfully.")
  end

  def destroy_row
    @input = Input.find(params.fetch("id_to_remove"))

    @input.destroy

    redirect_to("/inputs", :notice => "Input deleted successfully.")
  end
end
