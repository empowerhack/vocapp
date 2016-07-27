require 'rails_helper'
describe 'TermsAPI' do
  let!(:request_headers) { { 'Accept': 'application/json',
                            'Content-Type': 'application/json' } }
  let!(:term) {FactoryGirl.create(:term)}

  describe 'POST /terms' do
    it 'creates a new term' do
      new_term = FactoryGirl.build(:term)
      opts = { 'term_en': new_term.term_en,
      'term_ar': new_term.term_ar,
      'ac_field_en': new_term.ac_field_en,
      'ac_field_ar': new_term.ac_field_ar,
      'definition_en': new_term.definition_en,
      'definition_ar': new_term.definition_ar,
      'context_en': new_term.context_en,
      'context_ar': new_term.context_ar
      }
      post '/terms',
            set_term_params(opts),
            request_headers

      expect(response.status).to eq 200
      expect(Term.last.term_en).to eq new_term.term_en
      expect(Term.last.term_ar).to eq new_term.term_ar
      expect(Term.last.ac_field_en).to eq new_term.ac_field_en
    end
  end

  describe 'GET /terms' do
    it 'returns a list of terms' do
      get '/terms', {}, { 'Accept': 'application/json' }

      expect(response.status).to eq 200

      term_data = JSON.parse(response.body)

      expect(term_data[0]['term_en']).to eq term.term_en
      expect(term_data[0]['term_ar']).to eq term.term_ar
      expect(term_data[0]['ac_field_en']).to eq term.ac_field_en
    end
  end

  describe 'GET /terms/:id' do
    it 'returns an term' do
      get "/terms/#{term.id}", {}, { 'Accept': 'application/json' }

      expect(response.status).to eq 200

      term_data = JSON.parse(response.body)

      expect(term_data['term_en']).to eq term.term_en
    end
  end

  describe 'PATCH /terms/:id' do
    it 'edits an term' do
      opts = { 'term_en': 'Magnetic',
      'term_ar': term.term_ar,
      'ac_field_en': term.ac_field_en,
      'ac_field_ar': new_term.ac_field_ar,
      'definition_en': new_term.definition_en,
      'definition_ar': new_term.definition_ar,
      'context_en': new_term.context_en,
      'context_ar': new_term.context_ar
      }
      patch "/terms/#{term.id}",
            set_term_params(opts),
            request_headers

      expect(response.status).to eq 200

      expect(Term.find(term.id).term_en).to eq 'Magnetic'
    end
  end

  describe 'DELETE /terms/:id' do
    it 'deletes an term' do
      delete "/terms/#{term.id}"

      expect(response.status).to eq 200

      expect(Term.all).not_to include term
    end
  end
end
