class ExpensesController < ApplicationController
  def index
    @q = Expense.ransack(params[:q])
    @expenses = @q.result(:distinct => true).includes(:trip, :participant).page(params[:page]).per(10)

    render("expense_templates/index.html.erb")
  end

  def show
    @expense = Expense.find(params.fetch("id_to_display"))

    render("expense_templates/show.html.erb")
  end

  def new_form
    @expense = Expense.new

    render("expense_templates/new_form.html.erb")
  end

  def create_row
    @expense = Expense.new

    @expense.trip_id = params.fetch("trip_id")
    @expense.expense_name = params.fetch("expense_name")

    if @expense.valid?
      @expense.save

      redirect_back(:fallback_location => "/expenses", :notice => "Expense created successfully.")
    else
      render("expense_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_trip
    @expense = Expense.new

    @expense.trip_id = params.fetch("trip_id")
    @expense.expense_name = params.fetch("expense_name")

    if @expense.valid?
      @expense.save

      redirect_to("/trips/#{@expense.trip_id}", notice: "Expense created successfully.")
    else
      render("expense_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @expense = Expense.find(params.fetch("prefill_with_id"))

    render("expense_templates/edit_form.html.erb")
  end

  def update_row
    @expense = Expense.find(params.fetch("id_to_modify"))

    @expense.trip_id = params.fetch("trip_id")
    @expense.expense_name = params.fetch("expense_name")

    if @expense.valid?
      @expense.save

      redirect_to("/expenses/#{@expense.id}", :notice => "Expense updated successfully.")
    else
      render("expense_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_trip
    @expense = Expense.find(params.fetch("id_to_remove"))

    @expense.destroy

    redirect_to("/trips/#{@expense.trip_id}", notice: "Expense deleted successfully.")
  end

  def destroy_row
    @expense = Expense.find(params.fetch("id_to_remove"))

    @expense.destroy

    redirect_to("/expenses", :notice => "Expense deleted successfully.")
  end
end
