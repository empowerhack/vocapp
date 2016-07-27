module TermsHelper
    def term_params
      params.require(:term).permit(:term_en, :term_ar, :ac_field_en, :ac_field_ar, :definition_en, :definition_ar, :context_en, :context_ar)
    end
end
