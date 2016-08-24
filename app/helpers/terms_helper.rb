module TermsHelper

  def term_params
    if params['term']
      params['term'].permit(:term, :field_id, :user_id)
    else
      params.permit(:term, :field_id, :user_id)
    end
    # disallowed params for now
    #:term_ar, :ac_field_en, :ac_field_ar, :definition_en, :definition_ar, :context_en, :context_ar)
  end

  def get_unique(terms)
    terms.map {|t| t.term}.uniq
  end

  def search_contains_characters(params)
    match_data = params[:term] =~ /\w/
    match_data != nil
  end

  def unfiltered_results(query)
    Term.where(term: query).order(:term)
  end

  def filtered_results(field_id)
    @terms.where(field_id: field_id)
  end
end
