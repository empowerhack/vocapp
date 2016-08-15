module TermsHelper

  def term_params
    params.permit(:term_en, :field_id)
    # disallowed params for now
    #:term_ar, :ac_field_en, :ac_field_ar, :definition_en, :definition_ar, :context_en, :context_ar)
  end

  def search_contains_characters(params)
    match_data = params[:term_en] =~ /\w/
    match_data != nil
  end

  def unfiltered_results(query)
    Term.where(term_en: query).order(:term_en)
  end

  def filtered_results(field_id)
    @terms.where(field_id: field_id)
  end

end
