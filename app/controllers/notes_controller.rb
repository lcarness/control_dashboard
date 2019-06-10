class NotesController < ApplicationController
  def index
    @q = Note.ransack(params[:q])
    @notes = @q.result(:distinct => true).includes(:inputs).page(params[:page]).per(10)

    render("note_templates/index.html.erb")
  end

  def show
    @note = Note.find(params.fetch("id_to_display"))

    render("note_templates/show.html.erb")
  end

  def new_form
    @note = Note.new

    render("note_templates/new_form.html.erb")
  end

  def create_row
    @note = Note.new

    @note.notes = params.fetch("notes")
    @note.inputs_id = params.fetch("inputs_id")

    if @note.valid?
      @note.save

      redirect_back(:fallback_location => "/notes", :notice => "Note created successfully.")
    else
      render("note_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_input
    @note = Note.new

    @note.notes = params.fetch("notes")
    @note.inputs_id = params.fetch("inputs_id")

    if @note.valid?
      @note.save

      redirect_to("/inputs/#{@note.inputs_id}", notice: "Note created successfully.")
    else
      render("note_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @note = Note.find(params.fetch("prefill_with_id"))

    render("note_templates/edit_form.html.erb")
  end

  def update_row
    @note = Note.find(params.fetch("id_to_modify"))

    @note.notes = params.fetch("notes")
    @note.inputs_id = params.fetch("inputs_id")

    if @note.valid?
      @note.save

      redirect_to("/notes/#{@note.id}", :notice => "Note updated successfully.")
    else
      render("note_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_inputs
    @note = Note.find(params.fetch("id_to_remove"))

    @note.destroy

    redirect_to("/inputs/#{@note.inputs_id}", notice: "Note deleted successfully.")
  end

  def destroy_row
    @note = Note.find(params.fetch("id_to_remove"))

    @note.destroy

    redirect_to("/notes", :notice => "Note deleted successfully.")
  end
end
